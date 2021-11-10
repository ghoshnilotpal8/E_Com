import 'package:flutter/material.dart';
import 'package:e_com/constants/constants.dart';
import 'package:vrouter/src/core/extended_context.dart';

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
        title: IconButton(
          onPressed: () {
            context.vRouter.to('/dashboard');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
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
                return ListTile(
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
                );
              },
            ),
      floatingActionButton: cart.isNotEmpty
          ? FloatingActionButton.extended(
              backgroundColor: Colors.orange.shade700,
              icon: Icon(Icons.delivery_dining),
              label: Text('Proceed to checkout with ${cart.length} items'),
              onPressed: () {},
            )
          : null,
    );
  }
}
