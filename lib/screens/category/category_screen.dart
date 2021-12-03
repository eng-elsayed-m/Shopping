import 'package:flutter/material.dart';
import 'package:rzq_customer/screens/widgets/categories_list.dart';
import 'package:rzq_customer/screens/widgets/slider_banner.dart';

class CategoryScreen extends StatelessWidget {
  static const nav = "/category";
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dInfo = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("التصنيفات"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: dInfo.size.width,
            height: dInfo.size.height,
            child: Column(
              children: [
                if (dInfo.orientation == Orientation.portrait) SliderBanner(),
                CategoriesList()
              ],
            ),
          ),
        ));
  }
}
