import 'package:flutter/material.dart';
import 'package:e_com/constants/constants.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                context.vRouter.to('/dashboard');
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Text(
              'Your Cart',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: cart.isEmpty
          ? Center(child: Text('Cart is Empty'))
          : ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 10.0, left: 10.0),
              physics: BouncingScrollPhysics(),
              itemCount: cart.length,
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
                    child: ListTile(
                      enabled: true,
                      leading: Image.network(cart[index].imag!),
                      title: Text(cart[index].name!),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            cart.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      subtitle: Text('₹ ${cart[index].price!}'),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: cart.isNotEmpty
          ? Container(
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
                backgroundColor: kBackgroundColor,
                icon: Icon(Icons.delivery_dining, color: Colors.grey.shade600),
                label: Text(
                  'Proceed to checkout with ${cart.length} items',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            )
          : null,
    );
  }
}
