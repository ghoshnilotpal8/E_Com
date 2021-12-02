import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 70),
        child: ElevatedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 2,
              ),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(kBackgroundColor),
          ),
          onPressed: press,
          child: Row(
            children: [
              icon,
              SizedBox(width: 20),
              Expanded(
                  child: Text(text, style: TextStyle(color: Colors.black))),
              Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
