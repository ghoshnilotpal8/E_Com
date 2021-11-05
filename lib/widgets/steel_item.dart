import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SteelItem extends StatelessWidget {
  const SteelItem({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String imgUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.h,
              width: 230.w,
              child: Image.network(imgUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Steel',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    '\$$price ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0.sp),
                        color: Colors.green),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_outlined,
                          color: Colors.white, size: 17.w),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
