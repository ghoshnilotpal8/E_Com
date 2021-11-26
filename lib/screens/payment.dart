import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedIndex = 0;
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
              'Select Payment Method',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: payment.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.blue.withOpacity(1)
                        : Colors.grey.withOpacity(0.2),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-6.0, -6.0),
                      blurRadius: 16.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ExpansionTile(
                      title: Text(
                        payment[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        if (payment[index] == 'Credit Card' ||
                            payment[index] == 'Debit Card')
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Card Number',
                            ),
                          )
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                    ),
                  ),
                  onTap: () {
                    paymentMethodSelected = index;
                    print('Address Selected is ' +
                        payment[paymentMethodSelected]);
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        decoration: fabDecoration,
        child: FloatingActionButton.extended(
          label: Text(
            'Checkout',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          backgroundColor: kBackgroundColor,
          icon: Icon(Icons.payment, color: Colors.grey.shade600),
          onPressed: () {},
          heroTag: null,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
