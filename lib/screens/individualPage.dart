import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/models/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool showmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(widget.chatModel.isGroup
                    ? "assets/group.svg"
                    : "assets/person.svg"),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  'last seen today 12:00',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(onSelected: (val) {
            print(val);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('View contact'),
                value: "View contact",
              ),
              PopupMenuItem(
                child: Text('Media,links and docs'),
                value: "Media,links and docs",
              ),
              PopupMenuItem(
                child: Text('Search'),
                value: "Search",
              ),
              PopupMenuItem(
                child: Text('Mute notification'),
                value: "Mute notification",
              ),
              PopupMenuItem(
                child: Text('Wallpaper'),
                value: "Wallpaper",
              ),
              PopupMenuItem(
                child: Text('More'),
                value: "More",
              ),
              PopupMenuItem(
                child: Text('Voice Changer'),
                value: "Voice Changer",
              ),
              PopupMenuItem(
                child: Text('Go to first message'),
                value: "Go to first message",
              ),
              PopupMenuItem(
                child: Text('Lock conversation'),
                value: "Lock conversation",
              ),
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // to enable backclick
        child: WillPopScope(
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type a message',
                                        contentPadding: EdgeInsets.all(5),
                                        prefixIcon: IconButton(
                                          icon: Icon(Icons.emoji_emotions),
                                          onPressed: () {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            setState(() {
                                              showmoji = !showmoji;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // a popup for attaching a file
                                            IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          showModel());
                                                },
                                                icon: Icon(Icons.attach_file)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.camera_alt))
                                          ],
                                        )),
                                  ))),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 2),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF128C7E),
                              radius: 25,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                      showmoji ? emojiSelect() : Container(),
                    ],
                  ),
                )
              ],
            ),
            onWillPop: () {
              if (showmoji) {
                setState(() {
                  showmoji = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            }),
      ),
    );
    // ignore: dead_code
  }

// custom widget for a pop up
  Widget showModel() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.insert_drive_file,Colors.indigo,"Document"),
                SizedBox(width: 40,),
                iconCreation(Icons.camera_alt,Colors.pink,"Camera"),
                SizedBox(width: 40,),
                iconCreation(Icons.insert_photo,Colors.purple,"Gallery"),
              ],
            ),
            SizedBox(height: 30,),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.headset,Colors.orange,"Audio"),
                SizedBox(width: 40,),
                iconCreation(Icons.location_pin,Colors.teal,"Location"),
                SizedBox(width: 40,),
                iconCreation(Icons.person,Colors.blue,"Contact"),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }

// column for the modal icons and text
  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(height:5),
          Text(text,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
}
