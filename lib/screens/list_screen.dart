import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<Map<String, String>> _filteredList;
  String _keywords = '';
  final List<Map<String, String>> _originList = [
    //data dari surah
    {
      'name': 'Surah 78',
      'description': 'An Naba (Berita Besar) terdiri dari 40 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 79',
      'description':
          'An Naaziaat (Malaikat-malaikat yang Mencabut) terdiri dari 46 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 80',
      'description':
          'Abasa (Ia Bermuka Masam): surat ke-80 dan terdiri dari 40 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 81',
      'description': 'At Takwiir (Menggulung) terdiri dari 29 ayat ',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 82',
      'description': 'Al Infithaar (Terbelah) terdiri dari 19 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 83',
      'description':
          'Al Muthaffifiin (Orang-orang yang Curang) terdiri dari 36 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 84',
      'description': 'Al Insyiqaaq (Terbelah) terdiri dari 25 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 85',
      'description': 'Al Buruuj (Gugusan Bintang) terdiri dari 22 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 86',
      'description': 'Ath Thaariq (yang Datang di Malam Hari) dari 17 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 87',
      'description': 'Al Alaa (yang Paling Tinggi) terdiri dari 19 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 88',
      'description': 'Al Ghaasyiyah (Hari Pembalasan) terdiri dari 26 ayat/',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 89',
      'description': 'Al Fajr (Fajar) terdiri dari 30 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 90',
      'description': 'Al Balad (Negeri) terdiri dari 20 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 91',
      'description': 'Asy Syams (Matahari) terdiri dari 15 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 92',
      'description': 'Al Lail (Malam) terdiri dari 21 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 93',
      'description': 'Adh Dhuhaa (Waktu Dhuha) terdiri dari 11 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 94',
      'description': 'Al Insyirah (Melapangkan) terdiri dari 8 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 95',
      'description': 'At Tin (Buah Tin) terdiri dari 8 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 96',
      'description': 'Al Alaq (Segumpal Darah) terdiri dari 19 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 97',
      'description': 'Al Qadr (Kemuliaan) terdiri dari 5 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 98',
      'description': 'Al Bayyinah (Bukti) terdiri dari 8 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 99',
      'description': 'Al Zalzalah (Kegoncangan) terdiri dari 8 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 100',
      'description':
          'Al Aadiyaat (Kuda yang Berlari Kencang) terdiri dari 11 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 101',
      'description': 'Al Qaariah (Hari Kiamat) terdiri dari 11 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 102',
      'description': 'At Takaatsur (Bermegah-megahan) terdiri dari 8 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 103',
      'description': 'Al Ashr (Demi Masa) terdiri dari 3 ayat ',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 104',
      'description': 'Al Humazah (Pengumpat) terdiri dari 9 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 105',
      'description': 'Al Fiil (Gajah) terdiri dari 5 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 106',
      'description': 'Quraisy (Suku Quraisy) terdiri dari 4 ayat ',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 107',
      'description': 'Al Maun (Barang-barang yang Berguna) terdiri dari 7 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 108',
      'description': 'Al Kautsar (Nikmat yang Banyak) terdiri dari 3 ayat ',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 109',
      'description': 'Al Kaafiruun (Orang-orang Kafir) terdiri dari 6 ayat ',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 110',
      'description': 'An Nashr (Pertolongan) terdiri dari 3 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 111',
      'description': 'Al Lahab (Gejolak Api) terdiri dari 5 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 112',
      'description': 'Al Ikhlash (Memurnikan Keesaan Allah)terdiri dari 4 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 113',
      'description':
          'Al Falaq (Waktu Subuh): surat ke-113 dan terdiri dari 5 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
    {
      'name': 'Surah 114',
      'description': 'An Naas (Manusia): surat ke-114 dan terdiri dari 6 ayat',
      'image':
          'https://image.gambarpng.id/pngs/png-transparent-quran-blue-png-al-for-ramadan-soft-illustration_123991.png'
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredList = [];
    _originList.sort((a, b) {
      // pemilihan nomer pada name 
      int surahNumberA = int.parse(a['name']!.substring(6));
      int surahNumberB = int.parse(b['name']!.substring(6));
      return surahNumberA.compareTo(surahNumberB);
    });

    _searchController.addListener(() {
      // update kata dan fungsi pencarian
      setState(() => _keywords = _searchController.text);
      _search();
    });

    super.initState();
  }

  void _search() {
    _filteredList.clear();
    for (int i = 0; i < _originList.length; i++) {
      Map<String, String> item = _originList[i];
      // Check if the description contains the search keywords
      if (item['description']!
          .toLowerCase()
          .contains(_keywords.toLowerCase())) {
        _filteredList.add(item);
      }
    }
  }

  Widget _buildList({required List<Map<String, String>> list}) => Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
            height: 80,
            child: ListTile(
              leading: Image.network(
                list[index]['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                list[index]['name']!,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              subtitle: Text(
                list[index]['description']!,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const Divider(height: 2, color: Colors.blue),
          itemCount: list.length,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
                hintText: 'Cari',
                hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 18)),
          ),
          _buildList(
              list: _keywords.isEmpty
                  ? _originList
                  : _filteredList.map((e) => e).toList())
        ],
      ),
    );
  }
}
