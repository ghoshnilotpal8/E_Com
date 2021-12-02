import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class PastOrder extends StatelessWidget {
  const PastOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                context.vRouter.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Text(
              'Your Orders',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            OrderItem(),
            OrderItem(),
            OrderItem(),
            OrderItem(),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: #123456789',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Order Date: 12/12/2019',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Order Status: Confirmed',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Payment Method: ' + payment[paymentMethodSelected],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Delivery Address --> ' + address[addressSelected],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
