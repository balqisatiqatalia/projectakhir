import 'package:flutter/material.dart';
import 'dart:async';
import 'itemcard.dart';
import 'entrybio.dart';
import 'biodata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


    class Home extends StatefulWidget {
    @override
    HomeState createState() => HomeState();
    }
    class HomeState extends State<Home> {
    int count = 0;
    List<biodata> bioList;
    CollectionReference _bio =
      FirebaseFirestore.instance.collection('Biodata');

  @override

      Widget build(BuildContext context) {
      if (bioList == null) {
      bioList = List<biodata>();
      }
    return Scaffold(
    // appBar: AppBar(
    // title: Text('Daftar Pasien'),
    // ),
      body: Column(children : [
      Expanded(child: ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                // contoh penggunaan srteam
                // _seminar.orderBy('age', descending: true).snapshots()
                // _seminar.where('age', isLessThan: 30).snapshots()
                // stream: _seminar.orderBy('age', descending: true).snapshots(),
                stream: _bio.snapshots(),
                builder: (buildContext, snapshot) {
                  if(snapshot.data == null) return CircularProgressIndicator();
                  return Column(
                    children: snapshot.data.docs.map((e) {
                      Map<String, dynamic> data = e.data();
                      return ItemCard(
                        data['Nama Pasien'],
                        data['Tanggal Lahir'],
                        data['Alamat'],
                        e.id,
                        onDelete: () {
                          _bio.doc(e.id).delete();
                       },
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(
                height: 150,
              )
            ],
          ),
      ),
      Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
      width: double.infinity,
      child: RaisedButton(
      child: Text("Tambah Data"),
      onPressed: () async {
        var bio = await navigateToEntryForm(context, null);
        // if (bio != null) {
        // //TODO 2 Panggil Fungsi untuk Insert ke DB
        // int result = await dbHelper.insert(bio);
        // if (result > 0) {
        //   updateListView();
        // }
 }
 ),
 ),
 ),
 ]),
 );
 }
      Future<biodata> navigateToEntryForm(BuildContext context, biodata bio) async {
        var result = await Navigator.push(
        context,
        MaterialPageRoute(
        builder: (BuildContext context) {
        return EntryForm(bio);
      }
      )
      );
      return result;
      }
      
}
