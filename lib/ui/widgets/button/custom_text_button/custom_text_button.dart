import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    required this.content,
    required this.onPressed,
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.textSize,
  });
  final String content;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: widget.backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      elevation: 0,
    );
    final textStyle = TextStyle(
      color: widget.textColor ?? Theme.of(context).primaryColor,
      fontSize: widget.textSize ?? 20,
      fontWeight: FontWeight.bold,
    );
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: widget.onPressed,
        style: buttonStyle,
        child: Text(
          widget.content,
          maxLines: 1,
          style: textStyle,
        ),
      ),
    );
  }
}
