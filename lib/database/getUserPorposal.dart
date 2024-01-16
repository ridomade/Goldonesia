import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goldonesia/models/note.dart';

Future<List<Note>> getUserNotes() async {
  try {
    // Get the reference to the user's Proposal collection
    final querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Proposal")
        .get();

    // Convert the query snapshot to a list of Note objects
    List<Note> notes = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Note(
        id: int.parse(doc.id),
        title: data['proposalTitle'] ?? '',
        content: data['ideaOverviw'] ?? '',
        modifiedTime: (data['modifiedTime'] as Timestamp).toDate(),
        danaAwal: data['costEstimate'] ?? '',
        untung: data['profitEstimate'] ?? '',
      );
    }).toList();

    return notes;
  } catch (error) {
    print("Error: $error");
    // Handle errors as needed
    throw error;
  }
}
