import 'package:flutter/material.dart';
import 'package:yemekapp/detay.dart';
import 'package:yemekapp/yemekler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: missing_return
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = List<Yemekler>();
    var y1 = Yemekler(1, 'Köfte', 'kofte.png', 15.99);
    var y2 = Yemekler(2, 'Makarna', 'makarna.png', 14.99);
    var y3 = Yemekler(3, 'Baklava', 'baklava.png', 15.99);
    var y4 = Yemekler(4, 'Kadayıf', 'kadayif.png', 8.99);
    var y5 = Yemekler(5, 'Fanta', 'fanta.png', 5.0);
    var y6 = Yemekler(6, 'Ayran', 'ayran.png', 3.0);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yemekler'),
      ),
      body: FutureBuilder<List<Yemekler>>(
          future: yemekleriGetir(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var yemekListesi = snapshot.data;

              return ListView.builder(
                itemCount: yemekListesi.length,
                // ignore: missing_return
                itemBuilder: (context, index) {
                  var yemek = yemekListesi[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetaySayfa(
                                    yemek: yemek,
                                  )));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 150,
                                height: 150,
                                child:
                                    Image.asset('images/${yemek.yemekResim}')),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(yemek.yemekAdi,
                                      style: TextStyle(fontSize: 25)),
                                  SizedBox(height: 50),
                                  Text('${yemek.yemekFiyat} \u{20BA}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueGrey)),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          }),
    );
  }
}
