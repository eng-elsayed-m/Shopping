import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/providers/product_profile.dart';
import 'package:rzq_customer/screens/product_screen/product_screen.dart';
import 'package:rzq_customer/screens/widgets/products/product_card.dart';
import 'package:rzq_customer/screens/widgets/products/product_list_item.dart';

class ProductsView extends StatelessWidget {
  final bool? listLayout;
  final List<Data>? products;

  ProductsView({Key? key, this.listLayout, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: products!
          .map((prod) => InkWell(
                child: listLayout!
                    ? ProductListItem(
                        product: prod,
                      )
                    : ProductCard(
                        product: prod,
                      ),
                onTap: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .fetchProduct(prod.slug!);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(),
                      ));
                },
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: listLayout! ? 4.0 : 0.68,
        crossAxisCount: listLayout! ? 1 : 2,
      ),
    );
  }
}
