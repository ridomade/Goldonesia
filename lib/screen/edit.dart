import 'package:flutter/material.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/constants/color.dart';

import '../models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;

  const EditScreen({Key? key, this.note}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _danaAwalController = TextEditingController();
  TextEditingController _untungController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
      _danaAwalController = TextEditingController(text: widget.note!.danaAwal);
      _untungController = TextEditingController(text: widget.note!.untung);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            lightGreen,
            lightGreen,
            white,
            white,
            white,
            white,
            white,
            teal,
            teal
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.all(0),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "Lengkapi Idemu",
                        style: TextStyle(
                          fontFamily: 'Odudo-Soft',
                          color: Color(0xFF0766AD),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign:
                            TextAlign.center, // Center the text within the row
                      ),
                    ),
                    SizedBox(height: 20),
                    ReusableTextField(
                        label: "Judul Ide",
                        controller: _titleController,
                        obscureText: false),
                    SizedBox(height: 10),
                    ReusableTextField(
                        label: "Deskripsi Ide",
                        controller: _contentController,
                        obscureText: false),
                    SizedBox(height: 10),
                    ReusableTextField(
                        label: "Dana Awal",
                        controller: _danaAwalController,
                        obscureText: false),
                    SizedBox(height: 10),
                    ReusableTextField(
                        label: "Perkiraan Untung",
                        controller: _untungController,
                        obscureText: false),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(
              context,
              [
                _titleController.text,
                _contentController.text,
                _danaAwalController.text,
                _untungController.text,
              ],
            );
          },
          elevation: 10,
          backgroundColor: lightGreen,
          child: const Icon(Icons.save, color: Colors.teal),
        ),
      ),
    );
  }
}
