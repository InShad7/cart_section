import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sunrule2/view/utils/utils.dart';

final imgUrl = [
  'assets/nike.jpg',
  'assets/nike2.jpg',
  'assets/nike4.jpg',
  'assets/nike3.jpg',
];

int activeIndex = 0;

class CustomCurosel extends StatefulWidget {
  const CustomCurosel({super.key, this.imgs, this.details = false});
  final imgs;
  final details;

  @override
  State<CustomCurosel> createState() => _CustomCuroselState();
}

class _CustomCuroselState extends State<CustomCurosel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        CarouselSlider.builder(
          itemCount: imgUrl.length,
          itemBuilder: (context, index, realIndex) {
            final urlImg = imgUrl[index];
            return buildImage(urlImg, index);
          },
          options: CarouselOptions(
            viewportFraction: widget.details ? 1 : 0.93,
            height: widget.details ? 271 : 220,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        kHeight,
      ],
    );
  }

  Widget buildImage(String imgUrl, int index) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
        ),
      ));
}
