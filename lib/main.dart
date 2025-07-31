import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'teste_filtro_esp.dart';

// ============================================================================
// CONFIGURAÇÃO MANUAL DO FIREBASE (CORRIGIDA COM DADOS DO google-services.json)
// ============================================================================

Future<void> inicializarFirebaseManual() async {
  try {
    print('🔄 Inicializando Firebase manualmente...');
    
    // ✅ CONFIGURAÇÃO CORRIGIDA - usando dados do google-services.json
    const FirebaseOptions firebaseConfig = FirebaseOptions(
      apiKey: "AIzaSyAFESLrf5Fsme5e9AQNktrC9I_V2o1PxIM", // ✅ API Key do Android
      appId: "1:272938015430:android:04fa8e016a7e75e9d7d5c7", // ✅ App ID do Android
      messagingSenderId: "272938015430",
      projectId: 'poised-bot-443613-p6',
      databaseURL: 'https://poised-bot-443613-p6-default-rtdb.firebaseio.com',
      storageBucket: 'poised-bot-443613-p6.firebasestorage.app', // ✅ Storage bucket correto
      authDomain: 'poised-bot-443613-p6.firebaseapp.com',
    );
    
    // ✅ VERIFICAR SE JÁ FOI INICIALIZADO (evita duplicação)
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(options: firebaseConfig);
      print('✅ Firebase inicializado manualmente');
    } else {
      print('✅ Firebase já estava inicializado');
    }
    
  } catch (e) {
    print('❌ Erro ao inicializar Firebase: $e');
    rethrow;
  }
}

// ============================================================================
// CONFIGURAÇÃO DO FIREBASE REALTIME DATABASE
// ============================================================================

void configurarRealtimeDatabase() {
  try {
    // URL do seu projeto Firebase Realtime Database
    FirebaseDatabase.instance.databaseURL = 
        "https://poised-bot-443613-p6-default-rtdb.firebaseio.com/";
    
    // Configurar persistence apenas no mobile
    if (!kIsWeb) {
      try {
        FirebaseDatabase.instance.setPersistenceEnabled(true);
        print('✅ Persistence habilitada para Realtime Database');
      } catch (e) {
        print('⚠️ Erro ao habilitar persistence: $e');
      }
    }
    
    print('✅ Firebase Realtime Database configurado');
    print('📍 URL: https://poised-bot-443613-p6-default-rtdb.firebaseio.com/');
    print('📁 Caminho dos eventos: MIR/eventos');
    
  } catch (e) {
    print('❌ Erro ao configurar Realtime Database: $e');
  }
}

// ============================================================================
// FUNÇÃO PARA TESTAR CONEXÃO COM O REALTIME DATABASE
// ============================================================================

Future<void> testarConexaoRealtimeDB() async {
  try {
    print('🔄 Testando conexão com Realtime Database...');
    
    // Verificar se o usuário está autenticado
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('⚠️ Usuário não autenticado');
      print('💡 Faça login na aplicação para acessar os eventos');
      print('📍 Os eventos ficarão em: MIR/eventos');
      return;
    } else {
      print('✅ Usuário autenticado: ${user.uid}');
    }
    
    // Testar acesso aos caminhos do usuário logado
    try {
      // Testar leitura na estrutura de Usuários (usuário próprio)
      final userRef = FirebaseDatabase.instance.ref('Usuarios/${user.uid}');
      final userEvent = await userRef.once();
      print('✅ Realtime Database: Acesso a dados do usuário OK');
      
      // Testar acesso específico aos eventos
      final eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');
      var eventosEvent = await eventosRef.limitToFirst(1).once();
      print('✅ Realtime Database: Acesso aos eventos OK (MIR/eventos)');
      
      // Testar acesso aos ESPs (se existir)
      final espRef = FirebaseDatabase.instance.ref('IdsESP');
      try {
        final espEvent = await espRef.limitToFirst(1).once();
        print('✅ Realtime Database: Acesso a IdsESP OK');
      } catch (e) {
        print('⚠️ Acesso limitado a IdsESP (normal devido às regras)');
      }
      
    } catch (e) {
      if (e.toString().contains('PERMISSION_DENIED')) {
        print('⚠️ ATENÇÃO: Erro de permissão no Realtime Database!');
        print('🔧 Suas regras atuais exigem:');
        print('   - Usuário autenticado para leitura/escrita');
        print('   - Acesso apenas aos próprios dados em Usuarios/{uid}');
        print('');
        print('✅ Solução: Faça login na aplicação');
        print('📍 Caminho dos eventos: MIR/eventos');
      } else {
        print('❌ Erro inesperado: $e');
      }
    }
    
  } catch (e) {
    print('❌ Erro na conexão com Realtime Database: $e');
    print('⚠️ App continuará funcionando');
  }
}

// ============================================================================
// FUNÇÃO PARA ATUALIZAR FCM TOKEN
// ============================================================================

void updateFcmToken() async {
  try {
    // Só executa no mobile
    if (kIsWeb) {
      print('ℹ️ FCM não disponível na web');
      return;
    }
    
    final token = await FirebaseMessaging.instance.getToken();
    final user = FirebaseAuth.instance.currentUser;
    
    if (user != null && token != null) {
      // Salvar no Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'fcmToken': token});
      
      // Também salvar no Realtime Database para backup
      await FirebaseDatabase.instance
          .ref('users/${user.uid}/fcmToken')
          .set(token);
          
      print('✅ FCM Token atualizado');
    }
  } catch (e) {
    print('❌ Erro ao atualizar FCM token: $e');
  }
}

// ============================================================================
// FUNÇÃO MAIN
// ============================================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  
  // Configurar URL strategy apenas se não for web mobile
  try {
    usePathUrlStrategy();
  } catch (e) {
    print('⚠️ URL strategy não disponível: $e');
  }

  try {
    print('🚀 Iniciando aplicação MIR4...');
    
    // ============================================================================
    // 🔧 INICIALIZAR FIREBASE MANUALMENTE (CORRIGIDO)
    // ============================================================================
    
    await inicializarFirebaseManual();
    
    // Configurar Realtime Database
    configurarRealtimeDatabase();
    
    // Testar conexão
    await testarConexaoRealtimeDB();
    
    // Inicializar tema
    await FlutterFlowTheme.initialize();
    print('✅ Tema inicializado');

    // Inicializar estado da aplicação
    final appState = FFAppState();
    await appState.initializePersistedState();
    print('✅ Estado da aplicação inicializado');

    // Executar aplicação
    runApp(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
    
    print('🎉 Aplicação iniciada com sucesso!');
    
  } catch (e) {
    print('❌ Erro crítico na inicialização: $e');
    // App de fallback em caso de erro
    runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Erro na Inicialização'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 64, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  'Erro na inicialização da aplicação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Erro: $e',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    main(); // Tentar reiniciar
                  },
                  child: Text('Tentar Novamente'),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

// ============================================================================
// CLASSE PRINCIPAL DO APP
// ============================================================================

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
          
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    
    print('🔄 Inicializando MyApp...');
    
    // Atualizar FCM token
    updateFcmToken();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    
    userStream = mir4FirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
      
    jwtTokenStream.listen((_) {});
    
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
    
    print('✅ MyApp inicializado');
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MIR4',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}