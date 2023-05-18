import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RoundSlide extends StatefulWidget {
  const RoundSlide({required this.list, super.key});
  final List<String> list;
  @override
  State<RoundSlide> createState() => _RoundSlideState();
}

class _RoundSlideState extends State<RoundSlide> {
  int selectedPos = 0;
  final controller = AutoScrollController();
  void _animateToIndex(int index) {
    controller.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateToIndex(selectedPos);
    });
  }

  Widget buildItem(int index) {
    return Container(
      color: CustomColor.green,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          Text(
            '${index}H',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '${index}H',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          highlightColor: Colors.black.withOpacity(0.1),
          child: Text('index: $index'),
        );
      },
    );
  }
}
