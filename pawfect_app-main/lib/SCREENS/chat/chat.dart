import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart'as http;
import 'const.dart';
import 'model.dart';

class ScreenChatBot extends StatefulWidget {
  const ScreenChatBot({super.key});

  @override
  State<ScreenChatBot> createState() => _ScreenChatBotState();
}

class _ScreenChatBotState extends State<ScreenChatBot> {
  late bool isLoading;
  final TextEditingController _textController = TextEditingController();

  final _scrollController =ScrollController();
  final List<ChatMessage> _messages=[];//to identify which message is comes from user and which comes from chatbot



   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading =false;
  }


  //api function call
  //http requst accept the user input
  Future<String>generateResponse(String prompt)async{
    final apikey = apiScretkey;
    // ignore: unused_local_variabl
    var url = Uri.https("api.openai.com","/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type':'application/json',
        'Authorization':'Bearer $apikey'
      },
      body: jsonEncode({
        'model':'text-davinci-003',
        'prompt':prompt,
        'temperature':0,
        'max_token':2000,
        'top_p':1,
        'frequency_penalty':0.0,
        'presence_penalty':0.0
      })
    );
    //decode the response (see the content of responsw we need to decode)
    //use json response from http reqst
      Map<String,dynamic>newresponse =jsonDecode(response.body);
      return newresponse['choices'][0]['text'];
    
      }
      //----------------------------
//       Future<String> generateResponse(String prompt) async {
//   final apikey = apiScretkey;
//   var url = Uri.https("api.openai.com", "/v1/completions");
//   final response = await http.post(
//     url,
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $apikey'
//     },
//     body: jsonEncode({
//       'model': 'text-davinci-003',
//       'prompt': prompt,
//       'temperature': 0,
//       'max_token': 2000,
//       'top_p': 1,
//       'frequency_penalty': 0.0,
//       'presence_penalty': 0.0
//     }),
//   );

//   if (response.statusCode == 200) {
//     Map<String, dynamic> newresponse = jsonDecode(response.body);
//     if (newresponse.containsKey('choices') && newresponse['choices'] is List) {
//       final choices = newresponse['choices'] as List;
//       if (choices.isNotEmpty && choices[0].containsKey('text')) {
//         return choices[0]['text'];
//       }
//     }
//     return "No valid response from API";
//   } else {
//     print("API request failed with status code: ${response.statusCode}");
//     return "Error occurred while fetching response";
//   }
// }

      //------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 205, 189, 175),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                title: const Padding(
                  padding: EdgeInsets.only(left: 14.0, top: 11),
                  child: Text(
                    "Go ahead and ask\nMe Your Questions ?",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            body: Column(children: [
              //chat body
             Expanded(child: _buildlist()),

                Visibility(
                  visible: isLoading,
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )),
                const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  //INPUT FIELD
                  _buildInput(),
                  //SUBMIT
                  _buildSubmit(),
                      ])])));
  }


  Expanded _buildInput(){
    return Expanded(child: TextField(
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: Colors.white),
      controller:_textController ,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        filled: true,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    ));
  }


    Widget _buildSubmit(){
    return  Visibility(
      visible: !isLoading,
      child: Container(
        color: Colors.grey,
        child: IconButton(onPressed: (){
         //display user input
          setState(() {
            _messages.add(ChatMessage(text: _textController.text, chatMessageType: ChatMessageType.user));
            isLoading= true;
          });
          var input = _textController.text;
          _textController.clear();
          Future.delayed(Duration(milliseconds: 50)).then((value) => _scrollDown());
          //call chatbot api
          generateResponse(input).then((value) {
            setState(() {
              isLoading =false;
              //display chatbot response
              _messages.add(ChatMessage(text: value, chatMessageType: ChatMessageType.bot));
            });
          });
            _textController.clear();
            Future.delayed(Duration(milliseconds: 50)).then((value) => _scrollDown());
        }, icon:Icon(Icons.send_rounded,color: Colors.black,) ),));
  }
  
  //scrolling after the user input
    void _scrollDown(){
    _scrollController.animateTo( _scrollController.position.maxScrollExtent,duration: Duration(milliseconds: 300), curve: Curves.easeOut,);

  }





   ListView _buildlist(){
    return ListView.builder(itemCount: _messages.length,controller: _scrollController,itemBuilder: ((context,index){
      var  message =_messages[index];
      return ChatMessageWidget(
        text:message.text,
        chatMessageType:message.chatMessageType,

      );
    }));
  }
}





class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  const ChatMessageWidget({super.key,required this.text,required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      color: chatMessageType==ChatMessageType.bot?botbackgroundcolor:backgroundcolor,
      child: Row(
        children: [
          chatMessageType== ChatMessageType.bot?Container(margin: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(16, 163, 127, 1),
            child: Image.asset("assets/Images/chatbot (1).png",color: Colors.white,scale: 1.5,),
          ),)
       :Container(
        margin: EdgeInsets.only(right: 16),
        child: CircleAvatar(
          child: Icon(Icons.person),
        ),
       ),
       Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8),
              )
            ),
            child: Text(
              text,
              style: Theme.of(context)
              .textTheme
              .bodyLarge
               ?.copyWith(color:Colors.white),
               ),
          )
        ],
       ))
        ],
      ),
    );
  }
}