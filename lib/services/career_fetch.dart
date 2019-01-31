import 'package:cloud_firestore/cloud_firestore.dart';

class CareerFetcher {
  static CareerFetcher _instance;
  factory CareerFetcher() => _instance ??= new CareerFetcher._();

  CareerFetcher._();

  Future<dynamic> returnCareers(category) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('fl_content')
        .where('category', isEqualTo: category)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    var list = documents.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();
    return list;
  }
}
