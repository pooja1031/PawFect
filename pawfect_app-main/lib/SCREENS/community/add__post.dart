// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// import '../../providers/user_provider.dart';
// import '../../utils/utils.dart';

// class ScreenAddPosts extends StatefulWidget {
//   const ScreenAddPosts({super.key});

//   @override
//   State<ScreenAddPosts> createState() => _ScreenAddPostsState();
// }

// class _ScreenAddPostsState extends State<ScreenAddPosts> {
//   Uint8List? _file;
//   TextEditingController _descriptionController = TextEditingController();
// bool _isLoading =false;

// Future<String> uploadImageToStorage(Uint8List imageBytes) async {
//   final Reference storageRef = FirebaseStorage.instance.ref();
//   final Reference imageRef =
//       storageRef.child('post_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

//   try {
//     // Upload the image
//     await imageRef.putData(imageBytes);

//     // Get the download URL for the uploaded image
//     String imageUrl = await imageRef.getDownloadURL();
//     return imageUrl;
//   } catch (error) {
//     print('Error uploading image: $error');
//     return '';
//   }
// }



// _selectImage(BuildContext context)async{
//   return showDialog(context: context, builder: (context){
//    return SimpleDialog(
    
//     title: const Text("Create a Post"),
//     children: [
//       SimpleDialogOption(
//         padding: EdgeInsets.all(20),
//         child: Text("Take a photo"),
//         onPressed: ()async{
//           Navigator.of(context).pop();
//           Uint8List file = await pickImage(ImageSource.camera);
//           setState(() {
//             _file=file;
//           });
//         },
//       ),
//        SimpleDialogOption(
//         padding: EdgeInsets.all(20),
//         child: Text("choose from gallery "),
//         onPressed: ()async{
//           Navigator.of(context).pop();
//           Uint8List file = await pickImage(ImageSource.gallery);
//           setState(() {
//             _file=file;
//           });
//         },
//       ),
//        SimpleDialogOption(
//         padding: EdgeInsets.all(20),
//         child: Text("cancel"),
//         onPressed: ()async{
//           Navigator.of(context).pop();
//           Uint8List file = await pickImage(ImageSource.camera);
//           setState(() {
//             _file=file;
//           });
//         },
//       )
//     ],
//    ) ;
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//        final selectedImageProvider = Provider.of<SelectedImageProvider>(context);

//     return selectedImageProvider.selectedImage == null
//         ? Material(
    
//         )
    
//     :Scaffold(
//       appBar: AppBar(
//         title: const Text('Post to'),
//         actions: [
// TextButton(
//   onPressed: () {
//     // if (_descriptionController.text.isNotEmpty) {
//     //   postToFirestore(_descriptionController.text);
//     // } else {
//     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     //     content: Text('Please enter a description'),
//     //   ));
//     // }
//   },
//   child: const Text(
//     'Post',
//     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//   ),
// )
//         ],
//       ),
//       body: Column(
//         children: [
//           _isLoading?const LinearProgressIndicator()
//           : const Padding(padding: EdgeInsets.only(top:0)),
//           const Divider(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                  backgroundImage: MemoryImage(
//                           selectedImageProvider.selectedImage!),
//               ),
//               SizedBox(
//                 width:MediaQuery.of(context).size.width*0.3 ,
//                 child:  TextField(
//                   controller: _descriptionController,
//                   decoration:  InputDecoration(
//                     hintText: "Share your thoughts",
//                     border: InputBorder.none,
//                   ),
//                   maxLines: 8,
//                 ),
//               ),
//             //  SizedBox(
//             //   height: 45,
//             //   width: 45,
//             //   child: AspectRatio(aspectRatio: 487/451,
//             //   child: Container(
//             //     decoration: BoxDecoration(
//             //       image: DecorationImage(
//             //         image: NetworkImage("https://unblast.com/wp-content/uploads/2021/01/Space-Background-Images.jpg"),
//             //         fit: BoxFit.fill,
//             //         alignment: FractionalOffset.topCenter)

//             //     ),
//             //   ),
//             //   ),
//             //  ),
//             IconButton(onPressed: () => _selectImage(context), icon: Icon(Icons.library_add)),
//               Divider()
//             ],
//           ),
//           Container(
//            height: 250,
//            width:350,
//            color: Colors.grey,
//             child: _file != null
//       ? Image.memory(
//           _file!,
//           fit: BoxFit.cover,
//         )
//       : null,
           
//           ),
//         ],
//       ),
//     );
//   }
// }