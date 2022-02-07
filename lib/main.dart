import 'package:conflow/bloc/coin_bloc/coin_bloc.dart';
import 'package:conflow/services/coin_service.dart';
import 'package:conflow/views/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinBloc>(
      create: (_) => CoinBloc(coinRepository: CoinService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.yellow,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0.0,
              foregroundColor: Colors.black,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              toolbarHeight: kToolbarHeight + 30,
            ),
            listTileTheme: ListTileThemeData(
              tileColor: Colors.grey.shade200,
            )),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const HomeView(),
      ),
    );
  }
}
