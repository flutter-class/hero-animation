import 'package:flutter/material.dart';

class Detail extends StatelessWidget{
  String imageUrl;
  String tag;
  Detail(this.imageUrl,this.tag);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
        centerTitle: true,
      ),
      body: Center(
          child: Hero(tag: tag,
            child:  Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,
              decoration:  BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill)
              ),
            ),
          )
      ),
    );
  }
}