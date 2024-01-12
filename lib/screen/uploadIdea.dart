import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:goldonesia/database/proposalUpload.dart';

class uploadIdea extends StatefulWidget {
  uploadIdea({super.key});

  //controller
  final namaIdeController = TextEditingController();
  final gambaranIdeController = TextEditingController();
  final perkiraanDana = TextEditingController();
  final perkiraanUntung = TextEditingController();

  @override
  State<uploadIdea> createState() => _uploadIdeaState();
}

class _uploadIdeaState extends State<uploadIdea> {
  FilePickerResult? result;
  String? _filename;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  String? _filePath;
  String? _fileName;

  Future<void> pickFile() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePickerResult != null) {
      final fileName = filePickerResult.files.first.name;
      final filePath = filePickerResult.files.first.path;

      setState(() {
        _filePath = filePath;
        _fileName = fileName;
        print("ini song path : $_fileName");
        print("ini song path : $_filePath");
      });
    }
  }

  // void pickFile() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     result = await FilePicker.platform.pickFiles(
  //         type: FileType.custom,
  //         allowedExtensions: ['pdf'],
  //         allowMultiple: false);

  //     if (result != null) {
  //       _filename = result!.files.first.name;
  //       pickedFile = result!.files.first;
  //       fileToDisplay = File(pickedFile!.path.toString());

  //       print("File name $_filename");
  //     }

  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [lightGreen, lightGreen, white, white, teal],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              "Detail Ide Kamu",
              style: TextStyle(
                fontFamily: 'Odudo-Soft',
                color: Color(0xFF0766AD),
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    ReusableTextField(
                        label: "Nama Ide",
                        controller: widget.namaIdeController,
                        obscureText: false),
                    SizedBox(height: 35),
                    ReusableTextField(
                        label: "Gambaran Ide",
                        controller: widget.gambaranIdeController,
                        obscureText: false),
                    SizedBox(height: 42),
                    WideButton(
                      text: "Unggah Proposal Kamu",
                      buttonColor: blue,
                      onTap: () {
                        pickFile();
                      },
                    ),
                    SizedBox(height: 40),
                    ReusableTextField(
                      label: "Perkiraan Dana Total",
                      controller: widget.perkiraanDana,
                      obscureText: false,
                    ),
                    SizedBox(height: 35),
                    ReusableTextField(
                      label: "Perkiraan untung",
                      controller: widget.perkiraanUntung,
                      obscureText: false,
                    ),
                    SizedBox(height: 58),
                    WideButton(
                      text: "Submit",
                      buttonColor: blue,
                      onTap: () async {
                        if (widget.namaIdeController.text.isEmpty ||
                            widget.gambaranIdeController.text.isEmpty ||
                            widget.perkiraanDana.text.isEmpty ||
                            widget.perkiraanUntung.text.isEmpty ||
                            _fileName == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Lengkapi data ide kamu!'),
                            ),
                          );
                        } else {
                          await addUsersProposalData(
                              widget.namaIdeController.text,
                              widget.gambaranIdeController.text,
                              widget.perkiraanDana.text,
                              widget.perkiraanUntung.text,
                              _fileName!,
                              _filePath!);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
