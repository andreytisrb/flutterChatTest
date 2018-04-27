import 'package:flutter/material.dart';
import 'ChatMessage.dart';

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new ChatScreenState();                    //new
}

// Add the ChatScreenState class definition in main.dart.

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];             // new
  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(                         //new
      text: text,                                                  //new
    );                                                             //new
    setState(() {                                                  //new
      _messages.insert(0, message);                                //new
    });                                                            //new
  }

  final TextEditingController _textController = new TextEditingController(); //new
  // new
  @override //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Friendlychat")
      ),
      body: new Column(                                        //modified
        children: <Widget>[                                         //new
          new Flexible(                                             //new
            child: new ListView.builder(                            //new
              padding: new EdgeInsets.all(8.0),                     //new
              reverse: true,                                        //new
              itemBuilder: (_, int index) => _messages[index],      //new
              itemCount: _messages.length,                          //new
            ),                                                      //new
          ),                                                        //new
          new Divider(height: 1.0),                                 //new
          new Container(                                            //new
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),                  //new
            child: _buildTextComposer(),                       //modified
          ),                                                        //new
        ],                                                          //new
      ),                                                            //new

    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(                                            //new
        data: new IconThemeData(color: Theme.of(context).accentColor), //new
        child:  new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(                                            //new
        children: <Widget>[                                      //new
          new Flexible(                                          //new
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                  hintText: "Send a message"),
            ),
          ),                                                      //new
          new Container(                                                 //new
            margin: new EdgeInsets.symmetric(horizontal: 4.0),           //new
            child: new IconButton(                                       //new
                icon: new Icon(Icons.send),                                //new
                onPressed: () => _handleSubmitted(_textController.text)),  //new
          ),
        ],                                                        //new
      ),                                                          //new

        ),
    );
  }
}

