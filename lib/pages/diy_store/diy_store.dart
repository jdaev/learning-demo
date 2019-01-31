import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/diy_store/diy_video_thumbnail_widget.dart';
import 'package:flutter/material.dart';
import 'package:edapt/services/diy_fetch.dart';

class DIYStoreScreen extends StatefulWidget {
  @override
  DIYStoreScreenState createState() {
    return new DIYStoreScreenState();
  }
}

class DIYStoreScreenState extends State<DIYStoreScreen> {
  DIYFetcher helper = new DIYFetcher();

  Future<dynamic> _diyData;
  Future<dynamic> get diyList => _diyData ??= helper.returnDIYItems();

  getDIYList() async {
    var diyListData = await diyList;
    return diyListData;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width ;

    return Scaffold(
        appBar: AppBar(
          title: Text('DIY Store'),
        ),
        body: FutureBuilder(
            future: getDIYList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //List content = snapshot.data[0];
              if(snapshot.hasData){
              return GridView.builder(
                //crossAxisCount: 2,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(16.0),
                //crossAxisSpacing: 10.0,
                //mainAxisSpacing: 4.0,
                //childAspectRatio: (itemWidth / itemHeight),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                itemBuilder: (BuildContext context, int index) {
                return DIYThumbnail(
                  imagePath: 'https://img.youtube.com/vi/' + snapshot.data[index]['vIdeoId'].toString() + '/mqdefault.jpg',
                  title: snapshot.data[index]['name'],
                  items: snapshot.data[index]['things'],
                  steps: snapshot.data[index]['steps'],
                  videoLink: snapshot.data[index]['videoLink'],
                  description: snapshot.data[index]['description'],
                );
                }
              );}
              else{
                return Container();
              }
            }));
  }
}
