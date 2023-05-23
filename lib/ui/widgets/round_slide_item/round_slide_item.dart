import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';

class RoundSlideItem extends StatefulWidget {
  const RoundSlideItem({
    required this.mainContent,
    required this.subContent,
    required this.isSelected,
    required this.onPressedSlideItem,
    super.key,
  });

  final String mainContent;
  final String subContent;
  final bool isSelected;
  final VoidCallback onPressedSlideItem;
  @override
  State<RoundSlideItem> createState() => _RoundSlideItemState();
}

class _RoundSlideItemState extends State<RoundSlideItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressedSlideItem,
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: widget.isSelected ? CustomColor.darkGreen : CustomColor.green,
          border: Border.all(
            color: widget.isSelected ? CustomColor.darkGreen : Colors.white,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.mainContent,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              widget.subContent,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
