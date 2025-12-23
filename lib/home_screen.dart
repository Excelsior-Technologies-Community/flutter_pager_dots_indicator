import 'package:flutter/material.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/dot_shape.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/indicator_type.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/pager_dots_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pager Dots Indicators',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          PagerDotsIndicator(
            itemCount: 5,
            dotSize: 20,
            spacing: 20,
            position: currentPage,
            inactiveColor: Colors.yellow,
            activeColor: Colors.red,
            type: PagerIndicatorType.expanding,
            dotShape: DotShape.triangle,

            /// 🔥 CLICK ACTION
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
          const SizedBox(height: 40),
          PagerDotsIndicator(
            itemCount: 5,
            dotSize: 20,
            spacing: 20,
            position: currentPage,
            activeColor: Colors.blue,
            type: PagerIndicatorType.slide,
            dotShape: DotShape.diamond,

            /// 🔥 CLICK ACTION
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
          const SizedBox(height: 40),
          PagerDotsIndicator(
            itemCount: 5,
            dotSize: 20,
            spacing: 20,
            position: currentPage,
            inactiveColor: Colors.brown,
            activeColor: Colors.green,
            type: PagerIndicatorType.slide,
            dotShape: DotShape.star,

            /// 🔥 CLICK ACTION
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
          const SizedBox(height: 40),
          PagerDotsIndicator(
            itemCount: 5,
            dotSize: 20,
            spacing: 20,
            position: currentPage,
            // inactiveColor: Colors.yellow,
            activeColor: Colors.pink,
            type: PagerIndicatorType.slide,
            dotShape: DotShape.linear,

            /// 🔥 CLICK ACTION
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
          const SizedBox(height: 40),
          PagerDotsIndicator(
            itemCount: 5,
            dotSize: 20,
            spacing: 20,
            position: currentPage,
            // inactiveColor: Colors.yellow,
            activeColor: Colors.orange,
            type: PagerIndicatorType.slide,
            dotShape: DotShape.roundedSquare,

            /// 🔥 CLICK ACTION
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: 5,
              itemBuilder: (_, index) {
                return Center(
                  child: Text('', style: const TextStyle(fontSize: 32)),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
