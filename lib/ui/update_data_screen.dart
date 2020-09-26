

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_database/database/note_table.dart';
import 'package:note_database/database/notedao.dart';

class UpdateDataScreen extends StatelessWidget {
  TextEditingController title=TextEditingController();
  TextEditingController message=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao=Get.find();
    Note note=Get.arguments;
    title.text=note.title;
    message.text=note.message;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
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
              child: Text("Update Note"),
              textColor: Colors.white,
              color: Colors.orange,

              onPressed: (){
                noteDao.updateNote(Note(title.text,message.text,id: note.id));
                Get.back();

            },
            )
          ],
        ),
      ),
    );
  }
}
