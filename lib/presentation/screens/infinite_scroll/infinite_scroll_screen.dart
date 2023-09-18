import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const pathName = 'infinite_scroll';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    isMounted = false;
    scrollController.dispose();
  }

  void addPageImages() {
    final lastIdImages = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastIdImages + 1));
  }

  void animateBottomScroll() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 130,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  Future loadNextPage() async {
    if (isLoading) return true;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addPageImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    animateBottomScroll();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addPageImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_outlined))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
