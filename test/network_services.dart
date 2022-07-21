import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:wallet_core/wallet_core.dart';

import 'network_services.mocks.dart';

// https://pub.dev/documentation/injectable/latest/#register-under-different-environments
@Environment(Env.test)
@module
@GenerateMocks([Graph, StudioApi, WalletApi, RootRouter])
abstract class ServicesModule {
  // @LazySingleton(as: Graph, env: [Env.test])
  @lazySingleton
  Graph get graph => MockGraph(
      // dotenv.env['GRAPH_BASE_URL']!,
      // dotenv.env['NFT_SUB_GRAPH_URL'] ??
      //     'https://api.thegraph.com/subgraphs/name/fuseio/fuse-nft',
      );

  // @LazySingleton(as: StudioApi, env: [Env.test])
  @lazySingleton
  StudioApi get api => MockStudioApi(
      // baseUrl: dotenv.env['API_BASE_URL']!,
      );

  // @LazySingleton(as: WalletApi, env: [Env.test])
  @lazySingleton
  WalletApi get walletApi => MockWalletApi(
      // baseUrl: dotenv.env['WALLET_API_BASE_URL']!,
      );

  // @LazySingleton(as: RootRouter, env: [Env.test])
  @lazySingleton
  RootRouter get rootRouter => MockRootRouter(
      // authGuard: AuthGuard()
      );
}
