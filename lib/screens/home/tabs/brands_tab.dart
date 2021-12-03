import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/brands_provider.dart';
import 'package:rzq_customer/screens/widgets/brand_card.dart';
import 'package:rzq_customer/screens/widgets/sort_bar.dart';

class BrandsTab extends StatefulWidget {
  @override
  _BrandsTabState createState() => _BrandsTabState();
}

class _BrandsTabState extends State<BrandsTab> {
  bool listLayout = false;

  void changeLayout(bool isList) {
    setState(() {
      listLayout = isList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandsProvider>(builder: (context, _brands, _) {
        return Container(
          color: Theme.of(context).backgroundColor,
                  padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _brands.fetchBrands(),
                      builder: (context, AsyncSnapshot snapshot) {
              return Column(
                children: [
                  SortBar(true, changeLayout),
                   snapshot.connectionState == ConnectionState.waiting
                                      ? 
                                          LinearProgressIndicator()
                                         
                                      :
                  Expanded(
                    child: 
                            GridView(
                              children: _brands.brands!
                                      .map((brand) => BrandCard(
                                            name: brand.name,
                                          ))
                                      .toList(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.38,
                                  crossAxisCount: listLayout ? 1 : 3,
                                  crossAxisSpacing: 6),
                            )
                          
                    
                  )
                ],
              );
            }
          ),
        );
      }
    );
  }
}
