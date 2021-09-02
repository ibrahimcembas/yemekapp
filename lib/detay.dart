import 'package:flutter/material.dart';
import 'package:yemekapp/yemekler.dart';

// ignore: must_be_immutable
class DetaySayfa extends StatefulWidget {
  Yemekler yemek;

  DetaySayfa({this.yemek});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.yemekAdi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/${widget.yemek.yemekResim}'),
            Text('${widget.yemek.yemekFiyat} \u{20BA}',
                style: TextStyle(fontSize: 48, color: Colors.blueGrey)),
            SizedBox(
              height: 50,
              width: 200,
              child: RaisedButton(
                child: Text('Sipariş Ver'),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  showDialog(
                      context: context,
                      // ignore: missing_return
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Sipariş için teşekkürler '),
                          content: Text(
                              '${widget.yemek.yemekAdi} siparişiniz verildi. \nYaklaşık 45 dakika sürebilir.'),
                          actions: [
                            FlatButton(
                              child: Text('Tamam'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });

                  print('${widget.yemek.yemekAdi} siparişi verildi');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
