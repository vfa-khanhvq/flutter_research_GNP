import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research_gnp/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_research_gnp/router/app_router.dart';
import 'package:flutter_research_gnp/theme/colors.dart';
import 'package:flutter_research_gnp/theme/dimension.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state.isHidingBottomBar == true) {
            debugPrint('là true đó');
          }
          if (state.isHidingBottomBar == false) {
            debugPrint('là false đó');
          }
        },
        builder: (context, state) {
          return AutoTabsRouter(
            routes: const [
              InputScorePageRoute(),
              NaviPageRoute(),
              ScorePageRoute(),
              MenuPageRoute(),
            ],
            builder: (context, child) {
              final tabsRouter = AutoTabsRouter.of(context);
              return Scaffold(
                body: child,
                bottomNavigationBar: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height:
                      state.isHidingBottomBar ? 0 : Dimension.bottomNavHeight,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        bottom: state.isHidingBottomBar
                            ? -Dimension.bottomNavHeight
                            : 0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Dimension.bottomNavHeight,
                              width: MediaQuery.of(context).size.width,
                              child: _buildBottomNavigationBar(
                                context,
                                tabsRouter,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(
    BuildContext context,
    TabsRouter tabsRouter,
  ) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Input Score',
          icon: Icon(Icons.note),
        ),
        BottomNavigationBarItem(
          label: 'Navi',
          icon: Icon(Icons.golf_course),
        ),
        BottomNavigationBarItem(
          label: 'Score Card',
          icon: Icon(Icons.scoreboard),
        ),
        BottomNavigationBarItem(
          label: 'Menu',
          icon: Icon(Icons.menu),
        ),
      ],
      backgroundColor: CustomColor.darkGreen,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white24,
      type: BottomNavigationBarType.fixed,
    );
  }
}
