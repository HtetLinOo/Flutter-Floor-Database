import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_database/database/note_table.dart';
import 'package:note_database/database/notedao.dart';
import 'package:note_database/ui/add_data_screen.dart';
import 'package:note_database/ui/update_data_screen.dart';

class Home extends StatelessWidget {
  final NoteDao noteDao = Get.find();
  Home();
  List<Note> notes=List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floor Database Note"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            heroTag: 'add',
            onPressed:() {
              Get.to(AddDataScreen());
            },
            backgroundColor: Colors.deepOrangeAccent,
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: 'delete',
            child: Icon(Icons.delete),
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: (){
              noteDao.deleteAllNotes(notes);
            },
          ),
        ],
      ),
    );
  }
  Widget noteList(){
    return StreamBuilder<List<Note>>(
      stream: noteDao.getAllNotes(),
      builder: (_,data) {
        if (data.hasData) {
          notes=data.data;
          return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (_, position) {
              return Card(
                child: ListTile(
                  title: Text(data.data[position].title),
                  subtitle: Text(data.data[position].message),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                        onPressed: (){
                      noteDao.deleteNote(data.data[position]);
                },
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      Get.to(UpdateDataScreen(),arguments: data.data[position]);

                    },
                  ),
                ),
              );
            },

          );
        }
        else if(data.hasError){
          return Text("Error");
        }
        else return Text("Loading");
      },
    );

}

}
