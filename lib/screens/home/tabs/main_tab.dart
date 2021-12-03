import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/products_provider.dart';
import 'package:rzq_customer/screens/widgets/products/product_placeholder.dart';
import 'package:rzq_customer/screens/widgets/products/products_vertical_list.dart';
import 'package:rzq_customer/screens/widgets/slider_banner.dart';
import 'package:rzq_customer/screens/widgets/header_widget.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  
  Widget indicator(Size siz){
    return  Container(
      constraints: BoxConstraints(
        maxHeight: 300,
        minHeight: 270,
      ),
      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 7, itemBuilder: (context,int i)=> Container(width: siz.width *0.55, child: ProductPlaceholder())));
  }
  @override
  Widget build(BuildContext context) {
        final dSize = MediaQuery.of(context).size;

    return Container(
        color: Theme.of(context).backgroundColor,
        child: Consumer<ProductsProvider>(builder: (context, _products, child) {
          return _products.response.status == Status.ERROR
              ? Center(child: Text(_products.response.message!))
              : RefreshIndicator(
                onRefresh: ()=> _products.refreshProducts(),
                child: ListView(
                    children: [
                      SliderBanner(),
                      SizedBox(
                        height: 10,
                      ),
                      HeaderWidget(title: "الاكثر مبيعا"),
                      _products.response.status == Status.LOADING
                          ? indicator(dSize)
                          : ProductsVerticalList(_products.products!),
                      HeaderWidget(title: "المنتجات الاعلى تقيماََ"),
                      _products.response.status == Status.LOADING
                          ? indicator(dSize)
                          : ProductsVerticalList(_products.products!),
                      HeaderWidget(title: "عروض"),
                      _products.response.status == Status.LOADING
                          ? indicator(dSize)
                          : ProductsVerticalList(_products.products!),
                    ],
                  ),
              );
        }));
  }
}
