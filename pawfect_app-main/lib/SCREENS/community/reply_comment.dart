// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ReplySection extends StatefulWidget {
//   final String postId;
//   final String commentId;
//   final Function(String, String, String) postReply;

//   ReplySection({
//     required this.postId,
//     required this.commentId,
//     required this.postReply,
//   });

//   @override
//   State<ReplySection> createState() => _ReplySectionState();
// }

// class _ReplySectionState extends State<ReplySection> {
//   final TextEditingController replyEditingController = TextEditingController();

// bool showReplies = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Add button/icon to show/hide replies if needed
//         // ...

// TextButton(
//       onPressed: () {
//         setState(() {
//           showReplies = !showReplies;
//         });
//       },
//       child: Text(showReplies ? 'Hide Replies' : 'Show Replies'),
//     ),

//     // Display replies if showReplies is true
//     if (showReplies)
//       StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('posts')
//             .doc(widget.postId)
//             .collection('comments')
//             .doc(widget.commentId)
//             .collection('replies')
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> replySnapshot) {
    






//             if (replySnapshot.hasError) {
//               return Text('Error fetching replies');
//             }

//             if (replySnapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             }

//             if (!replySnapshot.hasData || replySnapshot.data!.docs.isEmpty) {
//               return Text("No replies yet.");
//             }

//             var replies = replySnapshot.data!.docs;

//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: replies.length,
//               itemBuilder: (context, index) {
//                 var replyData = replies[index].data() as Map<String, dynamic>;

//                 return ListTile(
//                   title: Text(replyData['name']),
//                   subtitle: Text(replyData['text']),
//                   trailing: Text(
//                     "Time Ago", // Replace with formatted time
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),

//         // Add a text input field and submit button for replies
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: replyEditingController,
//                   decoration: InputDecoration(
//                     hintText: 'Reply...',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.send),
//                 onPressed: () {
//                   String replyText = replyEditingController.text.trim();
//                   if (replyText.isNotEmpty) {
//                     widget.postReply(widget.postId, widget.commentId, replyText);
//                     replyEditingController.clear();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }




