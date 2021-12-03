import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  static const nav = "/cart";
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  // @override
  // void initState() {
  //   init();
  //   super.initState();
  // }

  // void init() {
  //   flutterWebviewPlugin.reload();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // flutterWebviewPlugin.close();
        return Future.value(true);
      },
      child: SafeArea(
        child: Consumer<CartProvider>(builder: (context, _cart, child) {
          return _cart.link == null
              ? Container(
                  color:Theme.of(context).backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(Icons.shopping_cart,size: 50,),
                      TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, "/navigation"),
                          child: Text("اذهب للتسوق"))
                    ],
                  ),
                )
              : WebviewScaffold(
                  url: _cart.link!,
                );
        }),
      ),
    );
  }
}
