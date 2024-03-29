import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

// var name = '';
// var ideaOverview = '';
// var totalFundingEstimate = '';
// var totalProfitEstimate = '';
// var proposalTitel = '';
// String? proposalPath;

// var proposalUrl = '';

Future<void> addUsersProposalData(
    String ideaName,
    String ideaOverview,
    String totalFundingEstimate,
    String totalProfitEstimate,
    String proposalTitel,
    String proposalPath) async {
  var proposalUrl = '';
  File file = File(proposalPath);
  final uuid = Uuid();
  final uniqueId = uuid.v4();
  proposalTitel = proposalTitel + uniqueId;
  final proposalRef =
      FirebaseStorage.instance.ref('Users/Proposal/$proposalTitel');
  try {
    await proposalRef.putFile(
        file,
        SettableMetadata(
          contentType: 'pdf',
        ));

    print('Berhasil mengupload proposal');
    await addUsersProposalDataToFirestore(
        ideaName,
        proposalTitel,
        ideaOverview,
        totalFundingEstimate,
        totalProfitEstimate,
        await proposalRef.getDownloadURL());
  } catch (e) {
    print('Error copying file: $e');
  }
}

Future<void> addUsersProposalDataToFirestore(
    String ideaName,
    String proposalTitle,
    String ideaOverview,
    String totalFundingEstimate,
    String totalProfitEstimate,
    String proposalUrl) async {
  try {
    await FirebaseFirestore.instance.collection("Proposal").add({
      "ideaName": ideaName,
      "proposalTitle": proposalTitle,
      "ideaOverview": ideaOverview,
      "modifiedTime": DateTime.now(),
      "costEstimate": totalFundingEstimate,
      "profitEstimate": totalProfitEstimate,
      "proposalUrl": proposalUrl
    }).then((document) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Proposal")
          .add({
        "userProposal":
            FirebaseFirestore.instance.collection("Users").doc(document.id)
      });
    });

    print("Berhasil menambahkan data proposal ke firestore");
  } catch (e) {
    print('Error copying file: $e');
  }
}
