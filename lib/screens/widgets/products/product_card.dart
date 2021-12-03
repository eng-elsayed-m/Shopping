import 'package:flutter/material.dart';
import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/screens/widgets/products/add_button.dart';
import 'package:rzq_customer/styles/app_const.dart';

class ProductCard extends StatelessWidget {
  final Data? product;
  ProductCard({Key? key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _key = ValueKey(product!.id);

    return Container(
      key: _key,
      padding: const EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 3,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade400,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product!.images!.first!.path!,
                      ),
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
              child: Text(
                product!.name!,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15.0,
                  ),
                  FittedBox(
                      child: Center(
                          child: Text(
                    product!.price!.formatted!,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ))),
                  Spacer(),
                  AddButton(id: product!.id),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
