import 'package:flutter/material.dart';
import 'package:lgbtq_plus_conect/dummy_data.dart';

import 'chat_detail.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: SearchBox(),
            ),
            ListView.builder(
              itemCount: conversations.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var conversation = conversations[index];
                conversation.messages.sort((a, b) {
                  return a.time.compareTo(b.time);
                });
                var lastMsg = conversation.messages[0];
                return ConversationList(
                  name: conversations[index].user.name,
                  messageText: lastMsg.content,
                  imageUrl: conversation.user.avatarUrl,
                  time: lastMsg.time,
                  isMessageRead: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ChatDetailPage();
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search in conversation...",
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade600,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade100)),
      ),
    );
  }
}

class Conversation {
  User user;
  List<Message> messages;
  String lastMessageTime;
  Conversation({
    required this.user,
    required this.messages,
    required this.lastMessageTime,
  });
}

class Message {
  String sender;
  String time;
  String content;
  String imgUrl;

  Message({
    required this.sender,
    required this.time,
    required this.content,
    required this.imgUrl,
  });
}

class User {
  String uuid;
  String username;
  String name;
  String avatarUrl;
  String description;
  String? bioSex;
  String? psySex;

  User({
    required this.uuid,
    required this.username,
    required this.name,
    required this.avatarUrl,
    required this.description,
  });
}
