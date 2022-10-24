import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kat_game/common/constant/images.dart';

class DashboardCarouselSlider extends StatefulWidget {
  const DashboardCarouselSlider({super.key});

  @override
  State<DashboardCarouselSlider> createState() =>
      _DashboardCarouselSliderState();
}

class _DashboardCarouselSliderState extends State<DashboardCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Images.bowling,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Images.pool,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Images.tableTennis,
            fit: BoxFit.cover,
          ),
        ),
      ],
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
