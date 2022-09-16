import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/pages/note_creation.dart';
import 'package:notesapp/pages/notes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> notes = [
    Note(
        title: "Notes App will be my first production app ever🎉!",
        noteText: "Before celebrating the app needs to be polished first."
            " We need to have a responsive application, then we need to make "
            "it adabtive by having it look as smooth and sharp in IOS devices."),
    Note(
        title: "Life setup🗄.",
        noteText: "It's important to keep your life together by documenting "
            "everything you have, not for memories but rather to schedule "
            "your days by the hour if possible!"),
  ];
  void _addNewNote(String title, String noteText) {
    final newNote = Note(title: title, noteText: noteText);
    setState(() {
      notes.add(newNote);
    });
  }

  void _deleteNote(String title) {
    setState(() {
      notes.removeWhere((element) => element.title == title);
    });
  }

  Widget deletedItemBackground() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.red),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      .1,
                  width: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      .48,
                  child: Row(
                    children: [
                      Text(
                        'Notes',
                        style: GoogleFonts.nunito(
                            textStyle: const TextStyle(fontSize: 40),
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          openDialog();
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              notes.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                      child: Center(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/undraw_reminder_re_wxwu (1).svg',
                            height: 300,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: Text(
                              'Create your first note!',
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(fontSize: 20),
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )),
                    )
                  : Center(
                      child: SizedBox(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              .9,
                          width: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              .9,
                          child: ReorderableListView(
                            dragStartBehavior: DragStartBehavior.start,
                            onReorder: (oldIndex, newIndex) => setState(() {
                              if (newIndex > oldIndex) {
                                newIndex -= 1;
                              }

                              final note = notes.removeAt(oldIndex);
                              notes.insert(newIndex, note);
                            }),
                            children: notes
                                .map((e) => Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction) {
                                        _deleteNote(e.title);
                                      },
                                      background: deletedItemBackground(),
                                      child: NotesList(note: e),
                                    ))
                                .toList(),
                          )),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteCreation(_addNewNote, '', ''),
              ),
            ))),
        backgroundColor: const Color(0xffFFA500),
        child: const Icon(
          Icons.add,
          color: Color(0xff121212),
          size: 40,
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          backgroundColor: Color(0xff121212),
          title: Text(
            'Credits',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Notes App was made available thanks to '
            '@__FaisalMY and @divyakelaskar.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
