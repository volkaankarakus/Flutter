import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_app/detaySayfa.dart';
import 'package:dictionary_app/kelimeler.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  var refKelimeler = FirebaseDatabase.instance.reference().child("kelimeler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(hintText: "Arama icin birsey yazin"),
          onChanged: (aramaSonucu){
            print("Arama sonucu : $aramaSonucu");
            setState(() {
              aramaKelimesi = aramaSonucu;
            });
          },
        )
            : Text("Sözlük Uygulamasi"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = false;
                aramaKelimesi = "";
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<Event>(
        stream: refKelimeler.onValue, // Transfer immediately when there is a change in the interface
        builder: (context,event){
          if(event.hasData){
            var kelimelerListesi = List<Kelimeler>.empty(growable: true);

            var gelenDegerler = (event.data! as Event).snapshot.value; // Transfer all streamed data here

            if(gelenDegerler != null){
              gelenDegerler.forEach((key,object){ // object are {"ingilizce","kelime_id","turkce"}

                var gelenKelime = Kelimeler.fromJson(key, object); //json parse process. gelenKelime has all firebase data

                if(aramaYapiliyorMu){
                  if(gelenKelime.ingilizce.contains(aramaKelimesi) || gelenKelime.turkce.contains(aramaKelimesi)){
                    kelimelerListesi.add(gelenKelime);
                  }
                }else{
                  kelimelerListesi.add(gelenKelime);
                }

              });
            }

            return ListView.builder( // display part
              itemCount: kelimelerListesi.length,
              itemBuilder: (context,indeks){
                var kelime = kelimelerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kelime: kelime,)));
                  },
                  child: SizedBox(height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kelime.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kelime.turkce),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(); // bilgi yoksa duz tasarım gostericez
          }
        },
      ),

    );
  }
}
