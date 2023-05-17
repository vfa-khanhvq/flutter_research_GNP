import 'package:auto_route/auto_route.dart';
import 'package:flutter_research_gnp/ui/pages/home/home_page.dart';
import 'package:flutter_research_gnp/ui/pages/home/tabs/input_score_page.dart';
import 'package:flutter_research_gnp/ui/pages/home/tabs/menu_page.dart';
import 'package:flutter_research_gnp/ui/pages/home/tabs/navi_page.dart';
import 'package:flutter_research_gnp/ui/pages/home/tabs/score_page.dart';

part 'app_router.gr.dart';

abstract class RootPath {
  static const home = '/home';
}

abstract class HomeSubPath {
  static const inputScore = 'inputScore';
  static const menu = 'menu';
  static const navi = 'navi';
  static const score = 'score';
}

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomePageRoute.page,
          path: RootPath.home,
          initial: true,
          children: [
            AutoRoute(
              page: InputScorePageRoute.page,
              path: HomeSubPath.inputScore,
            ),
            AutoRoute(page: MenuPageRoute.page, path: HomeSubPath.menu),
            AutoRoute(page: NaviPageRoute.page, path: HomeSubPath.navi),
            AutoRoute(page: ScorePageRoute.page, path: HomeSubPath.score),
          ],
        ),
      ];
}
