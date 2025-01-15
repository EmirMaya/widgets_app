import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Lorem ipsum dolor sit amet, consectetur adip occum in rep elementum in vol elementum',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Lorem ipsum dolor sit amet, consectetur adip occum in rep elementum in vol elementum',
      'assets/images/3.png'),
];

class AppTutotialSreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutotialSreen({super.key});

  @override
  State<AppTutotialSreen> createState() => _AppTutotialSreenState();
}

class _AppTutotialSreenState extends State<AppTutotialSreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if ( !endReached && page >= (slides.length -1)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }
// siempre colocar dispose por buena practica para ahorrar memoria limpiando listeners
  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slidesData) => _Slide(
                      title: slidesData.title,
                      caption: slidesData.caption,
                      imageUrl: slidesData.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
