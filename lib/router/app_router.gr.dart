// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NaviPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NaviPage(),
      );
    },
    ScorePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScorePage(),
      );
    },
    MenuPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuPage(),
      );
    },
    InputScorePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InputScorePage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NaviPage]
class NaviPageRoute extends PageRouteInfo<void> {
  const NaviPageRoute({List<PageRouteInfo>? children})
      : super(
          NaviPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NaviPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScorePage]
class ScorePageRoute extends PageRouteInfo<void> {
  const ScorePageRoute({List<PageRouteInfo>? children})
      : super(
          ScorePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScorePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuPage]
class MenuPageRoute extends PageRouteInfo<void> {
  const MenuPageRoute({List<PageRouteInfo>? children})
      : super(
          MenuPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InputScorePage]
class InputScorePageRoute extends PageRouteInfo<void> {
  const InputScorePageRoute({List<PageRouteInfo>? children})
      : super(
          InputScorePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputScorePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
