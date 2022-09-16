import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/pages/note_page.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotePage(note.title, note.noteText),
            ),
          )),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: const Color(0xff252525),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "title: ",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18, color: Color(0xFFBFBDBD))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Text(
                  note.title,
                  style: GoogleFonts.nunito(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
