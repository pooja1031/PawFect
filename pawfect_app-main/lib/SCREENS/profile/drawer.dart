import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pawfect/SCREENS/profile/my_list_tile.dart';

class myDrawer extends StatelessWidget {
    final void Function()? onprofileTap;
      final void Function()? onaboutTap;
        //final void Function()? onsignoutTap;



  const myDrawer({super.key,required this.onprofileTap,required this.onaboutTap,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:   const Color.fromARGB(255, 205, 189, 175),

     child: Container(
      decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 //Color.fromARGB(255, 123, 104, 87),  
               // Color.fromARGB(255, 244, 228, 208),
                 Color.fromARGB(255, 140, 125, 114),    
                Color.fromARGB(255, 154, 195, 157), 

              ],
            ),
          ),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
          children: [ DrawerHeader(child: Icon(Icons.person,color: Colors.black,size: 60,),
          
          ),
          MyListTile(icon: Icons.home, text: 'H O M E ',onTap: ()=>Navigator.pop(context),),
          MyListTile(icon: Icons.person, text: 'P R O F I L E', onTap: onprofileTap),
          MyListTile(icon: Icons.auto_stories, text:'A B O U T', onTap: onaboutTap),
          ],
         ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom:25.0),
          //   child: MyListTile(icon: Icons.logout, text:'L O G O U T', onTap: onsignoutTap),
          // ),
     
        ],
       ),
     ),





    );
  }
}