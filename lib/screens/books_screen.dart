import "package:flutter/material.dart";

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<BooksScreen> {
  // Mock data for movie posters and titles
  final List<String> booksPosters = [
    'https://penerbitjabal.com/wp-content/uploads/2022/12/Bulughul-Maram-Karya-Ibnu-Hajar-al-Asqalani.webp',
    'https://toko-muslim.com/images/product/2022/01/Buku-Shahih-Bukhari-Muslim-Hadis-Yang-Diriwayatkan-Oleh-Dua-Imam1-1024x1024.jpg',
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-OUjhkGXtBhScHWLQYnPViiFFA3LcG3AhhOOCLyWnSF_pQlfZeiw_KDuwuB91krso4i2ffgG8uNlo9Y1RlwhIdgouzV9dQqvRQci1UUjbT59GppqBCL1X0Y3RC0GJ0EhDEKQoNApce8fVEBMGtg_8rqEQGilqAKid_IbYIdW24xEvnqxAK80wjke_/s800/Nahwu-Wadhih-.jpg',
    'https://3.bp.blogspot.com/-0FSlbQdG_hc/WGzL4c7IrrI/AAAAAAAAAAg/5PdK9C_2_pghH7aQxkp7kdtQtvt6SVbyACLcB/s1600/Kitab-at-Tashrif.jpg',
    'https://toko-muslim.com/images/product/2019/12/Buku-Ilmu-Faraidh-Upaya-Menghidupkan-Hukum-Waris-Islam-1.jpg',
    'https://penerbitlitnus.co.id/wp-content/uploads/2023/02/WhatsApp-Image-2023-02-04-at-3.22.40-PM.jpeg',
    'https://toko-muslim.com/images/product/2012/04/Buku-Fiqih-Shalat-Berdasarkan-Al-Quran-dan-As-Sunnah-1.jpg',
    'https://www.penerbitdiponegoro.com/wp-content/uploads/2021/01/Al-Amin_Terjemah-Sunda-Hardcover_01-1.jpg',
  ];

  final List<String> booksTitles = [
    'Bulughul Maram',
    'Hadits Shahih Bukhari - Muslim (HC)',
    'Nahwu',
    'Shorof',
    'Ilmu Faraidh',
    'Balaghah',
    'Fiqih',
    'Al-Quran ',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: booksPosters.length,
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Image.network(
            booksPosters[index],
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              booksTitles[index],
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
