
import 'package:flutter/material.dart';

import '../homescreen.dart';
import 'order.dart';

class OrderView extends StatefulWidget {
  OrderView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrderViewState();
}

class OrderViewState extends State<OrderView>{




  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    return SizedBox(height: h * 310/ 400, child:
    Column(

      children: [

      ],
    )
    );
  }

}



