import 'dart:convert';
import 'package:e_com/models/model_class.dart';
import 'package:e_com/widgets/cement_item.dart';
import 'package:e_com/widgets/search_box.dart';
import 'package:e_com/widgets/steel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<ModelClass> _data = <ModelClass>[];
  List<ModelClass> _data1 = <ModelClass>[];

  Future<String> loadNoteAsset() async {
    return await rootBundle.loadString('assets/data/cement.json');
  }

  Future<String> loadNoteAsset1() async {
    return await rootBundle.loadString('assets/data/steel.json');
  }

  void parsePost() async {
    String source = await loadNoteAsset();
    final parsed = jsonDecode(source);
    for (var item in parsed) {
      _data.add(ModelClass.fromJson(item));
    }
    setState(() {
      _data = _data;
    });
    print(_data);
  }

  void parsePost1() async {
    String source = await loadNoteAsset1();
    final parsed = jsonDecode(source);
    for (var item in parsed) {
      _data1.add(ModelClass.fromJson(item));
    }
    setState(() {
      _data1 = _data1;
    });
    print(_data1);
  }

  @override
  void initState() {
    parsePost();
    parsePost1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 20.0.sp, bottom: 10.sp),
          child: Text(
            'Buy Materials',
            style: GoogleFonts.fredokaOne(
              fontSize: 30.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchBox(),
            Image.asset('assets/images/offer.jpg'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cement',
                    style: GoogleFonts.alfaSlabOne(fontSize: 20.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See More',
                      style: GoogleFonts.alfaSlabOne(
                          fontSize: 10.sp, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: 300.h,
                child: ListView.builder(
                  itemCount: _data.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CementItem(
                      name: _data[index].name!,
                      price: _data[index].price!,
                      imgUrl: _data[index].imag!,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Steel',
                    style: GoogleFonts.alfaSlabOne(fontSize: 20.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See More',
                      style: GoogleFonts.alfaSlabOne(
                          fontSize: 10.sp, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: 300.h,
                child: ListView.builder(
                  itemCount: _data1.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SteelItem(
                      name: _data1[index].name!,
                      price: _data1[index].price!,
                      imgUrl: _data1[index].imag!,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
