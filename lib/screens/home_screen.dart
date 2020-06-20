import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import './webview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi QR Scanner"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
       drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:new Text("Budi Setiawan", style:new TextStyle(
                fontWeight:FontWeight.bold,fontSize: 17),),
              accountEmail: new Text("gudangvisual19@gmail.com"),

            ),
              ListTile(
              leading: Icon(Icons.settings),
              title: Text("Pengaturan"),
            ),
              ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifikasi"),
            ),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Tentang"),
              ),
              ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Keluar"),
            ),
            

          ],
        )
      ),
      
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          SizedBox(
            height: 12.0,
          ),

          Container(
          padding: EdgeInsets.all(20), 
          ),
          
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: 200,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Scan Disini",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebScreen(kode),
                      ),
                    );
                  },
            child: Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                          "Hasil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        )
                      : Text(
                          kode,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                  
                        ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
