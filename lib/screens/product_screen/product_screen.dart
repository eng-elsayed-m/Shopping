import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/providers/cart_provider.dart';
import 'package:rzq_customer/providers/product_profile.dart';
import 'package:rzq_customer/screens/widgets/header_widget.dart';
import 'package:rzq_customer/screens/widgets/products/add_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _key = UniqueKey();
    final deviceSize = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(
        key: _key,
        builder: (context, _product, child) => Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text(
                     _product.product != null ? _product.product!.name! : "",
                      style: Theme.of(context).textTheme.headline6,
                    ),
            ),
            body: _product.response.status == Status.LOADING
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ProductViewWidget(
                                deviceSize: deviceSize,
                                image: _product.product!.images!.first.path,
                              ),
                              BasicInfoWidget(
                                name: _product.product!.name,
                                price: _product.product!.price!.formatted,
                                id: _product.product!.id,
                              ),
                              DetailsWidget(
                                deviceSize: deviceSize,
                                description: _product.product!.description,
                              ),
                              HeaderWidget(
                                title: "منتجات قد تعجبك",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
  }
}

class ProductViewWidget extends StatelessWidget {
  final Size? deviceSize;
  final String? image;
  const ProductViewWidget({Key? key, this.deviceSize, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: deviceSize!.width,
          height: deviceSize!.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image!),
              )),
        ),
        Positioned(
          right: 20,
          bottom: 10,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.share,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BasicInfoWidget extends StatelessWidget {
  final String? name;
  final String? price;
  final int? id;
  const BasicInfoWidget({Key? key, this.name, this.price, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      title: 
      Row(
        children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name!,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText2,
          maxLines: 2,
        ),
      ),Spacer(),Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10.0),
        child: AddButton(id: id),
      )],),
      
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              price.toString(),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Chip(
            label: Text(
              "السعر شامل الضريبة",
              style: Theme.of(context).textTheme.overline,
            ),
          )
        ],
      ),
    );
  }
}

class DetailsWidget extends StatefulWidget {
  final Size? deviceSize;
  final String? description;

  const DetailsWidget({Key? key, this.deviceSize, this.description})
      : super(key: key);
  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           HeaderWidget(
          title: "التفاصيل",
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              child: Icon(
                expanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                size: 60,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          )
        ],),
       
        AnimatedContainer(
          duration: Duration(microseconds: 300),
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              expanded ? Colors.transparent : Colors.grey.shade50,
              Colors.transparent
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          )),
          constraints: !expanded
              ? BoxConstraints(maxHeight: widget.deviceSize!.height * 0.21)
              : BoxConstraints(),
          child: Html(data: widget.description),
        ),
      ],
    );
  }
}
