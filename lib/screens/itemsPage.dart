import 'package:e_com/constants/constants.dart';
import 'package:e_com/models/model_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemPage extends StatelessWidget {
  ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? category = context.vRouter.pathParameters['category'];
    final List<ModelClass> categoryData = getData(category);
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6.w,
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.only(top: 10.w, bottom: 10.0.w, left: 10.0.w),
        physics: BouncingScrollPhysics(),
        itemCount: categoryData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
              child: InkWell(
                onTap: () {
                  context.vRouter.toNamed('details',
                      pathParameters: {'index': '$index', 'fromItem': 'true'});
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Hero(
                            tag: categoryData[index].name!,
                            child: Image.network(
                              categoryData[index].imag!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            categoryData[index].name! +
                                ' ' +
                                categoryData[index].category!,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ' \₹' + categoryData[index].price!,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.5,
                              ),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kBackgroundColor),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade800),
                          ),
                          onPressed: () {
                            cart.add(categoryData[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
