import 'dart:convert';
import 'package:e_com/models/cementModel.dart';
import 'package:e_com/widgets/cement_item.dart';
import 'package:e_com/widgets/search_box.dart';
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
  List<Cement> _data = <Cement>[];

  Future<String> loadNoteAsset() async {
    return await rootBundle.loadString('assets/data/cement.json');
  }

  void parsePost() async {
    String source = await loadNoteAsset();
    final parsed = jsonDecode(source);
    for (var item in parsed) {
      _data.add(Cement.fromJson(item));
    }
    setState(() {
      _data = _data;
    });
    print(_data);
  }

  @override
  void initState() {
    parsePost();
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
              child: Text('Cement',
                  style: GoogleFonts.alfaSlabOne(fontSize: 20.sp)),
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
            )
          ],
        ),
      ),
    );
  }
}
