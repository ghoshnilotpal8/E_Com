import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () => Navigator.pop(context),
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
              tag: data[index].name!,
              child: Container(
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
          color: Colors.red.shade100,
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
                      color: Colors.green.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Text(
                        '₹${data[index].price!}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
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
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.shopping_cart),
        label: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
          child: Text('Add to cart'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.orange.shade700,
        onPressed: () {
          cart.add(data[index]);
        },
      ),
    );
  }
}
