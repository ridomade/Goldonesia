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

List<Note> sampleNotes = [
  Note(
      id: 0,
      title: 'Konveksi',
      content: 'Usaha konveksi yang berfokus untuk brand lokal',
      modifiedTime: DateTime(2022, 1, 1, 34, 5),
      danaAwal: "Rp.5.2 Juta",
      untung: "20,5 Juta"),
];
