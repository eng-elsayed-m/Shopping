import 'package:flutter/material.dart';
import 'package:rzq_customer/styles/app_const.dart';

class SortBar extends StatefulWidget {
  final bool addSearch;
  final Function? changeLayout;
  const SortBar([this.addSearch = false, this.changeLayout]);

  @override
  _SortBarState createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  bool _isList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !widget.addSearch
              ? TextButton(
                  child: Text(
                    "الترتيب",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                )
              : Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                    child: TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "الماركات",
                        hintStyle: TextStyle(fontSize: 12),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isList = !_isList;
                  widget.changeLayout!(_isList);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Icon(
                    _isList
                        ? Icons.grid_view
                        : Icons.format_line_spacing_outlined,
                    // color: Theme.of(context).colorScheme.secondary,
                    size: AppConst.mIcon,
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 5,
              // ),
              // InkWell(
              //   onTap: () => widget.changeLayout(false),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       color: Colors.blueGrey.shade200,
              //     ),
              //     width: 50,
              //     height: 50,
              //     child: Icon(Icons.grid_view),
              //   ),
            ),
          )
        ],
      ),
    );
  }
}
