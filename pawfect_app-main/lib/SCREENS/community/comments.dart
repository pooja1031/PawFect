import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 
class ScreenComments extends StatefulWidget {
   final String username;
  final String postId; // Add this

  const ScreenComments({Key? key, required this.username, required this.postId})
      : super(key: key);
  @override
  State<ScreenComments> createState() => _ScreenCommentsState();
}

class _ScreenCommentsState extends State<ScreenComments> {
    final TextEditingController commentEditingController =
      TextEditingController();
//
     void postComment(String postId, String commentText) async {
      User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
    String uid = user.uid;
    String username = user.displayName ?? '';
    
    try {
      // Generate a unique commentId for this comment
      String commentId = FirebaseFirestore.instance.collection('posts').doc().id;

      // Reference to the post document
      DocumentReference postRef = FirebaseFirestore.instance.collection('posts').doc(widget.postId);

      // Save the comment data to the subcollection 'comments'
      
      await postRef.collection('comments').doc(commentId).set({
        'uid': uid,
        'name': username,
        'text': commentText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the comment text field
      commentEditingController.clear();
    } catch (error) {
      print('Error posting comment: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while posting the comment'),
        ),
      );
    }
  }
}


void postReply(String postId, String commentId, String replyText) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    String username = user.displayName ?? '';

    try {
      // Generate a unique replyId for this reply
      String replyId = FirebaseFirestore.instance.collection('posts').doc().id;

      // Reference to the reply document
      DocumentReference replyRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .collection('replies')
          .doc(replyId);

      // Save the reply data to the subcollection 'replies'
      await replyRef.set({
        'uid': uid,
        'name': username,
        'text': replyText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the reply text field
      // You may also update the UI to display the new reply immediately
    } catch (error) {
      print('Error posting reply: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while posting the reply'),
        ),
      );
    }
  }
}



  @override
  Widget build(BuildContext context) {
     print('postId: ${widget.postId}'); // Add this line

    return SafeArea(
      child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 205, 189, 175),
    
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text("Comments"),
        ),
        body:Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 216, 188, 170),    
                Color.fromARGB(255, 207, 235, 209), // End color (you can change it to your preference)
              ],
            ),
          ),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.postId) // Use widget.postId to access the postId
          .collection('comments')
          .orderBy('timestamp', descending: true)
          .snapshots(),
               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) { // Explicitly specify the expected type
           print('Snapshot: ${snapshot.data?.docs}'); // Add this line
           if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Text('Error fetching comments');
              }
            
            
            
              if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
              }
            
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) { // Add null check using ! to access docs
          return Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text("No comments yet.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          );
              }
            
              var comments = snapshot.data!.docs;
            
              return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            var commentData = comments[index].data() as Map<String, dynamic>;
            
             Timestamp timestamp = commentData['timestamp'];
              DateTime commentTime = timestamp.toDate();
              
              // Format the DateTime as per your requirements
              String formattedTime = DateFormat.yMMMd().add_jm().format(commentTime);
            
            return Column(
          children: [
            
             ListTile(
                title: Text(commentData['name']),
                subtitle: Text(commentData['text']),
                trailing: Text(
                  formattedTime, // Display the formatted timestamp
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
              ),
            
            
          const  Divider(
              height: 20,
            ), // Add a Divider after each comment
            
          ],
              );
          },
              );
              
              },
            ),
        ),
    
         bottomNavigationBar: SafeArea(
          child: Container(
            decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                                 Color.fromARGB(255, 161, 155, 151),    

                 Color.fromARGB(255, 219, 194, 178),    
                Color.fromARGB(255, 177, 211, 177), 
              ],
            ),
          ),
            height: kToolbarHeight,
            margin:
                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              children: [
              //  const CircleAvatar(
              //     backgroundImage: NetworkImage(widget.post.profImage),
              //     radius: 18,
              //   ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: TextField(
                      
                      controller: commentEditingController,
                      decoration: InputDecoration(
                        hintText: 'Comment as  ${widget.username}',hintStyle: TextStyle(color: Color.fromARGB(255, 126, 117, 117),fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get the text from the comment text field
      String commentText = commentEditingController.text.trim();
    
      // Check if the comment is not empty
      if (commentText.isNotEmpty) {
        // Call the function to post the comment
        postComment(widget.postId, commentText);
      }
                  },
                  
                  child: Container(
                    color: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: const Text(
                      'Post',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                )
            ],
            ),
          ),
        )
      ),
    );
    
  }
}