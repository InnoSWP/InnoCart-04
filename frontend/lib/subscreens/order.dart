
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:innocart/homescreen.dart';
import 'package:innocart/network/addangelservice.dart';
import 'package:innocart/network/post.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'angellist.dart';

class Order{
  late String title = "Apple",desc,customerName;
  late DateTime dateTime;
  late Image image,customerImage = Icons.person as Image;
  late double customerRating;

}
class OrderBox extends StatefulWidget {
  OrderBox(this.id,this.title,this.desc,this.time,this.urlpic,this.price,this.customerName,this.customerRating,this.customerId,this.state,this.angelNames,this.angelIds,{Key? key}) : super(key: key);
  String title,desc,time,urlpic,price,customerName;
  int customerId,id;
  Icon customerImage = const Icon(Icons.person);
  double customerRating;
  List<String> angelNames;List angelIds;
  int state = 1;//Angel Request(0) - Orders in progress customers (1) - Basic box for delivery (2)
  @override
  State<StatefulWidget> createState() => OrderBoxState();
}

class OrderBoxState extends State<OrderBox>{
  String dropdownValue = 'Choose an Angel';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = HomeScreenState.height, w = HomeScreenState.width;
    int s = widget.state;

    return  TextButton(onPressed: (){}, child:Stack(
        children: [
      Container(width: 0.9 * w, height: h * 0.16, decoration:
      BoxDecoration(color: const Color(0xffffffff),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      )
    ),
      Positioned(left: 10, top: 15,
      child: SizedBox(height: 100,width: 100,child:
      Image.network(widget.urlpic)))
      ,
         Positioned(left: 130, top: 12,
            child:   Text(widget.title, textAlign: TextAlign.center, style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Manrope',
              fontSize: 20,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1
          ),)),
          Positioned(left: 130, top: 40,
              child:   Text(widget.desc, textAlign: TextAlign.left, style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Manjari',
                  fontSize: 11,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),)),
          Positioned(left: 150, top: 60,
              child:   Text(widget.time, textAlign: TextAlign.center, style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Manjari',
                  fontSize: 12,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),)),
           Positioned(left: 130, top: 59,
              child:  Image.asset("assets/images/truck.png", scale: 49)),
          Positioned(left: 290, top: 20,
            child: Text(
              widget.price + "\n RUB",
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w900
              ),
            ),),
          Positioned(
              left: 130,
              top: 80,
              child: SizedBox(child: widget.customerImage)
          ),
          Positioned(
              left: 160,
              top: 88,
              child: Text(widget.customerName, style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Manjari',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ))),
          Positioned(

              left: 135,
              top: 105,
              child: RatingBar.builder(
                itemSize: 15,
            initialRating: widget.customerRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
            },
          ))
          ,
          if(s == 0)Positioned(

              left: 260,
              top:80,
              child:  TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(w * 0.2,20)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      Color current = buttonsColor2;
                      if (states.contains(MaterialState.hovered))
                        return current.withOpacity(0.7);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return current.withOpacity(0.6);
                      return current; // Defer to the widget's default.
                    },
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  addangelservice service = addangelservice([HomeScreenState.id]);
                  service.put(widget.id);
                },
                child: Text('Send request', textScaleFactor: 0.75,),
              )),
          if(s == 1)Positioned(

              left: 220,
              top:80,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: widget.angelNames
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),))
        ]));
  }
  Color buttonsColor1 = Color(0xffc3c3d3);
  Color buttonsColor2 = Color(0xff3b42f0);
}



