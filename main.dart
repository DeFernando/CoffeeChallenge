import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Coffee Challenge',
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Icon(Icons.chevron_left_sharp,
                    color: Colors.black, size: 35),
                actions: [
                  Icon(Icons.shopping_bag_outlined,
                      color: Colors.black, size: 30),
                  Padding(padding: EdgeInsets.only(right: 10))
                ]),
            body: Content(),
            floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Menú",
                      style: TextStyle(                        
                        
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 30,
                    color: Colors.white,
                  )
                ])));
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState()=>_ContentState();  
}


class _ContentState extends State<Content>{
int indexAux=0;
List imgData = [
    ["Caramel\nMacchiato", "\$2.50"],
    ["Caramel\nDrink", "\$3.50"],
    ["Coffee\nMocha", "\$5.00"],
    ["Capucchino\nCoffee", "\$6.80"],    
    ["Vanilla\nCoffee", "\$3.80"],    
    ["Vanilla\nCoffee", "\$3.80"],    
    ["Vanilla\nCoffee", "\$3.80"],    
  ];
  List<String> img = [
    "assets/images/4.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/12.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
            child: ClipPath(
              child: Container(
                color: Colors.brown,
              ),
              clipper: ClipPathClass(),
            ),
            opacity: 0.3),
        Column(mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          Padding(
              padding: EdgeInsets.only(top: 45, bottom: 15),
              child:Text(imgData[indexAux][0],style: TextStyle(fontSize: 45, fontFamily: "absender"),textAlign: TextAlign.center,),
              ),
          Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: Text(imgData[indexAux][1],style: TextStyle(fontSize: 35, color: Colors.grey))),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 33),
            child: Swiper(
                layout: SwiperLayout.STACK,
                scale: 0.9,
                viewportFraction: 0.9,
                itemWidth: 400,
                itemHeight: 500,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Image(image: AssetImage(img[index]));
                },
                onIndexChanged: (index){
                  setState(() {
                    indexAux=index;
                  });                
                },
                itemCount: img.length),
          ))
        ])
      ],
    );
  }
}
class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 0.7, size.height * 0.8, size.width, size.height * 1);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
