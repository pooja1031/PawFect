import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawfect/SCREENS/profile/edit.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Future<Map<String, dynamic>> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userUid = user.uid;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('userData')
          .doc(userUid)
          .get();

      // Return the user data as a map
      return snapshot.data() as Map<String, dynamic>;
    } else {
      // Handle the case where the user is not authenticated or data is not available
      return {};
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
             backgroundColor:    const Color.fromARGB(255, 205, 189, 175),
    
    
        appBar: AppBar(
          toolbarHeight: 80,
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text('Profile',style: TextStyle(fontSize: 28),),
          ),
          
        ),
        
        body: Container(
           decoration:const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
                                           Color(0xFFE6E1DD),

           // Color.fromARGB(255, 28, 163, 41),    // Ending color
            Color.fromARGB(255, 200, 234, 203), // Starting color

          ],
        ),
        ),
          
          child: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Column(
              children: [
                CircleAvatar( // Circular avatar
                  backgroundImage: AssetImage('assets/Images/mittu.jpeg'), // Provide your avatar image
                radius: 60,),
                          SizedBox(height: 16), // Add some spacing between the avatar and the list
                  
                Expanded(
                  child: FutureBuilder(
                    future: fetchUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is loading, display a loading indicator or message
                        return Center(
                          child: CircularProgressIndicator(), // You can use any loading widget
                        );
                      } else if (snapshot.hasError) {
                        // Handle any errors that occurred during data retrieval
                        return Center(
                          child: Text('Error loading user data.'),
                        );
                      } else {
                        // Once data is loaded, you can access it from the snapshot
                        Map<String, dynamic> userData =
                            snapshot.data as Map<String, dynamic>;
                        // Create a list of ListTile widgets to display the data
                        List<Widget> listTiles = [
                         
                          ListTile(
                           leading: Icon(Icons.person,color: Colors.black,size: 25,),
                            title: Text('Name:   ${userData['name']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                            trailing: IconButton(onPressed: (){ Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  EditProfileScreen(currentDogName: '', currentName: '',)),
                );}, icon: Icon(Icons.edit)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.phone,color: Colors.black,size: 25,),
                            title: Text('Mobile: ${userData['phoneNumber']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.pets,color: Colors.black,size: 25,),
                            title: Text('Dog Name: ${userData['dogName']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                            trailing: IconButton(onPressed: (){
                              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  EditProfileScreen(currentDogName: '', currentName: '',)),
                );
                            }, icon: Icon(Icons.edit)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Image.asset(
                              'assets/Images/breed.png', 
                              width: 34, 
                              height: 34, 
                            ),
                            //Icon(Icons.pets_outlined),
                            title: Text('Breed: ${userData['breed']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          ),
                          Divider(),
                          ListTile(
                            leading:Image.asset(
                              'assets/Images/male.png', 
                              width: 34, 
                              height: 34, 
                            ),
                            // Icon(Icons.person),
                            title: Text('Gender: ${userData['gender']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          ),
                          Divider(),
                          ListTile(
                            leading: Image.asset(
                              'assets/Images/bone.png', 
                              width: 34, 
                              height: 34, 
                            ),
                            // Icon(Icons.cake),
                            title: Text('Age: ${userData['age']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          ),
                          Divider(),
                          // Add more ListTile widgets for other user data as needed
                        ];
                
                        // Create a ListView.builder to display the list of ListTiles
                        return ListView.builder(
                          itemCount: listTiles.length,
                          itemBuilder: (context, index) {
                            return listTiles[index];
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
