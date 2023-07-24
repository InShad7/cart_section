import 'package:flutter/material.dart';
import 'package:sunrule2/controller/controller.dart';
import 'widget/app_bar.dart';
import 'widget/custom_carosel.dart';
import 'widget/home_card.dart';
import 'widget/top_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomCurosel(),
            TopHeading(),
            HomeCards(),
          ],
        ),
      ),
    );
  }
}
