import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/transaction.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TransactionListViewModel>(
      distinct: true,
      converter: TransactionListViewModel.fromStore,
      builder: (_, viewModel) {
        return RefreshIndicator(
          onRefresh: () async {
            viewModel.refreshFeed();
            await Future.delayed(Duration(milliseconds: 1000));
            return;
          },
          child: ListView.separated(
            itemCount: viewModel.transactions.length,
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Divider(
                thickness: 1,
                height: 0,
              ),
            ),
            itemBuilder: (context, index) {
              return SizedBox(height: 20, child: Container(color: Colors.blue));
              // return TokenTile(
              //   transaction: viewModel.transactions[index],
              // );
            },
          ),
        );
      },
    );
  }
}
