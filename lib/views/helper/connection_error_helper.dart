import 'package:conflow/bloc/coin_bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
