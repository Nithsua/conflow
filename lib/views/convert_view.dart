import 'package:crypto_please_conv/bloc/coin_bloc/coin_bloc.dart';
import 'package:crypto_please_conv/modal/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Coin? coin;
    (context.read<CoinBloc>().state.mapOrNull(data: (data) {
      for (var i in data.coins) {
        if (i.id == widget.coinId) {
          coin = i;
          break;
        }
      }
    }));
    _coinEditingController.text = '1';
    _usdEditingController.text = '${coin?.price ?? 0}';
  }

  void calculateExchangeRate(String value, int textFieldId) {
    double? exchangePrice;
    (context.read<CoinBloc>().state.mapOrNull(data: (data) {
      for (var i in data.coins) {
        if (i.id == widget.coinId) {
          exchangePrice = i.price;
          break;
        }
      }
    }));
    if (textFieldId == 0) {
      _usdEditingController.text =
          ((double.tryParse(value) ?? 0) * (exchangePrice ?? 0))
              .toStringAsFixed(2);
    } else {
      _coinEditingController.text = (exchangePrice != 0 || exchangePrice == null
              ? ((double.tryParse(value) ?? 0) / exchangePrice!)
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
