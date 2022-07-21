import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core/wallet_core.dart';

void main() {
  test('description', () async {
    // await dotenv.load(fileName: 'environment/.env');
    var walletApi = WalletApi(
      baseUrl: "https://wallet.fuse.io/api",
    );
    bool? result = false;
    result = await walletApi.loginWithSMS("+447905532512");
    var x = 1;
  });
}
