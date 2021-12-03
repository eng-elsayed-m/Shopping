import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SliderBanner extends StatefulWidget {
  SliderBanner({Key? key}) : super(key: key);

  @override
  _SliderBannerState createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      indicatorBackgroundColor: Colors.grey,
      // onPageChanged: (value) {},
      autoPlayInterval: 3000,
      children: [
        Image.asset(
          'assets/images/sample_image_1.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/sample_image_2.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/sample_image_3.jpg',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
