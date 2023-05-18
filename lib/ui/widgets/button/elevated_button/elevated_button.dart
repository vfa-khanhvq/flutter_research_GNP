import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 0,
    this.padding,
  });
  final Widget child;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: widget.borderColor ?? Colors.white,
        ),
      ),
      elevation: widget.elevation,
      padding: widget.padding,
    );
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: buttonStyle,
        child: widget.child,
      ),
    );
  }
}
