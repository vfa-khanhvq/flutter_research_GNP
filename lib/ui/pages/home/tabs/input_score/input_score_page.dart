import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:flutter_research_gnp/theme/dimension.dart';
import 'package:flutter_research_gnp/ui/widgets/round_slide/round_slide.dart';

@RoutePage()
class InputScorePage extends StatelessWidget {
  const InputScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    Widget buildUnknownWidget() {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 250,
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '2H',
                style: textStyle,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'PAR.3',
                style: textStyle,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                '2Yards',
                style: textStyle,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: CustomColor.green,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: Dimension.sideMargin),
                child: buildUnknownWidget(),
              ),
            ),
            const SizedBox(
              height: Dimension.mediumSpace,
            ),
            const RoundSlide(
              list: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
            )
          ],
        ),
      ),
    );
  }
}
