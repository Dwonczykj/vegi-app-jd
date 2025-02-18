import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/models/actions/actions.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/models/tokens/price.dart';
import 'package:vegan_liverpool/models/tokens/stats.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/format.dart';
import 'package:wallet_core/wallet_core.dart' show EtherAmount, Web3;

part 'item.freezed.dart';
part 'item.g.dart';

//TODO: This is the token.dart model, create the model for an item

@immutable
@freezed
class Item with _$Item implements Comparable<Item> {
  const Item._();

  @override
  int compareTo(Item? other) {
    if (other == null) return 1;
    return num.parse(getFiatBalance(true))
        .compareTo(num.parse(other.getFiatBalance(true)));
  }

  @JsonSerializable()
  factory Item({
    required String address,
    required String name,
    required String symbol,
    required BigInt amount,
    required int decimals,
    @Default(false) bool isNative,
    String? imageUrl,
    @JsonKey(ignore: true) String? subtitle,
    int? timestamp,
    Price? priceInfo,
    String? communityAddress,
    String? originNetwork,
    @Default(0) num priceChange,
    @JsonKey(ignore: true) @Default(0) num priceDiff,
    @JsonKey(ignore: true) @Default(0) int priceDiffLimitInDays,
    @JsonKey(ignore: true) @Default([]) List<Stats> stats,
    @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions,
  }) = _Item;

  String getBalance([withPrecision = false]) => Formatter.formatValue(
        amount,
        decimals,
        withPrecision,
      );

  String getFiatBalance([bool withPrecision = false]) {
    if (num.parse(priceInfo?.quote ?? '0').compareTo(0) <= 1) {
      return Formatter.formatValueToFiat(
        amount,
        decimals,
        double.tryParse(quote) ?? 0.0,
        withPrecision,
      );
    }
    return '0';
  }

  bool get hasPriceInfo =>
      ![null, '', '0', 0, 'NaN'].contains(priceInfo?.quote);

  String get quote => priceInfo?.quoteHuman ?? '0';

  Future<dynamic> fetchBalance(
    String accountAddress, {
    required Function(BigInt) onDone,
    required Function onError,
  }) async {
    if ([null, ''].contains(accountAddress) || [null, ''].contains(address))
      return;
    if (isNative) {
      try {
        EtherAmount balance =
            await getIt<Web3>(instanceName: 'fuseWeb3').getBalance(
          address: accountAddress,
        );
        if (amount.compareTo(balance.getInWei) != 0) {
          onDone(balance.getInWei);
        }
      } catch (e, s) {
        onError(e, s);
      }
    } else {
      try {
        final BigInt balance =
            await getIt<Web3>(instanceName: 'fuseWeb3').getTokenBalance(
          address,
          address: accountAddress,
        );
        if (amount.compareTo(balance) != 0) {
          onDone(balance);
        }
      } catch (e, s) {
        onError(e, s);
      }
    }
  }

  Future<dynamic> fetchLatestPrice({
    String currency = 'usd',
    required void Function(Price) onDone,
    required Function onError,
  }) async {
    try {
      Price price = await fuseSwapService.price(address);
      onDone(price);
    } catch (e, s) {
      onError(e, s);
    }
  }

  Future<dynamic> fetchPriceChange({
    required void Function(num) onDone,
    required Function onError,
  }) async {
    try {
      final num priceChange = await fuseSwapService.priceChange(address);
      onDone(priceChange);
    } catch (e, s) {
      onError(e, s);
    }
  }

  Future<dynamic> fetchStats({
    required void Function(List<Stats>) onDone,
    required Function onError,
    String limit = '30',
  }) async {
    try {
      final List<Stats> stats = await fuseSwapService.stats(
        address,
        limit: limit,
      );
      onDone(stats);
    } catch (e, s) {
      onError(e, s);
    }
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
