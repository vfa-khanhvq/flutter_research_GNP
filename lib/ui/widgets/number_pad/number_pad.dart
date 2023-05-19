import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/ui/widgets/button/custom_elevated_button/custom_elevated_button.dart';
import 'package:flutter_research_gnp/ui/widgets/button/custom_text_button/custom_text_button.dart';

class NumberPad extends StatefulWidget {
  const NumberPad({required this.onPressed, super.key});

  final void Function(int) onPressed;

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  @override
  Widget build(BuildContext context) {
    const buttonPadding = EdgeInsets.all(5);
    const buttonHeight = 60.0;
    const textSize = 35.0;

    final textStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: textSize,
      fontWeight: FontWeight.bold,
    );

    Widget buildNumberButton(int value) {
      return CustomTextButton(
        textSize: textSize,
        height: buttonHeight,
        onPressed: () {
          widget.onPressed(value);
        },
        content: '$value',
      );
    }

    Widget buildMemoButton() {
      return CustomElevatedButton(
        height: buttonHeight,
        onPressed: () {
          // widget.onPressed('Memo');
        },
        backgroundColor: Colors.white,
        borderColor: Colors.blue,
        elevation: 1,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.note_alt_outlined,
              size: 35,
            ),
            Text(
              'Memo',
              style: textStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );
    }

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(7),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(8),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(9),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(5),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(6),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(1),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(2),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(3),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: CustomElevatedButton(
                    height: buttonHeight,
                    onPressed: () {
                      widget.onPressed(10);
                    },
                    backgroundColor: Colors.white,
                    borderColor: Theme.of(context).primaryColor,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: textSize,
                          fontWeight: FontWeight.bold,
                        ),
                        children: const [
                          TextSpan(text: '10'),
                          TextSpan(
                            text: '/0',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildNumberButton(0),
                ),
              ),
              /** Memo Button */
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: buildMemoButton(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
