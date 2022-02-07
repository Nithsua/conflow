import 'package:crypto_please_conv/bloc/coin_bloc/coin_bloc.dart';
import 'package:crypto_please_conv/services/coin_service.dart';

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

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<CoinBloc>().add(CoinFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conflow'),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinData) {
            return RefreshIndicator(
              onRefresh: () async => context.read<CoinBloc>().add(CoinFetch()),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: state.coins.length,
                  itemBuilder: ((context, index) {
                    final coin = state.coins[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ConvertView(
                                      coinId: coin.id,
                                    ))),
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.grey, width: 0.0),
                          borderRadius: BorderRadius.vertical(
                              top: index == 0
                                  ? const Radius.circular(10.0)
                                  : Radius.zero,
                              bottom: index == state.coins.length - 1
                                  ? const Radius.circular(10.0)
                                  : Radius.zero),
                        ),
                        title: Text(coin.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('\$${coin.price.toStringAsFixed(2)}'),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    );
                  })),
            );
          } else if (state is CoinError) {
            return const InternetIssueWidget();
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class InternetIssueWidget extends StatelessWidget {
  const InternetIssueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No Internet retry'),
          TextButton(
            onPressed: () => context.read<CoinBloc>().add(CoinFetch()),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class ConvertView extends StatefulWidget {
  final String coinId;

  const ConvertView({Key? key, required this.coinId}) : super(key: key);

  @override
  State<ConvertView> createState() => _ConvertViewState();
}

class _ConvertViewState extends State<ConvertView> {
  final TextEditingController _coinEditingController = TextEditingController();
  late final TextEditingController _usdEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    final coin =
        (context.read<CoinBloc>().state as CoinData).getCoinById(widget.coinId);
    _coinEditingController.text = '1';
    _usdEditingController.text = '${coin?.price}';
  }

  void calculateExchangeRate(String value, int textFieldId) {
    final exchangePrice = (context.read<CoinBloc>().state as CoinData)
            .getCoinById(widget.coinId)
            ?.price ??
        0;
    if (textFieldId == 0) {
      _usdEditingController.text =
          ((double.tryParse(value) ?? 0) * exchangePrice).toStringAsFixed(2);
    } else {
      _coinEditingController.text = (exchangePrice != 0
              ? ((double.tryParse(value) ?? 0) / exchangePrice)
              : 0)
          .toStringAsFixed(2);
    }
  }

  final _textFieldTheme = InputDecoration(
    filled: true,
    fillColor: Colors.grey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Convertio',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => calculateExchangeRate(value, 0),
              controller: _coinEditingController,
              decoration: _textFieldTheme,
            ),
            const SizedBox(height: 30),
            TextField(
              onChanged: (value) => calculateExchangeRate(value, 1),
              controller: _usdEditingController,
              decoration: _textFieldTheme,
            ),
          ],
        ),
      ),
    );
  }
}
