import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/providers/product_profile.dart';
import 'package:rzq_customer/screens/product_screen/product_screen.dart';
import 'package:rzq_customer/screens/widgets/products/product_card.dart';

class ProductsVerticalList extends StatelessWidget {
  ProductsVerticalList(this.products);
  final List<Data> products;
  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        maxHeight: 300,
        minHeight: 270,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .fetchProduct(products[index].slug!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(),
                        ));
                  },
                  child: Container(
                    width: dSize.width * 0.55,
                    child: ProductCard(
                      product: products[index],
                    ),
                  ),
                )),
      ),
    );
  }
}
