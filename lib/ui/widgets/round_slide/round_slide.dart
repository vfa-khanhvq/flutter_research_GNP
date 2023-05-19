import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:flutter_research_gnp/theme/dimension.dart';
import 'package:flutter_research_gnp/ui/widgets/button/custom_elevated_button/custom_elevated_button.dart';
import 'package:flutter_research_gnp/ui/widgets/number_pad/number_pad.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RoundSlide extends StatefulWidget {
  const RoundSlide({required this.list, super.key});
  final List<String> list;
  @override
  State<RoundSlide> createState() => _RoundSlideState();
}

class _RoundSlideState extends State<RoundSlide> {
  int activeIndex = 0;

  /// Controller
  final controller = AutoScrollController();
  final carouselController = CarouselController();

  void _animateToIndex(int index) {
    controller.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: const Duration(seconds: 1),
    );
  }

  void _animateFromToIndex(int index) {
    carouselController.animateToPage(index);
  }

  void _onPressedSlideItem(int index) {
    _animateToIndex(index);
    _animateFromToIndex(index);
    setState(() {
      activeIndex = index;
    });
  }

  void _onChangedFormIndex(int index) {
    _animateToIndex(index);
    setState(() {
      activeIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateToIndex(activeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildRoundSlide() {
      Widget buildRoundSliceItem({
        required int index,
        required String content,
        required bool isSelected,
      }) {
        return GestureDetector(
          onTap: () {
            _onPressedSlideItem(index);
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: isSelected ? CustomColor.darkGreen : CustomColor.green,
              border: Border.all(
                color: isSelected ? CustomColor.darkGreen : Colors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${content}H',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'PAR.3',
                  style: TextStyle(
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

      return SizedBox(
        height: 60,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.list[index];
            return AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              highlightColor: Colors.black.withOpacity(0.1),
              child: Row(
                children: [
                  SizedBox(
                    width: index == 0 ? Dimension.sideMargin : 0.0,
                  ),
                  buildRoundSliceItem(
                    content: item,
                    index: index,
                    isSelected: activeIndex == index,
                  ),
                  SizedBox(
                    width: index == (widget.list.length - 1)
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
          width: 100,
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
            style: textStyle.copyWith(fontSize: 25),
          ),
        );
      }

      return Container(
        child: Row(
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: const Column(
                children: [
                  Icon(
                    Icons.note_add_outlined,
                    size: 70,
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
        ),
      );
    }

    Widget buildForm() {
      int? firstScore;
      int? secondScore;
      return CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin:
                const EdgeInsets.symmetric(horizontal: Dimension.sideMargin),
            // decoration: const BoxDecoration(color: Colors.white),
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
                            firstScore: firstScore,
                            secondScore: secondScore,
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
                    if (firstScore == null) {
                      setState(() {
                        firstScore = value;
                        debugPrint('nhảy vô');
                      });
                    } else if (secondScore == null) {
                      setState(() {
                        secondScore = value;
                      });
                    }
                  },
                )
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 520,
          onPageChanged: (index, reason) {
            if (reason == CarouselPageChangedReason.manual) {
              _onChangedFormIndex(index);
            }
          },
          enableInfiniteScroll: false,
          viewportFraction: 1,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildRoundSlide(),
        const SizedBox(
          height: Dimension.mediumSpace,
        ),
        buildForm()
      ],
    );
  }
}
