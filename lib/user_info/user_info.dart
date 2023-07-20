import 'package:flutter/material.dart';

class user_info extends StatefulWidget
{
   final Map<String,dynamic> obj ;
  user_info({required this.obj});
  @override
  State<user_info> createState() => _user_infoState();
}

class _user_infoState extends State<user_info> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(Icons.person_outline_outlined,size: 250,),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueAccent.shade100,
                title: Text("Name:"+widget.obj['name']),
              ),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueAccent.shade100,
                title: Text("Phone Number:"+widget.obj['phone']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueAccent.shade100,
                title: Text("Department:"+widget.obj['dept']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueAccent.shade100,
                title: Text("WhatsApp:"+widget.obj['phone']),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
