import 'package:crypto_please_conv/bloc/coin_bloc/coin_bloc.dart';
import 'package:crypto_please_conv/views/convert_view.dart';
import 'package:crypto_please_conv/views/helper/connection_error_helper.dart';
import 'package:crypto_please_conv/views/helper/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return state.when(
              loading: () => const LoadingWidget(),
              error: (error) => const InternetIssueWidget(),
              data: (data) {
                return RefreshIndicator(
                  onRefresh: () async =>
                      context.read<CoinBloc>().add(CoinFetch()),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          final coin = data[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ConvertView(
                                            coinId: coin.id,
                                          ))),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                                borderRadius: BorderRadius.vertical(
                                    top: index == 0
                                        ? const Radius.circular(10.0)
                                        : Radius.zero,
                                    bottom: index == data.length - 1
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
                  ),
                );
              });
        },
      ),
    );
  }
}
