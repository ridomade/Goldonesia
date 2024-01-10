import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> addUsersProposalData(
    String name,
    String ideaOverview,
    String totalFundingEstimate,
    String totalProfitEstimate,
    String proposalTitel) async {
  final uuid = Uuid();
  final uniqueId = uuid.v4();
  proposalTitel = proposalTitel + uniqueId;
  final proposalRef = FirebaseStorage.instance.ref('Playlist/$proposalTitel');
  try {
    print('Berhasil mengupload proposal');
  } catch (e) {
    print('Error copying file: $e');
  }
}
