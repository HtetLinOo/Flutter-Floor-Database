
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_database/database/note_table.dart';

@dao
abstract class NoteDao{
  @Query('select * from note')
  Stream<List<Note>> getAllNotes();

  @insert
  Future<void> addNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteAllNotes(List<Note> notes);
}