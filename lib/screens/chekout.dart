import 'package:e_com/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
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
              'Select Address',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                address.removeAt(selectedIndex);
              });
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: address.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.blue.withOpacity(1)
                        : Colors.grey.withOpacity(0.2),
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
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      address[index],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                  onTap: () {
                    addressSelected = index;
                    print('Address Selected is ' + address[addressSelected]);
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: fabDecoration,
            child: FloatingActionButton.extended(
                label: Text(
                  'Add New Address',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                backgroundColor: kBackgroundColor,
                icon: Icon(Icons.add, color: Colors.grey.shade600),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: 200.sp,
                          child: Column(
                            children: <Widget>[
                              Form(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Enter here...',
                                    border: InputBorder.none,
                                  ),
                                  onFieldSubmitted: (value) {
                                    if (value != '') {
                                      setState(() {
                                        address.add(value);
                                      });
                                    }
                                    Navigator.pop(context);
                                  },
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: fabDecoration,
            child: FloatingActionButton.extended(
              label: Text(
                'Continue with Payment',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              backgroundColor: kBackgroundColor,
              icon: Icon(Icons.payment, color: Colors.grey.shade600),
              onPressed: () {
                context.vRouter.to('/payment');
              },
              heroTag: null,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
