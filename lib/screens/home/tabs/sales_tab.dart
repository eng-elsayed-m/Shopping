import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/indicator.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/products_provider.dart';
import 'package:rzq_customer/screens/widgets/products/product_placeholder.dart';
import 'package:rzq_customer/screens/widgets/products/products_view.dart';
import 'package:rzq_customer/screens/widgets/sort_bar.dart';

class SalesTab extends StatefulWidget {
  SalesTab({Key? key}) : super(key: key);

  @override
  _SalesTabState createState() => _SalesTabState();
}

class _SalesTabState extends State<SalesTab> {
  bool listLayout = false;

  void changeLayout(bool isList) {
    setState(() {
      listLayout = isList;
    });
  }
  Widget _indicator(BuildContext context)=> GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: 3/5

          ), itemBuilder: (context,int i)=> ProductPlaceholder());
  @override
  Widget build(BuildContext context) {
    return Container(
              color: Theme.of(context).backgroundColor,

      child: Column(
        children: [
          SortBar(false, changeLayout),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: Consumer<ProductsProvider>(builder: (context, _products, child) {
                return _products.response.status == Status.LOADING
                    ? _indicator(context)
                    : ProductsView(
                        listLayout: listLayout,
                        products: _products.products,
                      );
              }),
            ),
          )
        ],
      ),
    );
  }
}
