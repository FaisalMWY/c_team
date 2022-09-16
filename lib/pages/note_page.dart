import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/pages/note_creation.dart';

class NotePage extends StatelessWidget {
  final String title;
  final String noteText;
  const NotePage(this.title, this.noteText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  .1,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffFFA500),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteCreation(() {}, title, noteText),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.mode_edit,
                      color: Color(0xffFFA500),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    .9,
                child: Text(
                  title,
                  softWrap: true,
                  style: GoogleFonts.nunito(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    .9,
                child: Text(
                  noteText,
                  softWrap: true,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
