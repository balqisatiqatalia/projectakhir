import 'package:cloud_firestore/cloud_firestore.dart';
import 'biodata.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //siswa
  Future<void> savebiodata(biodata bio) {
    return _db.collection('Biodata').doc(bio.name).set(bio.toMap());
  }

  Stream<List<biodata>> getBiodata() {
    return _db.collection('Biodata').snapshots().map((snapshot) => snapshot.docs
        .map((document) => biodata.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removebiodata(String id) {
    return _db.collection('Biodata').doc(id).delete();
  }

  // //mapel
  // Future<void> saveMapel(Mapel mapel) {
  //   return _db.collection('mapels').doc(mapel.mapelId).set(mapel.toMap());
  // }

  // Stream<List<Mapel>> getMapels() {
  //   return _db.collection('mapels').snapshots().map((snapshot) => snapshot.docs
  //       .map((document) => Mapel.fromFirestore(document.data()))
  //       .toList());
  // }

  // Future<void> removeMapel(String mapelId) {
  //   return _db.collection('mapels').doc(mapelId).delete();
  // }
}
