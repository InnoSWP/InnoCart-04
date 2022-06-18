
import 'package:flutter/material.dart';

import '../homescreen.dart';
import 'order.dart';

class AvailableOrders extends StatefulWidget {
  AvailableOrders({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  State<StatefulWidget> createState() => AvailableOrdersState();
}

class AvailableOrdersState extends State<AvailableOrders>{




  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    return SizedBox(height: h * 310/ 400, child:
    Column(

      children: [
        OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),
      ],
    )
    );
  }

}



