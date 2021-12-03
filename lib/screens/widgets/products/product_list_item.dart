import 'package:flutter/material.dart';
import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/screens/widgets/products/add_button.dart';
import 'package:rzq_customer/styles/app_const.dart';

class ProductListItem extends StatelessWidget {
  final Data? product;

  const ProductListItem({Key? key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade400,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product!.images!.isEmpty
                          ? AppConst.placeholder
                          : product!.images!.first!.path!,
                    ),
                  )),
            ),
            Flexible(
              flex: 3,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                title: Text(
                  product!.name!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  "SAR " + product!.price!.formatted!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddButton(id: product!.id),
            ),
          ],
        ),
      ),
    );
  }
}
