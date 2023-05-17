import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';

@RoutePage()
class InputScorePage extends StatelessWidget {
  const InputScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.green,
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('ahihi'),
        ),
      ),
    );
  }
}
