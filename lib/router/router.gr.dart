// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddOperationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddOperationScreen(),
      );
    },
    EditOperationRoute.name: (routeData) {
      final args = routeData.argsAs<EditOperationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditOperationScreen(
          key: args.key,
          operation: args.operation,
        ),
      );
    },
    FinanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinanceScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    QuizInfoRoute.name: (routeData) {
      final args = routeData.argsAs<QuizInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizInfoScreen(
          key: args.key,
          quiz: args.quiz,
        ),
      );
    },
    QuizListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizListScreen(),
      );
    },
    SettingsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsListScreen(),
      );
    },
  };
}

/// generated route for
/// [AddOperationScreen]
class AddOperationRoute extends PageRouteInfo<void> {
  const AddOperationRoute({List<PageRouteInfo>? children})
      : super(
          AddOperationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddOperationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditOperationScreen]
class EditOperationRoute extends PageRouteInfo<EditOperationRouteArgs> {
  EditOperationRoute({
    Key? key,
    required FinanceModel operation,
    List<PageRouteInfo>? children,
  }) : super(
          EditOperationRoute.name,
          args: EditOperationRouteArgs(
            key: key,
            operation: operation,
          ),
          initialChildren: children,
        );

  static const String name = 'EditOperationRoute';

  static const PageInfo<EditOperationRouteArgs> page =
      PageInfo<EditOperationRouteArgs>(name);
}

class EditOperationRouteArgs {
  const EditOperationRouteArgs({
    this.key,
    required this.operation,
  });

  final Key? key;

  final FinanceModel operation;

  @override
  String toString() {
    return 'EditOperationRouteArgs{key: $key, operation: $operation}';
  }
}

/// generated route for
/// [FinanceScreen]
class FinanceRoute extends PageRouteInfo<void> {
  const FinanceRoute({List<PageRouteInfo>? children})
      : super(
          FinanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizInfoScreen]
class QuizInfoRoute extends PageRouteInfo<QuizInfoRouteArgs> {
  QuizInfoRoute({
    Key? key,
    required QuizModel quiz,
    List<PageRouteInfo>? children,
  }) : super(
          QuizInfoRoute.name,
          args: QuizInfoRouteArgs(
            key: key,
            quiz: quiz,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizInfoRoute';

  static const PageInfo<QuizInfoRouteArgs> page =
      PageInfo<QuizInfoRouteArgs>(name);
}

class QuizInfoRouteArgs {
  const QuizInfoRouteArgs({
    this.key,
    required this.quiz,
  });

  final Key? key;

  final QuizModel quiz;

  @override
  String toString() {
    return 'QuizInfoRouteArgs{key: $key, quiz: $quiz}';
  }
}

/// generated route for
/// [QuizListScreen]
class QuizListRoute extends PageRouteInfo<void> {
  const QuizListRoute({List<PageRouteInfo>? children})
      : super(
          QuizListRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsListScreen]
class SettingsListRoute extends PageRouteInfo<void> {
  const SettingsListRoute({List<PageRouteInfo>? children})
      : super(
          SettingsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
