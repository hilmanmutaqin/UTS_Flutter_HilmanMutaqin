import 'package:intl/intl.dart';

class ModelHafalan {
  final int id;
  final String namaSurah;
  late String description;
  late DateTime datetime;

  ModelHafalan({
    required this.id,
    required this.namaSurah,
    required this.description,
    required this.datetime,
  });

  factory ModelHafalan.fromJson(Map<String, dynamic> json) {
    DateTime parsedDatetime;
    try {
      parsedDatetime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['datetime']);
    } catch (e) {
      // Jika parsing gagal, gunakan waktu saat ini
      parsedDatetime = DateTime.now();
    }

    return ModelHafalan(
      id: json['id'] as int,
      namaSurah: json['nama_surah'] as String,
      description: json['description'] as String,
      datetime: parsedDatetime,
    );
  }

  // Method to convert the object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama_surah': namaSurah,
      'description': description,
      'datetime': DateFormat("yyyy-MM-dd HH:mm:ss").format(datetime),
    };
  }
}
