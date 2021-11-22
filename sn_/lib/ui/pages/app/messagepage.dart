import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/main.dart';
import 'package:sn/providers/messageprovider.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/ui/widgets/comment/addcommentwidget.dart';
import 'package:sn/ui/widgets/message/messagefieldwidget.dart';
import 'package:sn/ui/widgets/message/messagewidget.dart';

class MessagePage extends StatefulWidget {
  final String id;
  const MessagePage({required this.id});
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController msgcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    backend<MessageProvider>().setMessage(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(builder: (context, message, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Message "),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: RefreshIndicator(
                      child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          key: ObjectKey(100),
                          itemCount: message.messages.length,
                          itemBuilder: (context, index) {
                            final msg = message.messages[index];

                            return MessagefieldWidget(
                                message: msg.message,
                                derecition: widget.id == msg.user_id_from
                                    ? Alignment.topLeft
                                    : Alignment.topRight);
                          }),
                      onRefresh: () =>
                          backend<MessageProvider>().setMessage(widget.id),
                      key: GlobalKey<RefreshIndicatorState>(),
                    )),
                    AddCommentWidget(
                        send: () {
                          message.send(
                              widget.id, msgcontroller.text.toString());
                          msgcontroller.text = "";
                        }, //=> post.comment(commentcontroller.text),
                        controller: msgcontroller)
                  ])));
    });
  }
}
