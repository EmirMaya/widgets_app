import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Lorem ipsum dolor sit amet, consectetur adip occum in rep elementum in vol elementum',
      'assets/image/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Lorem ipsum dolor sit amet, consectetur adip occum in rep elementum in vol elementum',
      'assets/image/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Lorem ipsum dolor sit amet, consectetur adip occum in rep elementum in vol elementum',
      'assets/image/1.png'),
];

class AppTutotialSreen extends StatelessWidget {
  static const name = 'app_tutorial_screen';

  const AppTutotialSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides.map(
          (slidesData) => _Slide(
            title: slidesData.title,
           caption: slidesData.caption, 
           imageUrl: slidesData.imageUrl)
        ).toList()
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            Image( image: AssetImage(imageUrl))
          ],
        ),
      ),
    );
  }
}
