import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:flutter_research_gnp/ui/widgets/number_pad/number_pad.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildUnknownWidget(), const NumberPad()],
      ),
    );
  }
}
