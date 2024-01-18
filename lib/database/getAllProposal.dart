import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goldonesia/models/note.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

Future<List<Note>> getUserNotes() async {
  try {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("Proposal").get();

    List<Note> notes = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      String formattedTime = '';
      if (data['modifiedTime'] != null) {
        Timestamp timestamp = data['modifiedTime'];
        DateTime dateTime = timestamp.toDate();
        formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
      }

      print(querySnapshot.docs.indexOf(doc) + 1);
      print(data['ideaName']);
      print(data['ideaOverview']);
      print(DateTime.parse(formattedTime));
      print(data['costEstimate']);
      print(data['profitEstimate']);

      return Note(
        id: querySnapshot.docs.indexOf(doc), // Use the index as ID
        title: data['ideaName'] ?? '',
        content: data['ideaOverview'] ?? '',
        modifiedTime: DateTime.parse(formattedTime),
        danaAwal: data['costEstimate'] ?? '',
        untung: data['profitEstimate'] ?? '',
      );
    }).toList();

    return notes;
  } catch (error) {
    print("Error: $error");
    throw error;
  }
}
