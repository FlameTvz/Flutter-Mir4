// ============================================================================
// FUNÇÃO DE NAVEGAÇÃO CORRIGIDA PARA SEU PROJETO MIR4
// ============================================================================

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? ESPsWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? ESPsWidget() : LoginWidget(),
        ),
        FFRoute(
          name: Rele1Widget.routeName,
          path: Rele1Widget.routePath,
          builder: (context, params) => Rele1Widget(
            lista2: params.getParam(
              'lista2',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ESPsWidget.routeName,
          path: ESPsWidget.routePath,
          builder: (context, params) => ESPsWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: Rele2Widget.routeName,
          path: Rele2Widget.routePath,
          builder: (context, params) => Rele2Widget(
            lista2: params.getParam(
              'lista2',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: Rele3Widget.routeName,
          path: Rele3Widget.routePath,
          builder: (context, params) => Rele3Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: Rele4Widget.routeName,
          path: Rele4Widget.routePath,
          builder: (context, params) => Rele4Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: Rele5Widget.routeName,
          path: Rele5Widget.routePath,
          builder: (context, params) => Rele5Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ProgHorariosWidget.routeName,
          path: ProgHorariosWidget.routePath,
          builder: (context, params) => ProgHorariosWidget(),
        ),
        FFRoute(
          name: ConfigEntradaWidget.routeName,
          path: ConfigEntradaWidget.routePath,
          builder: (context, params) => ConfigEntradaWidget(
            listaentrada: params.getParam(
              'listaentrada',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ControlesWidget.routeName,
          path: ControlesWidget.routePath,
          builder: (context, params) => ControlesWidget(
            idesp: params.getParam(
              'idesp',
              ParamType.String,
            )!, // Pega o 'idesp' da URL
            nomeEsp: params.getParam(
              'nomeEsp',
              ParamType.String,
            )!, // Pega o 'nomeEsp' da URL
          ),
        ),
        FFRoute(
          name: SaidasWidget.routeName,
          path: SaidasWidget.routePath,
          builder: (context, params) => SaidasWidget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigSaida1Widget.routeName,
          path: ConfigSaida1Widget.routePath,
          builder: (context, params) => ConfigSaida1Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigControlesWidget.routeName,
          path: ConfigControlesWidget.routePath,
          builder: (context, params) => ConfigControlesWidget(),
        ),
        FFRoute(
          name: ConfigEspWidget.routeName,
          path: ConfigEspWidget.routePath,
          builder: (context, params) => ConfigEspWidget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigProgWidget.routeName,
          path: ConfigProgWidget.routePath,
          builder: (context, params) => ConfigProgWidget(),
        ),
        FFRoute(
          name: ConfigSaida2Widget.routeName,
          path: ConfigSaida2Widget.routePath,
          builder: (context, params) => ConfigSaida2Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigSaida3Widget.routeName,
          path: ConfigSaida3Widget.routePath,
          builder: (context, params) => ConfigSaida3Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigSaida4Widget.routeName,
          path: ConfigSaida4Widget.routePath,
          builder: (context, params) => ConfigSaida4Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigSaida5Widget.routeName,
          path: ConfigSaida5Widget.routePath,
          builder: (context, params) => ConfigSaida5Widget(
            lista: params.getParam(
              'lista',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: Eventos2Widget.routeName,
          path: Eventos2Widget.routePath,
          builder: (context, params) => Eventos2Widget(),
        ),
        FFRoute(
          name: NotificacoesWidget.routeName,
          path: NotificacoesWidget.routePath,
          builder: (context, params) => NotificacoesWidget(
            listaentrada: params.getParam(
              'listaentrada',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: Auth13Widget.routeName,
          path: Auth13Widget.routePath,
          builder: (context, params) => Auth13Widget(),
        ),
        FFRoute(
          name: Config433Widget.routeName,
          path: Config433Widget.routePath,
          builder: (context, params) => Config433Widget(
            listaentrada: params.getParam(
              'listaentrada',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ConfigAlarmeWidget.routeName,
          path: ConfigAlarmeWidget.routePath,
          builder: (context, params) => ConfigAlarmeWidget(
            listaentrada: params.getParam(
              'listaentrada',
              ParamType.JSON,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

// ============================================================================
// 🔧 EXTENSÃO DE NAVEGAÇÃO CORRIGIDA (AQUI ESTÁ O FIX!)
// ============================================================================

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  // ============================================================================
  // 🎯 FUNÇÃO PRINCIPAL CORRIGIDA - safePop()
  // ============================================================================

  void safePop() {
    // ✅ SEMPRE volta para a página anterior se possível
    if (canPop()) {
      pop();
    }
    // ✅ Se não pode voltar, não faz nada (mantém na página atual)
    // Isso evita redirecionamentos indesejados para páginas padrão
  }

  // ============================================================================
  // 🆕 NOVAS FUNÇÕES DE NAVEGAÇÃO SEGURAS
  // ============================================================================

  /// Navega mantendo o histórico (use na maioria dos casos)
  void pushNamedSafe(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
  }) {
    pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Substitui a rota atual (use apenas para login → home)
  void goNamedSafe(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
  }) {
    goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Volta para a página anterior (comportamento correto do botão voltar)
  void safeGoBack() {
    // ✅ Só volta se realmente puder voltar
    if (canPop()) {
      pop();
    }
    // Se não pode voltar, não faz nada (evita redirecionamentos)
  }

  /// Função para debug - mostra informações de navegação
  void debugNavigation() {
    final location = GoRouterState.of(this).uri.toString();
    final canPopResult = canPop();
    print('🔍 DEBUG NAVIGATION:');
    print('   Current location: $location');
    print('   Can pop: $canPopResult');
    print('   Logged in: ${GoRouter.of(this).appState.loggedIn}');
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

// ============================================================================
// 📋 INSTRUÇÕES DE USO
// ============================================================================

/*
PRINCIPAIS MUDANÇAS FEITAS:

1. ✅ CORRIGIDO safePop():
   - Agora SÓ volta se realmente puder voltar
   - Se não pode voltar, não faz nada (mantém na página atual)
   - NÃO redireciona mais para páginas padrão

2. ✅ COMPORTAMENTO CORRETO:
   - ConfigEsp → Saidas → Botão Voltar → ConfigEsp ✅
   - Rele1 → Rele2 → Botão Voltar → Rele1 ✅
   - SEMPRE respeita o histórico de navegação

COMO USAR NAS SUAS PÁGINAS:

✅ AGORA (correto):
context.safePop() // Volta APENAS para página anterior no histórico

EXEMPLOS DE USO:

// Para navegar mantendo histórico
context.pushNamedSafe('Saidas');

// Para voltar (só volta se puder)
context.safeGoBack();

// Para debug (temporário)
context.debugNavigation();

TESTE O FLUXO:
ConfigEsp → Saidas → Botão Voltar
Deve ir: Saidas → ConfigEsp ✅

ESPs → Rele1 → Rele2 → Botão Voltar → Botão Voltar
Deve ir: Rele2 → Rele1 → ESPs ✅
*/
