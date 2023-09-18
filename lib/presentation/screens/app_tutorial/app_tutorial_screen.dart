import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

final slide = <SlideInfo>[
  SlideInfo(
      "Busca la comida",
      "Reprehenderit do aute deserunt ipsum consequat mollit est incididunt sint deserunt tempor nostrud aliquip. Est aliquip labore anim sit eiusmod Lorem cupidatat ad amet officia. Non esse qui veniam id aliqua deserunt do magna minim elit ipsum ea aliquip. In aliqua quis duis id sunt ex occaecat minim ad aliquip. Ut proident ad aliqua cillum exercitation sunt amet ad eu aliquip quis.",
      "assets/images/1.png"),
  SlideInfo(
      "Entrega rapida",
      "Voluptate aliqua nisi nostrud ullamco ex voluptate magna minim eu. Id ipsum irure id sint tempor eiusmod magna velit elit cupidatat ea excepteur consequat sint. Commodo nostrud duis velit deserunt fugiat officia eiusmod occaecat aliqua anim consectetur aliquip. Incididunt ut quis dolor ullamco officia. Mollit culpa dolor labore sunt ullamco magna ea labore dolor quis irure. Dolore ullamco aliquip et adipisicing tempor irure eu elit aliqua laboris eiusmod nisi velit.",
      "assets/images/2.png"),
  SlideInfo(
      "Disfruta la comida",
      "Culpa ex eu nostrud cupidatat aliquip. Adipisicing deserunt in quis veniam in et enim sunt occaecat esse. Velit nisi commodo Lorem id est elit occaecat anim duis.",
      "assets/images/3.png")
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const pathName = 'app_tutorial';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endPage = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endPage && page >= (slide.length - 1.5)) {
        setState(() {
          endPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slide
                .map((slide) => _Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text("Salir"),
                onPressed: () => context.pop(),
              )),
          endPage
              ? Positioned(
                  bottom: 40,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      child: const Text("Empezar"),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox()
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
    final themeTitle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: themeTitle.titleLarge),
            const SizedBox(height: 10),
            Text(
              caption,
              style: themeTitle.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
