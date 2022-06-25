
import 'package:flutter/material.dart';
import 'package:innocart/subscreens/angel.dart';
import '../homescreen.dart';
import 'order.dart';

class DeliveryStatus extends StatefulWidget {
  DeliveryStatus({Key? key,required this.order}) : super(key: key);
  OrderBox order;

  @override
  State<StatefulWidget> createState() => DeliveryStatusState();
}

class DeliveryStatusState extends State<DeliveryStatus>{
  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;

    return
      Column(
          children: [
            SizedBox(width: w, child :Image.network("https://assets-global.website-files.com/6050a76fa6a633d5d54ae714/609147088669907f652110b0_report-an-issue(about-maps).jpeg"))
            ,super.widget.order,
            
          ]
      );
  }
}



