import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? category = context.vRouter.pathParameters['category'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              category!,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 10.0, left: 10.0),
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (data[index].category == category) {
            return Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
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
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    context.vRouter.toNamed('details', pathParameters: {
                      'index': '$index',
                      'fromItem': 'true'
                    });
                  },
                  enabled: true,
                  leading: Hero(
                    tag: data[index].name!,
                    child: Image.network(data[index].imag!),
                  ),
                  title: Text(data[index].name!),
                  subtitle: Text('₹ ${data[index].price!}'),
                  trailing: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      cart.add(data[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      height: 30.w,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1,
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
                      child: SvgPicture.asset(
                        "assets/svg/plus.svg",
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
