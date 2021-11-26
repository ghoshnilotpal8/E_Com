import 'package:e_com/models/model_class.dart';
import 'package:flutter/material.dart';

List<ModelClass> data = <ModelClass>[];
List<ModelClass> cart = <ModelClass>[];

Color kBackgroundColor = Color(0xFFEAF3FC);

List<ModelClass> getData(String? category) {
  List<ModelClass> categoryData = <ModelClass>[];

  data.forEach((element) {
    if (element.category == category) {
      categoryData.add(element);
    }
  });
  return categoryData;
}

BoxDecoration fabDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.white,
      offset: Offset(-6.0, -6.0),
      blurRadius: 16.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      offset: Offset(6.0, 6.0),
      blurRadius: 16.0,
    ),
  ],
  border: Border.all(
    color: Colors.grey.withOpacity(0.1),
    width: 1,
  ),
);

int addressSelected = 0;
int paymentMethodSelected = 0;

List<String> address = <String>[add1, add2, add3];

List<String> payment = <String>[
  'Cash on Delivery',
  'Paytm',
  'Google Pay',
  'PhonePe',
  'Credit Card',
  'Debit Card',
  'Net Banking',
];

String add1 =
    'SMQ:- 133/04, Vayusena Nagar, Near Futala Lake, Nagpur, Maharashtra, India- 440007';
String add2 =
    'House no 14, hal Colony, Balanagr, Hyderabad, Telangana, India- 3023902';
String add3 =
    'SMQ:- 13/14, Vayusenabad, Devli, SouthDelhi, New Delhi, India- 110062';
