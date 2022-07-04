
import 'package:flutter/material.dart';

import '../homescreen.dart';
import '../network/listordersservice.dart';
import 'order.dart';

class OrdersInProgress extends StatefulWidget {
  OrdersInProgress({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  State<StatefulWidget> createState() => OrdersInProgressState();
}

class OrdersInProgressState extends State<OrdersInProgress>{

  List<OrderBox> orders = <OrderBox>[];
  @override
  void initState(){
    listordersservice().getOrders((){setState((){});},orders,1);
  }

  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    for(var x in orders){
      print("test" + x.customerId.toString());
    }
    print(HomeScreenState.id);
   //orders = orders.where((f) => (f.customerId == HomeScreenState.id)).toList();

    return
    Column(
      children: orders
    );
  }

}



