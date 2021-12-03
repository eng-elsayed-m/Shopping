import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rzq_customer/screens/widgets/custom_tile.dart';

class ExpTile extends StatefulWidget {
  final Function? onTap;
  final String? title;
  final bool? expandable;
  final List<CustomTile>? list;

  ExpTile({
    Key? key,
    @required this.onTap,
    @required this.title,
    this.list,
    this.expandable = false,
  }) : super(key: key);

  @override
  State<ExpTile> createState() => _ExpTileState();
}

class _ExpTileState extends State<ExpTile> {
  bool? expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              onTap: widget.onTap!(),
              leading: Text(widget.title!,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              trailing: widget.expandable!
                  ? IconButton(
                      icon: !expanded!
                          ? Icon(FontAwesomeIcons.arrowCircleRight)
                          : Icon(FontAwesomeIcons.arrowCircleDown),
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () => setState(() {
                        expanded = !expanded!;
                      }),
                    )
                  : null,
            ),
            if (expanded!) ...widget.list ?? []
          ],
        ));
  }
}
