import 'package:flutter/material.dart';
import '../widgets/carousel_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(viewportFraction: 0.55);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(4),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            children: [
              Text(
                "Made by Hensell",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(12),
                color: Colors.amber,
                height: 400,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final offset = _currentPage - index;
                    return CarouselCard(index: index, offset: offset);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
