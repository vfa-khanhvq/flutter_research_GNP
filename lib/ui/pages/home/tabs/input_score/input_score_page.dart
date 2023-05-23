import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research_gnp/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_research_gnp/models/score.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:flutter_research_gnp/theme/dimension.dart';
import 'package:flutter_research_gnp/ui/widgets/form/input_score_form.dart';
import 'package:flutter_research_gnp/ui/widgets/round_slide_item/round_slide_item.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

@RoutePage()
class InputScorePage extends StatefulWidget {
  const InputScorePage({super.key});
  @override
  State<InputScorePage> createState() => _InputScorePageState();
}

class _InputScorePageState extends State<InputScorePage> {
  /// State
  int activeIndex = 0;

  final scoreList = [
    Score(),
    Score(),
    Score(),
    Score(),
    Score(),
    Score(),
    Score(),
    Score(),
  ];

  /// Controllers
  final autoScrollController = AutoScrollController();
  final carouselController = CarouselController();

  final animationDuration = const Duration(milliseconds: 500);

  final textStyle = TextStyle(
    color: CustomColor.green,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomColor.green,
          body: SafeArea(
            child: Column(
              children: [
                AnimatedContainer(
                  height: state.isHidingBottomBar
                      ? 0
                      : 60 + 55 + Dimension.sideMargin + Dimension.sideMargin,
                  duration: animationDuration,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: animationDuration,
                        top: state.isHidingBottomBar
                            ? -60 -
                                55 -
                                Dimension.sideMargin -
                                Dimension.sideMargin
                            : 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: Dimension.sideMargin,
                                ),
                                child: buildUnknownWidget(),
                              ),
                            ),
                            const SizedBox(
                              height: Dimension.mediumSpace,
                            ),
                            buildRoundSlide(),
                            const SizedBox(
                              height: Dimension.mediumSpace,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buildFormSlide(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  void animateRoundSlideToIndex(int index) {
    autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: animationDuration,
    );
  }

  void animateFormSlideToIndex(int index) {
    carouselController.animateToPage(
      index,
      duration: animationDuration,
    );
  }

  void onActiveIndexChanged(int index, BuildContext context) {
    setState(() {
      activeIndex = index;
    });

    if (activeIndex == scoreList.length) {
      setState(() {
        context
            .read<HomePageBloc>()
            .add(const IsHidingBottomBarOnChange(isHiding: true));
      });
    } else {
      context
          .read<HomePageBloc>()
          .add(const IsHidingBottomBarOnChange(isHiding: false));
    }
  }

  void onSelectRoundItem(int index, BuildContext context) {
    animateRoundSlideToIndex(index);
    animateFormSlideToIndex(index);
    onActiveIndexChanged(index, context);
  }

  void onScrollFormItem(int index, BuildContext context) {
    animateRoundSlideToIndex(index);
    onActiveIndexChanged(index, context);
  }

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
              '${activeIndex + 1}H',
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

  Widget buildRoundSlide() {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        controller: autoScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: scoreList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return AutoScrollTag(
            key: ValueKey(index),
            controller: autoScrollController,
            index: index,
            highlightColor: Colors.black.withOpacity(0.1),
            child: Row(
              children: [
                SizedBox(
                  width: index == 0 ? Dimension.sideMargin : 0.0,
                ),
                RoundSlideItem(
                  mainContent:
                      scoreList.length == index ? 'Finish' : '${index + 1}H',
                  subContent: scoreList.length == index ? 'Round' : 'PAR.H3',
                  isSelected: activeIndex == index,
                  onPressedSlideItem: () => onSelectRoundItem(index, context),
                ),
                SizedBox(
                  width: index == (scoreList.length - 1)
                      ? Dimension.sideMargin
                      : 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildFormSlide(BuildContext context, HomePageState state) {
    final textStyle = TextStyle(
      color: Theme.of(context).primaryColor,
    );
    Widget buildFinishForm() {
      const smallHoleHeight = 5.0;
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimension.sideMargin,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cheer for finish round',
                  style: textStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.car_crash_outlined,
                  size: 75,
                  color: Colors.white,
                )
              ],
            ),

            /// Little white line
            Container(
              height: 4,
              color: Colors.white,
            ),
            const SizedBox(
              height: Dimension.mediumSpace,
            ),
            Container(
              height: 75,
              color: CustomColor.green,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 75,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(999),
                                    ),
                                    color: Colors.orange,
                                  ),
                                  child: const Align(
                                    child: Text(
                                      'Me',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Me',
                                      style: textStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      'Total: 9 (+3) - P4',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Align(
                                    child: RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(text: '9'),
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Text(
                                              '4',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: smallHoleHeight,
                        height: smallHoleHeight,
                        color: CustomColor.green,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: smallHoleHeight,
                        height: smallHoleHeight,
                        color: CustomColor.green,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: smallHoleHeight,
                        height: smallHoleHeight,
                        color: CustomColor.green,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: smallHoleHeight,
                        height: smallHoleHeight,
                        color: CustomColor.green,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return AnimatedContainer(
      duration: animationDuration,
      height: state.isHidingBottomBar
          ? MediaQuery.of(context).size.height - 60
          : MediaQuery.of(context).size.height -
              60 -
              60 -
              (Dimension.sideMargin * 4) -
              Dimension.bottomNavHeight,
      child: CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: scoreList.length + 1,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return scoreList.length == itemIndex
              ? buildFinishForm()
              : InputScoreForm(
                  item: scoreList[itemIndex],
                );
        },
        options: CarouselOptions(
          height: state.isHidingBottomBar
              ? MediaQuery.of(context).size.height - 60
              : MediaQuery.of(context).size.height -
                  60 -
                  60 -
                  (Dimension.sideMargin * 4) -
                  Dimension.bottomNavHeight,
          onPageChanged: (index, reason) {
            if (reason == CarouselPageChangedReason.manual) {
              onScrollFormItem(index, context);
            }
          },
          enableInfiniteScroll: false,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
