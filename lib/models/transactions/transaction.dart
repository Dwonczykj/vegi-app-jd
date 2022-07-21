import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/actions/actions.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/models/items/item.dart';
import 'package:vegan_liverpool/models/tokens/price.dart';
import 'package:vegan_liverpool/models/tokens/stats.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:vegan_liverpool/utils/format.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@immutable
@freezed
class PaymentTransaction
    with _$PaymentTransaction
    implements Comparable<PaymentTransaction> {
  const PaymentTransaction._();

  @override
  int compareTo(PaymentTransaction? other) {
    if (other == null) return 1;
    return timestamp.compareTo(other.timestamp);
  }

  @JsonSerializable()
  factory PaymentTransaction({
    required String id,
    @JsonKey(name: 'SenderAddress') required String senderAddress,
    @JsonKey(name: 'ReceiverAddress') required String receiverAddress,
    required String companyId,
    required String companyName,
    required List<Token> assetsUsed,
    required List<Item> items,
    required String address,
    required Price? gRePTPriceInfo,
    required num fiatAmountOwed,
    required BigInt gRePTUsedWhole,
    required int gRePTUsedDecimals,
    required BigInt gRePTRewardedWhole,
    required int gRePTRewardedDecimals,
    required int timestamp,
    String? imageUrl,
    String? communityAddress,
    String? originNetwork,
    @Default(false) bool voided,
    @Default(0) num priceChange,
    @JsonKey(ignore: true) @Default(0) num priceDiff,
    @JsonKey(ignore: true) @Default(0) int priceDiffLimitInDays,
    @JsonKey(ignore: true) @Default([]) List<Stats> stats,
    @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions,
  }) = _PaymentTransaction;

  String getGRePTUsed([bool withPrecision = false]) {
    if (num.parse(gRePTPriceInfo?.quote ?? '0').compareTo(0) <= 1) {
      return Formatter.formatValueToFiat(
        gRePTUsedWhole,
        gRePTUsedDecimals,
        double.tryParse(quote) ?? 0.0,
        withPrecision,
      );
    }
    return '0';
  }

  String getGRePTRewarded([bool withPrecision = false]) {
    if (num.parse(gRePTPriceInfo?.quote ?? '0').compareTo(0) <= 1) {
      return Formatter.formatValueToFiat(
        gRePTRewardedWhole,
        gRePTRewardedDecimals,
        double.tryParse(quote) ?? 0.0,
        withPrecision,
      );
    }
    return '0';
  }

  String get quote => gRePTPriceInfo?.quoteHuman ?? '0';

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionFromJson(json);
}
