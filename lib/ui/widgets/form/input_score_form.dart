import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/models/score.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:flutter_research_gnp/theme/dimension.dart';
import 'package:flutter_research_gnp/ui/widgets/button/custom_elevated_button/custom_elevated_button.dart';
import 'package:flutter_research_gnp/ui/widgets/number_pad/number_pad.dart';

class InputScoreForm extends StatefulWidget {
  const InputScoreForm({required this.item, super.key});
  final Score item;

  @override
  State<InputScoreForm> createState() => _InputScoreFormState();
}

class _InputScoreFormState extends State<InputScoreForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: Dimension.sideMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(Dimension.smallSpace),
                    child: buildResult(
                      firstScore: widget.item.firstScore,
                      secondScore: widget.item.secondScore,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimension.mediumSpace,
          ),
          NumberPad(
            onPressed: (value) {
              if (widget.item.firstScore == null) {
                setState(() {
                  widget.item.firstScore = value;
                });
              } else if (widget.item.secondScore == null) {
                setState(() {
                  widget.item.secondScore = value;
                });
              }
            },
          )
        ],
      ),
    );
  }

  Widget buildResult({required int? firstScore, required int? secondScore}) {
    final firstScoreString = firstScore != null ? firstScore.toString() : '-';
    final secondScoreString =
        secondScore != null ? secondScore.toString() : '-';
    final textStyle = TextStyle(
      color: Colors.yellow[400],
      fontSize: 50,
      fontWeight: FontWeight.bold,
    );

    const scoreContainerStyle = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );

    Widget buildFirstScore() {
      return Container(
        height: 70,
        width: 85,
        decoration: scoreContainerStyle.copyWith(
          color: CustomColor.darkGreen,
        ),
        alignment: Alignment.center,
        child: Text(firstScoreString, style: textStyle),
      );
    }

    Widget buildSecondScore() {
      return Container(
        height: 60,
        width: 75,
        decoration: scoreContainerStyle.copyWith(
          color: CustomColor.green,
        ),
        alignment: Alignment.center,
        child: Text(
          secondScoreString,
          style: textStyle.copyWith(fontSize: 30),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildFirstScore(),
            const SizedBox(
              width: Dimension.smallSpace,
            ),
            buildSecondScore()
          ],
        ),
        CustomElevatedButton(
          onPressed: () {},
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: const Column(
            children: [
              Icon(
                Icons.note_add_outlined,
                size: 60,
                color: Colors.white,
              ),
              Text(
                'Detail Input',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
