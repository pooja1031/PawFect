import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawfect/SCREENS/community/comments.dart';
import 'package:pawfect/SCREENS/community/post.dart';
import 'package:pawfect/SCREENS/profile/profile.dart';

class PostCard extends StatefulWidget {
    final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {


String getTimeAgo(DateTime timestamp) {
  final now = DateTime.now();
  final difference = now.difference(timestamp);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} secs ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} mins ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hrs ago';
  } else {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(timestamp);
  }
}




// Add this function to your _PostCardState class
void deletePost(String postId) {
  // Implement post deletion logic here
  // Remove the post from Firestore and update the UI
  FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .delete()
      .then((_) {
    // Post deleted successfully, update the UI or show a confirmation message
  }).catchError((error) {
    // Handle errors, e.g., show an error message
    print('Error deleting post: $error');
  });
}





  
  @override
  Widget build(BuildContext context) {
    
// ignore: unused_local_variable
String postId = FirebaseFirestore.instance.collection('posts').doc().id;

    return Container(
      color:
      // const Color.fromARGB(255, 205, 189, 175),
      Colors.white.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16
            ).copyWith(right: 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){ Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyProfile(),
 
      ),
    );},
                  child: CircleAvatar(
                    radius: 22,
                  backgroundImage: NetworkImage(widget.post.profImage), // Use the profImage URL
                  ),
                ),
                Expanded(child: Padding(padding:const EdgeInsets.only(left:8),
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
GestureDetector(
  onTap: (){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyProfile(),
      ),
    );

  },
  child:   Text(
  
     widget.post.name, 
  
    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17),
  
  ),
),                  ],
                ) ,
                )),
               IconButton(
  onPressed: () {
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor:         const Color.fromARGB(255, 205, 189, 175),

          child: ListView(
            
            padding: const EdgeInsets.symmetric(vertical: 16),
            shrinkWrap: true,
            children: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child:const Text('Delete',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                onTap: () {
                  if (widget.post.postId.isNotEmpty) {
                    // Call the deletePost function with the post's ID
                    deletePost(widget.post.postId);
                    Navigator.pop(context); // Close the dialog
                  } else {
                    // Handle the case where postId is empty
                    print('Post ID is empty.');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  },
  icon:const Icon(Icons.more_vert),
)

              ],
              
            ),
           
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.35,
            width: double.infinity,
            child: Image.network(widget.post.imageUrl, fit: BoxFit.cover),
    

          
          ),
          Row(
            children: [
             
                          IconButton(onPressed: (){            
                             Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenComments( username: widget.post.name,
      postId: widget.post.postId , 
      ),
      ),
    );
}, icon: const Icon(Icons.comment_outlined,),iconSize: 30,),
// Expanded(child: Align(
//   alignment: Alignment.bottomRight,
//   child: 
 // IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border,color: Colors.black,)),
Text(
        getTimeAgo(widget.post.timestamp.toDate()), // Display time ago
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),


            ],
          ),
          //Description no:of comments
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      //Text('$listLength likes', style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  width: double.infinity,
                  padding:  EdgeInsets.only(top:8),
                  child:RichText(text: TextSpan(style:const TextStyle(color:Colors.black),
                  children: [TextSpan(text:'${widget.post.name}',style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                                         TextSpan(text: '  ${widget.post.description}'), // Display the description here

                  ]
                  ) ,
                  ),
                ),
                InkWell(
                  onTap: (){
                        Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenComments( username: widget.post.name,
      postId: widget.post.postId , 
      ),
      ),
    );

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical:4 ),
                    child:Text("view all comments",style:TextStyle(fontSize: 16,color:Colors.grey,
                   // Colors.grey 
                    ))
                  ),
                ),
                Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          DateFormat('dd/MM/yyyy').format(widget.post.timestamp.toDate()), // Format date as 'MM/dd/yyyy'
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),),
       Container(
  width: double.infinity, // This makes the divider span the full width of its parent
  child: Divider(
    thickness: 2, // You can adjust the thickness as needed
  ),
)


     //   Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }}