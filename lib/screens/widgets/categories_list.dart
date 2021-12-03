import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/categories_provider.dart';
import 'package:rzq_customer/screens/widgets/exp_tile.dart';
import 'package:rzq_customer/styles/app_const.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
            child: Text(
              "تخفيضات",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 3,
            thickness: 0.3,
          ),
          Expanded(
              child: Consumer<CategoriesProvier>(builder: (context, _categ, _) {
            return FutureBuilder(
                future: _categ.fetchCategories(),
                builder: (context, AsyncSnapshot snapshot) {
                  return ListView(
                      children: _categ.response.status == Status.LOADING
                          ? [
                              LinearProgressIndicator(),
                            ]
                          : _categ.categories!
                              .map((category) => ExpTile(
                                  onTap: () {},
                                  title: category.name ?? ""))
                              .toList());
                });
          }))
        ],
      ),
    );
  }
}
