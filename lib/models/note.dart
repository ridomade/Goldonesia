import 'package:goldonesia/database/getAllProposal.dart';

class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;
  String danaAwal;
  String untung;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.modifiedTime,
      required this.danaAwal,
      required this.untung});
}

List<Note> sampleNotes = [];

Future<void> addAllProposal() async {
  try {
    // Panggil fungsi getUserNotes untuk mendapatkan daftar catatan pengguna
    List<Note> userNotes = await getUserNotes();

    // Function to ensure the list is empty before adding
    void ensureListEmpty() {
      if (sampleNotes.isNotEmpty) {
        sampleNotes.clear();
      }
    }

    // Check if sampleNotes is empty before adding
    ensureListEmpty();

    for (var note in sampleNotes) {
      print('ID: ${note.id}, Title: ${note.title}, Content: ${note.content}, '
          'Modified Time: ${note.modifiedTime}, Dana Awal: ${note.danaAwal}, Untung: ${note.untung}');
    }

    // Masukkan hasil dari getUserNotes ke dalam list sampleNotes
    sampleNotes.addAll(userNotes);

    // Cetak daftar catatan
    for (var note in sampleNotes) {
      print('ID: ${note.id}, Title: ${note.title}, Content: ${note.content}, '
          'Modified Time: ${note.modifiedTime}, Dana Awal: ${note.danaAwal}, Untung: ${note.untung}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
