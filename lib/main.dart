import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research_gnp/helpers/i18n/cubit/locale_cubit.dart';
import 'package:flutter_research_gnp/router/app_router.dart';
import 'package:flutter_research_gnp/theme/app_theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
            theme: AppTheme.light,
            // darkTheme: AppTheme.dark,
          );
        },
      ),
    );
  }
}
