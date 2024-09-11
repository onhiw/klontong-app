import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:klontong_app/injection.dart' as di;
import 'package:klontong_app/persentation/pages/page_detail_product.dart';
import 'package:klontong_app/persentation/pages/page_home.dart';
import 'package:klontong_app/utils/routes.dart';
import 'package:klontong_app/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Klontong App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const HomePage());
            case detailProductRoute:
              final args = settings.arguments as DetailProductPage;
              return MaterialPageRoute(
                  builder: (_) => DetailProductPage(
                        id: args.id,
                      ));
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
