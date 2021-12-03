import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String? name;
  const BrandCard({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(name!),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.transparent],
            begin: Alignment.topLeft,
            end: Alignment.center,
            stops: [0.4, 0.5]),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
