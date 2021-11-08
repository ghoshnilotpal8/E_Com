import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.grey.shade200,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.grey.shade500,
                  )),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
