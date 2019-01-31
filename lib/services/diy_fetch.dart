import 'package:cloud_firestore/cloud_firestore.dart';

class DIYFetcher {
  static DIYFetcher _instance;
  factory DIYFetcher() => _instance ??= new DIYFetcher._();

  DIYFetcher._();

  Future<dynamic> returnDIYItems() async {
    final DocumentSnapshot result = await Firestore.instance
        .collection('fl_content')
        .document('ji183hhP09BbjFD4FqgU')
        .get();

    var documents = result.data['diyStoreItem'];
    print(documents);
    return documents;
  }
}
