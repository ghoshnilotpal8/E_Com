import 'package:e_com/constants/constants.dart';
import 'package:e_com/screens/cartScreen.dart';
import 'package:e_com/screens/chekout.dart';
import 'package:e_com/screens/confirmation.dart';
import 'package:e_com/screens/dashboard.dart';
import 'package:e_com/screens/detailsPage.dart';
import 'package:e_com/screens/itemsPage.dart';
import 'package:e_com/screens/logScreen.dart';
import 'package:e_com/screens/past_orders.dart';
import 'package:e_com/screens/payment.dart';
import 'package:e_com/screens/supScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vrouter/vrouter.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
      routes: [
        VWidget(path: '/', widget: SplashScreen()),
        VWidget(path: '/logIn', widget: LogIn()),
        VWidget(path: '/signUp', widget: SignUp()),
        VWidget(
          path: '/dashboard',
          widget: DashBoard(),
          stackedRoutes: [
            VWidget(path: '/cart', widget: CartScreen(), stackedRoutes: [
              VWidget(path: '/checkout', widget: CheckOut(), stackedRoutes: [
                VWidget(
                  path: '/payment',
                  widget: Payment(),
                  stackedRoutes: [
                    VWidget(path: '/confirm', widget: Confirmation()),
                  ],
                ),
              ]),
            ]),
            VWidget(
              path: 'category=:category',
              name: 'items',
              widget: ItemPage(),
            ),
            VWidget(
              path: 'index=:index/fromItem=:fromItem',
              name: 'details',
              widget: DetailsWidget(),
            ),
            VWidget(path: '/pastOrders', widget: PastOrder())
          ],
        ),
      ],
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    logScreenNavigator(context);
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      body: Center(
        child: Text('Get Amazing Deals Inside'),
      ),
    );
  }

  Future logScreenNavigator(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2), () {
      context.vRouter.to('/logIn');
    });
  }
}
