import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/ui/widgets/button/elevated_button/elevated_button.dart';
import 'package:flutter_research_gnp/ui/widgets/button/text_button/text_button.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonPadding = EdgeInsets.all(5);
    const buttonHeight = 60.0;
    const textSize = 30.0;

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
          debugPrint('$value');
        },
        content: '$value',
      );
    }

    Widget buildMemoButton() {
      return CustomElevatedButton(
        height: buttonHeight,
        onPressed: () {
          debugPrint('Memo');
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
                      debugPrint('10/0');
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
                              fontSize: 15,
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
