
import 'package:flutter/material.dart';
import 'package:innocart/network/listordersservice.dart';
import 'package:innocart/network/post.dart';
import 'package:innocart/network/service.dart';
import '../homescreen.dart';
import 'order.dart';

class AvailableOrders extends StatefulWidget {
  AvailableOrders({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  State<StatefulWidget> createState() => AvailableOrdersState();
}

class AvailableOrdersState extends State<AvailableOrders>{


  List<OrderBox> orders = <OrderBox>[];
  @override
  void initState(){
    listordersservice().getOrders((){setState((){});},orders,0);
  }
  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    return
      Column(

        children: orders
      );
  }

}



