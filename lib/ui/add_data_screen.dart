

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_database/database/note_table.dart';
import 'package:note_database/database/notedao.dart';

class AddDataScreen extends StatelessWidget {
  TextEditingController title=TextEditingController();
  TextEditingController message=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao=Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'title',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: message,
              decoration: InputDecoration(
                  hintText: 'message',
                border: OutlineInputBorder()
              ),
              

            ),

            RaisedButton(
              child: Text("Add Note"),
              textColor: Colors.white,
              color: Colors.orange,

              onPressed: (){
                noteDao.addNote(Note(title.text,message.text));
                Get.back();

            },
            )
          ],
        ),
      ),
    );
  }
}
