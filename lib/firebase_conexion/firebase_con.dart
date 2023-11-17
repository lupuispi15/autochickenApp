import 'package:cloud_firestore/cloud_firestore.dart';


 FirebaseFirestore db = FirebaseFirestore.instance;
 Future<List> getUsers() async {
   
    List datas = [];
    CollectionReference collectionReference = db.collection('sensores');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs.forEach((element) {
      datas.add(element.data());
            datas.add(element.data());

    });
    return datas;
  }

