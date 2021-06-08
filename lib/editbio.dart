import 'package:flutter/material.dart';
import 'package:projectakhir/database.dart';
import 'biodata.dart';

  class Editbio extends StatefulWidget {
    final String name;
  final String tgllahir;
  final String alamat;
  final String id;

  Editbio(this.name, this.tgllahir, this.alamat, this.id);
 
    @override
  EditbioState createState() => EditbioState();
  }
//class controller
    class EditbioState extends State<Editbio> {
    biodata bio;
    
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController addressController = TextEditingController();
 
    @override
    Widget build(BuildContext context) {
    //kondisi
        
        nameController.text = widget.name;
        ageController.text = widget.tgllahir;
        addressController.text = widget.alamat;
        
    //rubah
      return Scaffold(
          appBar: AppBar(
          title: bio == null ? Text('Tambah') : Text('Ubah'),
         // leading: Icon(Icons.keyboard_arrow_left),
          ),
       body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
          children: <Widget> [
          // nama
          Padding (
          padding: EdgeInsets.only(top:20.0, bottom:20.0),
          child: TextField(
       controller: nameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'Nama Pasien', 
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          ),
          ),
          onChanged: (value) {
          //
          },
          ),
          ),
          // harga
      Padding (
      padding: EdgeInsets.only(top:20.0, bottom:20.0),
      child: TextField(
      controller: ageController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
      labelText: 'Tanggal Lahir',
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      ),
      ),
       onChanged: (value) {
    //
    },
    ),
    ),
     Padding (
          padding: EdgeInsets.only(top:20.0, bottom:20.0),
          child: TextField(
       controller: addressController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'Alamat', 
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          ),
          ),
          onChanged: (value) {
          //
          },
          ),
          ),
 // tombol button
    Padding (
    padding: EdgeInsets.only(top:20.0, bottom:20.0),
    child: Row(
    children: <Widget> [
    // tombol simpan
    Expanded(
    child: RaisedButton(
    color: Theme.of(context).primaryColorDark,
    textColor: Theme.of(context).primaryColorLight,
    child: Text(
          'Save',
          textScaleFactor: 1.5,
          ),
          onPressed: () async{
           await Database.updateItem(
             name: nameController.text,
             tgllahir: ageController.text,
             alamat: addressController.text,
             docId: widget.id,
           );

            // kembali ke layar sebelumnya dengan membawa objek item
            Navigator.pop(context, bio);
            },
 ),
 ),
      Container(width: 5.0,),
      // tombol batal
      Expanded(
        child: RaisedButton(
        color: Theme.of(context).primaryColorDark,
        textColor: Theme.of(context).primaryColorLight,
        child: Text(
        'Cancel',
        textScaleFactor: 1.5,
        ),
      onPressed: () {
      Navigator.pop(context);
      },
 ),
 ),
 ],
 ),
 ),
 ],
 )
 )
 );
 }
}