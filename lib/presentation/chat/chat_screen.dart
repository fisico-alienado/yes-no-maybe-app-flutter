// import 'dart:io';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/Screenshot_20230901-224317_WhatsApp.jpg')
            // Desde el local, no funciona
            // backgroundImage: FileImage(File('C:/Users/ruben/Pictures/Screenshot_20230901-224317_WhatsApp.jpg')),
            // Desde internet, si funciona
            // backgroundImage: NetworkImage('https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&fit=max&auto=format%2Ccompress'),
            // backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiHDwS00ifwoFXfqPbf7FBFGkWhM_9Ypl0EQ&usqp=CAU'),
          ),
        ),
        title: const Text('Mi amoor'),
        centerTitle: false,
      ),
    );
  }
}