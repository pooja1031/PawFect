import 'package:flutter/material.dart';


class MessagesScreen extends StatefulWidget {
    final List messages;

  const MessagesScreen({Key? key,required this.messages}): super(key:key);


  @override
  State<MessagesScreen> createState() => _MessagesScreenState();

  
}

class _MessagesScreenState extends State<MessagesScreen> {

 
  @override
  Widget build(BuildContext context) {
        var w = MediaQuery.of(context).size.width;

    return  ListView.separated(
      itemBuilder:(context,index){
      return Container(
        margin:EdgeInsets.all(10) ,
        child: Row(
          mainAxisAlignment:widget.messages[index]['isUserMessage']?MainAxisAlignment.end:MainAxisAlignment.start,
          mainAxisSize:MainAxisSize.min ,
          children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 23, horizontal: 23),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(
                                      widget.messages[index]['isUserMessage'] ? 0 : 20),
                                  topLeft: Radius.circular(
                                      widget.messages[index]['isUserMessage'] ? 20 : 0),
                                ),
                                color: widget.messages[index]['isUserMessage']
                                    ? Color.fromARGB(255, 145, 165, 138)
                                    // Color.fromARGB(255, 161, 192, 150)
                                    : Color.fromARGB(255, 189, 162, 179).withOpacity(0.8)
                            ),
                            constraints: BoxConstraints(maxWidth: w * 3.2 / 3.7),
                            child:
                            Text(widget.messages[index]['message'].text.text[0],style: TextStyle(fontSize: 18),)),
                      ],
          
        ),
      );
    } , separatorBuilder: (_ , i)=>Padding(padding: EdgeInsets.only(top:10)), itemCount: widget.messages.length);
  }
}




