
import 'package:flutter/material.dart';

import '../homescreen.dart';
import 'order.dart';

class AddOrderScreen extends StatefulWidget {
  AddOrderScreen({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  State<StatefulWidget> createState() => AddOrderScreenState();
}

class AddOrderScreenState extends State<AddOrderScreen>{




  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    return  Align( child: SizedBox(width: w * 0.9, child:Column(


      children: [
        TextField(
          obscureText: false,

          onChanged: (String value) async{

            setState((){

            });
          },
          decoration: const InputDecoration(

            border: const OutlineInputBorder(),
            labelText: 'Product Name',
          ),
        ),SizedBox(height:20),
        TextField(
          obscureText: false,
          onChanged: (String value) async{

            setState((){

            });
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Delivery time',
            suffixIcon: Image.asset("assets/images/calendar.png", height: 10)
          ),
        ),SizedBox(height:20),
        TextField(
          obscureText:false,
          onChanged: (String value) async{

            setState((){

            });
          },
          decoration:  InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Address of the delivery',
              suffixIcon: Image.asset("assets/images/location.png", height: 10)
          ),
        ),SizedBox(height:20),
        Row(children: [
          SizedBox(width: w * 0.45, height: h * 0.1, child:
          TextField(
            onChanged: (String value) async{

              setState((){

              });
            },
            decoration: InputDecoration(

              border: OutlineInputBorder(),
              labelText: 'Price',
                suffixIcon: Image.asset("assets/images/currency1.png", height: 10)
            ),
          )),
          SizedBox(width: w * 0.45, height: h * 0.1, child: TextField(

            onChanged: (String value) async{

              setState((){

              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Delivery Tips',
                suffixIcon: Image.asset("assets/images/currency.png", height: 10)
            ),
          ))
        ],)
      ,  SizedBox(width: w * 0.9, height: h * 0.15, child: TextField(

          onChanged: (String value) async{

            setState((){

            });
          },
          expands: true,
         maxLines: null,
         minLines: null,

          decoration: InputDecoration(

              border: OutlineInputBorder(),
              labelText: 'Product Details',
              suffixIcon: Image.asset("assets/images/image.png", height: 40),
            suffixIconConstraints: BoxConstraints(

            )
          ),
        )),
        SizedBox(height: 20),
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(w * 0.9,50)),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue.withOpacity(0.7);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.blue.withOpacity(0.6);
                return Colors.blue; // Defer to the widget's default.
              },
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () { },
          child: Text('Add Order'),
        )
        ],
    )
    ))
    ;
  }

}



