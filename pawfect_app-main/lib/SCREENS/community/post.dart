import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
   final String name; 
   final String postId;
  final String imageUrl;
  final String description;
  // ignore: prefer_typing_uninitialized_variables
  final Timestamp timestamp;
  final String profImage;
  
  


  Post({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.timestamp,
        required this.profImage, 
       required this.postId,
      
  });
factory Post.fromSnapshot(DocumentSnapshot snapshot) {
  Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  
  return Post(
name: data['name'] ?? '',
    imageUrl: data['imageUrl'] ?? '',
    description: data['description'] ?? '',
    timestamp: data['timestamp'] ?? Timestamp.now(),
    profImage: data['profImage'] ?? '', // Retrieve profile image URL
    postId: data['postId']??'',
    
  );
}      


}
