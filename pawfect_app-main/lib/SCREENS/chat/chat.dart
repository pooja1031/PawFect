import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'messages.dart';

class ScreenChatBot extends StatefulWidget {
  const ScreenChatBot({super.key});

  @override
  State<ScreenChatBot> createState() => _ScreenChatBotState();
}

class _ScreenChatBotState extends State<ScreenChatBot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 205, 189, 175),
            // Color.fromARGB(255, 139, 120, 103),

            appBar: AppBar(
              toolbarHeight: 90,
              title: const Padding(
                padding: EdgeInsets.only(left: 109.0, ),
                child: Text(
                  //"Go ahead and ask\nMe Your Questions ?",
                  "VetExpert",
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 233, 233, 233),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Container(
              decoration:const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
                Color.fromARGB(255, 185, 213, 188), 
                Color.fromARGB(255, 178, 164, 155),    

         
          ],
        ),
        ),
              child: Column(
                children: [
                  Expanded(child: MessagesScreen(messages: messages)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    color: Color.fromARGB(255, 161, 147, 135),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: _controller,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 235, 233, 233),
                              fontSize: 21),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(
                                      255, 5, 5, 5)), // Change the color here
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 11,
                                      11)), // Change the color here
                            ),
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              sendMessage(_controller.text);
                              _controller.clear();
                              FocusScope.of(context).unfocus();
                            },
                            icon: Icon(Icons.send)),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
