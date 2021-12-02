import 'package:flutter/material.dart';
import 'components/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              constraints: BoxConstraints(),
              padding: EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Text("Profile", style: TextStyle(color: Colors.black)),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Hero(
                    tag: 'profile',
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://thispersondoesnotexist.com/image'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icon(Icons.person, color: Colors.black),
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icon(Icons.notifications, color: Colors.black),
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icon(Icons.settings, color: Colors.black),
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icon(Icons.help, color: Colors.black),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
