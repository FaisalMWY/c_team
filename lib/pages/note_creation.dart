// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCreation extends StatefulWidget {
  final Function noteSubmission;
  final String noteTitle;
  final String noteText;

  const NoteCreation(this.noteSubmission, this.noteTitle, this.noteText);

  @override
  State<NoteCreation> createState() => _NoteCreationState();
}

class _NoteCreationState extends State<NoteCreation> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final noteTextController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                        widget.noteSubmission(
                            titleController.text, noteTextController.text);
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.save_outlined,
                        color: Color(0xffFFA500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    controller: titleController != null
                        ? TextEditingController(text: widget.noteTitle)
                        : titleController,
                    style: GoogleFonts.nunito(
                        textStyle:
                            const TextStyle(fontSize: 48, color: Colors.grey)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: GoogleFonts.nunito(
                        textStyle:
                            const TextStyle(fontSize: 38, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    controller: noteTextController != null
                        ? TextEditingController(text: widget.noteText)
                        : noteTextController,
                    style: GoogleFonts.nunito(
                        textStyle:
                            const TextStyle(fontSize: 23, color: Colors.grey)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something...',
                      hintStyle: GoogleFonts.nunito(
                        textStyle:
                            const TextStyle(fontSize: 23, color: Colors.grey),
                      ),
                    ),
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
