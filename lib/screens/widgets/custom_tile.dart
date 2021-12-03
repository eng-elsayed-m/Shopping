import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rzq_customer/styles/app_const.dart';

class CustomTile extends StatelessWidget {
  final String? title;
  final IconData? icon;

  const CustomTile({Key? key, @required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            if (icon != null)
              FaIcon(
                icon,
                color: Theme.of(context).primaryColor,
                size: AppConst.mIcon,
              ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              title!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
