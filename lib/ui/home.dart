import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'detail.dart';

class Home extends StatelessWidget {

  double rating=0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CardWidget(data[0]),
              CardWidget(data[1]),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: 'photo1',
                    child:  _circleImage(context,'photo1',"https://s.aolcdn.com/dims-global/dims3/GLOB/legacy_thumbnail/640x400/quality/80/https://s.aolcdn.com/commerce/autodata/images/USC40LEC241A021001.jpg"),
                  ),
                  Hero(
                    tag: 'photo2',
                    child: _circleImage(context,'photo2',"https://img-ik.cars.co.za/legacy//uploads/2014/01/tr:n-news_large/lexus-ct200h-2.jpg"),
                  ),
                  Hero(
                    tag: 'photo3',
                    child: _circleImage(context,'photo3',"https://amp.businessinsider.com/images/592f4169b74af41b008b5977-750-563.jpg"),
                  )
                ],
              )
            ],
          )),
    );
  }
  
  var data=[
    'Firstly, We, Korea Software HRD Center, would like to introduce the reunion event, which is celebrated for gathering all alumni for sharing experience, creating and strengthening the network of the alumni and new generation.' ,
    'You’ve probably seen hero animations many times. For example, a screen displays a list of thumbnails representing items for sale. Selecting an item flies it to a new screen, containing more details and a “Buy” button. Flying an image from one screen to another is called a hero animation in Flutter, though the same motion is sometimes referred to as a shared element transition.',

  ];
  
  Widget _circleImage( BuildContext context, String tag,String imageUrl){
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(imageUrl,tag))),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill)
        ),
      ),
    );

  }
}


class CardWidget extends StatefulWidget {
  String content;
  
  CardWidget(this.content);
  
  @override
  _CardWidgetState createState() => _CardWidgetState(this.content);
}

class _CardWidgetState extends State<CardWidget> {
  String content;
  var rating=0.0;
  _CardWidgetState(this.content);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.9),
            child: Text((content == null ? '' : content),
              style: TextStyle(color: Colors.black, fontSize: 14.0),),
          ),
          Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                SmoothStarRating(
                  allowHalfRating: false,
                  onRatingChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                  rating: rating,
                  starCount: 5,
                  size: 25,
                  color: Colors.redAccent,
                  borderColor: Colors.redAccent,
                ),
                Padding(padding: EdgeInsets.only(left: 8),
                child: Text("$rating"),)
              ],
            ),
          SizedBox(height: 8,)
        ],
      ),
    );;
  }
}
