
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawfect/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class ScreenAddPost extends StatefulWidget {
  final Uint8List? selectedProfileImage;
    final String postId; // Add this line


  const ScreenAddPost({Key? key, this.selectedProfileImage,required this.postId}) : super(key: key);


  @override
  State<ScreenAddPost> createState() => _ScreenAddPostState();
}

class _ScreenAddPostState extends State<ScreenAddPost> {
Uint8List? _file;
  TextEditingController _descriptionController = TextEditingController();
  bool _IsLoading = false; // New state variable to track posting state


_selectImage(BuildContext context)async{
  return showDialog(context: context, builder: (context){
   return SimpleDialog(
    
    title: const Text("Create a Post"),
    children: [
      SimpleDialogOption(
        padding: EdgeInsets.all(20),
        child: Text("Take a photo"),
        onPressed: ()async{
          Navigator.of(context).pop();
          Uint8List file = await pickImage(ImageSource.camera);
          setState(() {
            _file=file;
          });
        },
      ),
       SimpleDialogOption(
        padding: EdgeInsets.all(20),
        child: Text("choose from gallery "),
        onPressed: ()async{
          Navigator.of(context).pop();
          Uint8List file = await pickImage(ImageSource.gallery);
          setState(() {
            _file=file;
          });
        },
      ),
       SimpleDialogOption(
        padding: EdgeInsets.all(20),
        child: Text("cancel"),
        onPressed: ()async{
          Navigator.of(context).pop();
          Uint8List file = await pickImage(ImageSource.camera);
          setState(() {
            _file=file;
          });
        },
      )
    ],
   ) ;
  });
}

Future<String> uploadImageToStorage(Uint8List imageBytes) async {
  final Reference storageRef = FirebaseStorage.instance.ref();
  final Reference imageRef =
      storageRef.child('post_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

  try {
    // Upload the image
    await imageRef.putData(imageBytes);

    // Get the download URL for the uploaded image
    String imageUrl = await imageRef.getDownloadURL();
    return imageUrl;
  } catch (error) {
    print('Error uploading image: $error');
    return '';
  }
}




//   void postToFirestore(String description) async {
//   // Get the current user's information
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     String uid = user.uid;
//     String username = user.displayName ?? '';
//     String profImage = user.photoURL ?? '';
//     String phoneNumber = user.phoneNumber ?? '';

//     setState(() {
//       _IsLoading = true;
//     });

//     try {
//       // Upload the image to storage and get the image URL
//       String uploadedImageUrl = await uploadImageToStorage(_file!);

//       // Create a new document reference without specifying a document ID
//       CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');
//       DocumentReference newPostRef = postsCollection.doc();

//       // Access the generated post ID
//       String postId = newPostRef.id;

//       // Save the post data to the database, including the postId as a field
//       await newPostRef.set({
//         'uid': uid,
//         'name': username,
//         'phoneNumber': phoneNumber,
//         'profImage': profImage,
//         'description': description,
//         'imageUrl': uploadedImageUrl,
//         'timestamp': FieldValue.serverTimestamp(),
//         'datePublished': DateTime.now(),
//         'postId': postId, // Include postId in the data
//       });

//       // Now the 'postId' field will be stored in the Firestore document

//       // Clear the image and description fields
//       _file = null; // Reset the image
//       _descriptionController.clear();

//       setState(() {
//         _IsLoading = false;
//       });

//       // Show a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Post uploaded successfully'),
//         ),
//       );
//     } catch (error) {
//       // Handle any errors that might occur during image upload or database write
//       print('Error posting image: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('An error occurred while posting the image'),
//         ),
//       );
//     }
//   } else {
//     setState(() {
//       _IsLoading = false;
//     });
//     print('User is not authenticated.');
//     // Handle the case where the user is not authenticated
//   }
// }



void postToFirestore(String description) async {
  // Get the current user's information
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    String username = user.displayName ?? '';
    String profImage = user.photoURL ?? '';
    String phoneNumber = user.phoneNumber ?? '';
    

    setState(() {
      _IsLoading = true;
    });

    try {
      DocumentSnapshot userDataSnapshot =
          await FirebaseFirestore.instance.collection('userData').doc(uid).get();

      String profImage = userDataSnapshot.get('profileImage') ?? '';
      // Upload the image to storage and get the image URL
      String uploadedImageUrl = await uploadImageToStorage(_file!);

      // Generate a new postId
      String postId = FirebaseFirestore.instance.collection('posts').doc().id;

      // Save the post data to Firestore
      await FirebaseFirestore.instance.collection('posts').doc(postId).set({
        'uid': uid,
        'name': username,
        'phoneNumber': phoneNumber,
        'profImage': profImage, // Include the user's profile image URL
        'description': description,
        'imageUrl': uploadedImageUrl,
        'timestamp': FieldValue.serverTimestamp(),
        'datePublished': DateTime.now(),
        'postId': postId, // Include postId in the data
      });

      // Clear the image and description fields
      _file = null; // Reset the image
      _descriptionController.clear();

      setState(() {
        _IsLoading = false;
      });

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Post uploaded successfully'),
        ),
      );
    } catch (error) {
      // Handle any errors that might occur during image upload or database write
      print('Error posting image: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while posting the image'),
        ),
      );
    }
  } else {
    setState(() {
      _IsLoading = false;
    });
    print('User is not authenticated.');
    // Handle the case where the user is not authenticated
  }
}


  
  @override
  Widget build(BuildContext context) {
        final selectedImageProvider = Provider.of<SelectedImageProvider>(context);

    return selectedImageProvider.selectedImage == null
        ? Material(
            child: IconButton(
              onPressed: () => _selectImage(context),
              icon: Icon(Icons.upload),
            ),
          )
    : SafeArea(
      child: Scaffold(
        appBar:
        
         AppBar(
          toolbarHeight: 90,
          title: const Text('Post to'),
          actions: [
            
    TextButton(
                          onPressed: () async {
                            if (_descriptionController.text.isNotEmpty) {
                              // setState(() {
                              //   _isPosting = true;
                              // });
                              postToFirestore(_descriptionController.text);
                              // setState(() {
                              //   _isPosting = false;
                              // });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please enter a description'),
                              ));
                            }
                          },
      child: const Text(
      'Post',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    )
          ],
        ),
        
        body: Container(
           decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                                               Color.fromARGB(255, 222, 214, 207),
    
               // Color.fromARGB(255, 28, 163, 41),    // Ending color
                Color.fromARGB(255, 189, 235, 193), // Starting color
    
              ],
            ),
          ),
          child: Column(
            children: [
             _IsLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue, // Change this to your desired color
                              ),
                            ),
                          )
                        
              :Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                     backgroundImage: MemoryImage(
                              selectedImageProvider.selectedImage!),
                  ),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.3 ,
                    child:  TextField(
                      controller: _descriptionController,
                      decoration:  const InputDecoration(
                        hintText: "Share your thoughts",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                //  SizedBox(
                //   height: 45,
                //   width: 45,
                //   child: AspectRatio(aspectRatio: 487/451,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: NetworkImage("https://unblast.com/wp-content/uploads/2021/01/Space-Background-Images.jpg"),
                //         fit: BoxFit.fill,
                //         alignment: FractionalOffset.topCenter)
        
                //     ),
                //   ),
                //   ),
                //  ),
                IconButton(onPressed: () => _selectImage(context), icon: Icon(Icons.library_add)),
                  Divider()
                ],
              ),
              Container(
               height: 250,
               width:350,
               color: Colors.grey,
                child: _file != null
          ? Image.memory(
              _file!,
              fit: BoxFit.cover,
            )
          : null,
               
              ),
            ],
          ),
        ),
      ),
    );
  }
  

}