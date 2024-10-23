Loyoutolusturma

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

// Uygulamanın ana widget'ı.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firma Listesi', // Uygulamanın başlık kısmı.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Uygulamanın genel tema rengi.
      ),
      home: FirmaListesi(), // Ana sayfa olarak FirmaListesi widget'ını göster.
    );
  }
}

// Firma listesi sayfasını oluşturan widget.
class FirmaListesi extends StatelessWidget {
  // Firmaların isim ve indirim yüzdesi bilgisini içeren bir liste.
  final List<Map<String, String>> firms = [
    {"name": "Firma Adı Uzun Firma Adı", "discount": "%10"},
    {"name": "Firma Adı", "discount": "%10"},
    {"name": "Firma Adı Uzun Firma Adı", "discount": "%10"},
    {"name": "Firma Adı", "discount": "%10"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold, uygulamanın temel düzen yapısını sağlar (app bar, body, vb.).
      appBar: AppBar(
        title: Text('Firmalar'), // Uygulamanın üst kısmındaki başlık.
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Geri gitmek için ok ikonu.
          onPressed: () {
          
          },
        ),
      ),
      body: Column(
        children: [
          // Kategori başlığı olan "Sağlık" bölümünü oluşturur.
          Padding(
            padding: const EdgeInsets.all(8.0), // Ekranın her tarafına boşluk bırakır.
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10), // Sağ ve sol boşluk ayarlar.
              color: Colors.blue[700], // Kategorinin arka plan rengini mavi yapar.
              height: 50, // Yükseklik değeri 50 birim olarak ayarlandı.
              child: Row(
                children: [
                  Icon(Icons.health_and_safety, color: Colors.white), // Sağlık ikonu.
                  SizedBox(width: 10), // İkon ile yazı arasında boşluk bırakır.
                  Text(
                    'Sağlık', // "Sağlık" kategorisi yazısı.
                    style: TextStyle(color: Colors.white, fontSize: 18), // Beyaz renkli ve 18 büyüklüğünde yazı.
                  ),
                ],
              ),
            ),
          ),
          // Firma arama çubuğunu oluşturur.
          Padding(
            padding: const EdgeInsets.all(8.0), // Arama çubuğuna dış boşluk ekler.
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), // Arama çubuğunun başına arama ikonu ekler.
                hintText: 'Firma Ara', // Kullanıcıya arama alanı için ipucu metni.
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Köşeleri yuvarlaklaştırılmış kenarlık.
                ),
              ),
            ),
          ),
          // Firma listesini gösteren bölüm.
          Expanded(
            // Expanded, widget'ın kalan alanı kaplamasını sağlar.
            child: ListView.builder(
              itemCount: firms.length, // Listede kaç adet firma olduğunu belirler.
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Firma kartlarının sağ ve sol boşluğu.
                  child: Card(
                    // Firma bilgilerini kartlar halinde göstermek için kullanılır.
                    child: ListTile(
                      leading: Icon(Icons.business), // Firma simgesi.
                      title: Text(firms[index]["name"]!), // Firma adı.
                      trailing: Container(
                        // İndirim yüzdesi için tasarlanan bölüm.
                        padding: EdgeInsets.all(8), // İndirim kutusunun içindeki boşluk.
                        decoration: BoxDecoration(
                          color: Colors.blue, // İndirim kutusunun arka plan rengi.
                          borderRadius: BorderRadius.circular(8), // Köşeleri yuvarlaklaştırılmış kutu.
                        ),
                        child: Text(
                          firms[index]["discount"]!, // İndirim yüzdesini gösterir.
                          style: TextStyle(color: Colors.white), // Beyaz renkli metin.
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}