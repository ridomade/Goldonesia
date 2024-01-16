import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:goldonesia/constants/colors.dart';
import 'package:goldonesia/database/proposalUpload.dart';
import 'package:intl/intl.dart';

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
      });
    }
  }

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(
              "Detail Ide Kamu",
              style: TextStyle(
                fontFamily: 'Odudo-Soft',
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    ReusableTextField(
                        label: "Nama Ide",
                        controller: widget.namaIdeController,
                        obscureText: false),
                    SizedBox(height: 35),
                    ReusableTextField(
                        label: "Gambaran Ide",
                        controller: widget.gambaranIdeController,
                        obscureText: false),
                    SizedBox(height: 12),
                    const Align(
                      alignment: Alignment(-0.76,
                          -0.5), // Sesuaikan dengan nilai yang diinginkan
                      child: Text(
                        "Unggah Proposal Kamu",
                        style: TextStyle(
                          fontFamily:
                              'Roboto', // Menggunakan font bawaan Flutter (Raleway juga dapat dipertimbangkan)
                          color: Color(0xFF0766AD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Penempatan lintang ke kiri
                      children: [
                        _fileName == null
                            ? Align(
                                alignment: Alignment(-1.0, -0.5),
                                child: GestureDetector(
                                  onTap: () {
                                    pickFile();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 32.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/icon_upload.png',
                                          width: 30.0,
                                          height: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            : Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/icon_pdf.png', // Ganti dengan path gambar Anda
                                          width: 30.0,
                                          height: 30.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _fileName!,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: _fileName == null ? 10 : 0,
                        ), // Jarak antara icon dan WideButton
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 350, // Adjust the width as needed
                      child: Material(
                        elevation: 3, // Adjust the shadow as needed
                        borderRadius: BorderRadius.circular(20),
                        child: TextField(
                          controller: widget.perkiraanDana,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                15), // Adjust the limit as needed
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              int inputValue = int.parse(value);
                              String formattedValue =
                                  NumberFormat('#,###', 'id')
                                      .format(inputValue);
                              widget.perkiraanDana.value = TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.fromPosition(
                                  TextPosition(offset: formattedValue.length),
                                ),
                              );
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Perkiraan Dana Total",
                            prefixText: 'Rp. ',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                      width: 350, // Adjust the width as needed
                      child: Material(
                        elevation: 3, // Adjust the shadow as needed
                        borderRadius: BorderRadius.circular(20),
                        child: TextField(
                          controller: widget.perkiraanUntung,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                15), // Adjust the limit as needed
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              int inputValue = int.parse(value);
                              String formattedValue =
                                  NumberFormat('#,###', 'id')
                                      .format(inputValue);
                              widget.perkiraanUntung.value = TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.fromPosition(
                                  TextPosition(offset: formattedValue.length),
                                ),
                              );
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Perkiraan Untung",
                            prefixText: 'Rp. ',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
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
