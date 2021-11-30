import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? index = int.parse(context.vRouter.pathParameters['index']!);
    final String? fromItem = context.vRouter.pathParameters['fromItem']!;
    print("fromItem: $fromItem");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () {
            if (fromItem == 'false') {
              context.vRouter.pop();
            } else {
              context.vRouter.toNamed('items',
                  pathParameters: {'category': '${data[index!].category}'});
            }
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Hero(
              tag: data[index!].name!,
              child: Container(
                color: Color(0xFFEAF3FC),
                child: Image.network(
                  data[index].imag!,
                  scale: 1.2,
                ),
                height: 300.sp,
                width: 300.sp,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: ScreenUtil().setSp(300),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          ),
          color: kBackgroundColor,
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBackgroundColor,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 2,
                      ),
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
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Text(
                        '₹${data[index].price!}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                data[index].name! + ' ' + data[index].category!,
                style: GoogleFonts.rubik(
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Cose dinanzi forse delle carissime sogiacere alla quella, che dico giudice quegli cosa. Nome di speranza da raccontare noi esser che, informati della dell\'occhio della giudice. Come essaudisce dallo esperienza.',
                style: GoogleFonts.montserrat(
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
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
        ),
        child: FloatingActionButton.extended(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          label: Text(
            'Add to cart',
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: kBackgroundColor,
          onPressed: () {
            cart.add(data[index]);
          },
        ),
      ),
    );
  }
}
