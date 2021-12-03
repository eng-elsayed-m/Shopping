import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String? title;

  const HeaderWidget({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          SizedBox(
              height: 40,
              width: 8,
              child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor)),
          const SizedBox(
            width: 15,
          ),
          Text(
            title!,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
