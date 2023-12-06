
import 'package:firebase_database/firebase_database.dart';

class Firebasefunciones {
  Future<double?> getComida() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await databaseReference
    .child('Sensores')
    .orderByChild('food')
    .once();
    if (snapshot.snapshot.value !=null) {
      for (final childSnapshot in snapshot.snapshot.children) {
        if (childSnapshot.key == "food") {
          String food = childSnapshot.value.toString();
          double? valorfood = double.tryParse(food);
          if (valorfood != null) {
           return valorfood;
          }
        }
      }
    }
    return null;
  }
  Future<double?> getAgua() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await databaseReference
    .child('Sensores')
    .orderByChild('water')
    .once();
    if (snapshot.snapshot.value !=null) {
      for (final childSnapshot in snapshot.snapshot.children) {
        if (childSnapshot.key == "water") {
          String agua = childSnapshot.value.toString();
          double? valorawa = double.tryParse(agua);
          if (valorawa != null) {
           return valorawa;
          }
        }
      }
    }
    return null;
  }
  Future<double?> getTemp() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await databaseReference
    .child('Sensores')
    .orderByChild('temp')
    .once();
    if (snapshot.snapshot.value !=null) {
      for (final childSnapshot in snapshot.snapshot.children) {
        if (childSnapshot.key == "temp") {
          String tempe = childSnapshot.value.toString();
          double? valortempe = double.tryParse(tempe);
          if (valortempe != null) {
           return valortempe;
          }
        }
      }
    }
    return null;
  }
  Future<double?> getHum() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await databaseReference
    .child('Sensores')
    .orderByChild('temp')
    .once();
    if (snapshot.snapshot.value !=null) {
      for (final childSnapshot in snapshot.snapshot.children) {
        if (childSnapshot.key == "hum") {
          String hume = childSnapshot.value.toString();
          double? valorhume = double.tryParse(hume);
          if (valorhume != null) {
           return valorhume;
          }
        }
      }
    }
    return null;
  }
}

