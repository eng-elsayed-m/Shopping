import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/cart_provider.dart';

class AddButton extends StatelessWidget {
  final int? id;

  const AddButton({Key? key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, _cart, child) {
      return InkWell(
        onTap: () async{
         return Platform.isAndroid ?
  showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  actions: [
                    Expanded(
                      child: ElevatedButton(
                        
                          onPressed: () async {
                            _cart.addToCart(id!).then((value) {
                              SnackBar snakeBar = SnackBar(
                                  content:
                                      _cart.response.status == Status.COMPLETE
                                          ? Text("تم اضافته الى السلة")
                                          : Text(_cart.response.message!));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakeBar);
                            });
                            Navigator.pop(context);
                          },
                          child: Text("نعم")),
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("لا"))
                  ],
                  content: Text("اضافة هذا المنتج الى السلة "),
                )):

   showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              title: const Text("اضافة هذا المنتج الى السلة "),
              actions: [
                CupertinoActionSheetAction(
                  child: const Text('نعم'),
                  isDestructiveAction: true,
                  onPressed: ()  async {
                          _cart.addToCart(id!).then((value) {
                            SnackBar snakeBar = SnackBar(
                                content:
                                    _cart.response.status == Status.COMPLETE
                                        ? Text("تم اضافته الى السلة")
                                        : Text(_cart.response.message!));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snakeBar);
                          });
                          Navigator.pop(context);
                        },
                ),
               
              ],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('الغاء'),
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
              ),
            );
          },
        );}
        ,
        child: Icon(
          Icons.add_circle,
          color: Theme.of(context).primaryColor,
          size: 40,
        ),
      );
    });
  }

}
