import 'package:flutter/material.dart';
class ProductPlaceholder extends StatelessWidget {
  const ProductPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade400,
                  ),
            ),
          ),
       
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0,vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 9,
                  margin: const EdgeInsets.only(left: 60),
                  color: Colors.grey.shade400,
                ),
                  Container(
                  height: 9,
                  margin: const EdgeInsets.only(left: 40, top: 8),
                  color: Colors.grey.shade400,
                ),
               
                Container(
                  height: 9,
                  margin: const EdgeInsets.only(left: 20, top: 8),
                  color: Colors.grey.shade400,
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}