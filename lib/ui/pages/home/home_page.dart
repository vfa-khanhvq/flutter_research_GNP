import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research_gnp/router/app_router.dart';
import 'package:flutter_research_gnp/theme/colors.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
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
          bottomNavigationBar: _buildBottomNavigationBar(context, tabsRouter),
        );
      },
    );
  }
}
