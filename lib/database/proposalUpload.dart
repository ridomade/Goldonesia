import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    String name,
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

    print(await proposalRef.getDownloadURL());
    print('Berhasil mengupload proposal');
  } catch (e) {
    print('Error copying file: $e');
  }
}

Future<void> addUsersProposalDataToFirestore(
    String name,
    String ideaOverview,
    String totalFundingEstimate,
    String totalProfitEstimate,
    String proposalTitel) async {
  try {
    await FirebaseFirestore.instance
        .collection('Users')
        .add({}).then((document) {});
  } catch (e) {
    print('Error copying file: $e');
  }
}
