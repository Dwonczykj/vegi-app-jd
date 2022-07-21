import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:wallet_core/wallet_core.dart';
import 'package:wallet_core/wallet_core.dart' show Graph, StudioApi, WalletApi;

@Environment(Env.prod)
@Environment(Env.dev)
@module
abstract class ServicesModule {
  // @LazySingleton(as: Graph, env: [Env.prod])
  @lazySingleton
  Graph get graph => Graph(
        dotenv.env['GRAPH_BASE_URL']!,
        dotenv.env['NFT_SUB_GRAPH_URL'] ??
            'https://api.thegraph.com/subgraphs/name/fuseio/fuse-nft', // 'https://api.thegraph.com/subgraphs/name/mul53/nft-subgraph',
      );

  // @LazySingleton(as: StudioApi, env: [Env.prod])
  @lazySingleton
  StudioApi get api => StudioApi(
        baseUrl: dotenv.env['API_BASE_URL']!,
      );

  // @LazySingleton(as: WalletApi, env: [Env.prod])
  @lazySingleton
  WalletApi get walletApi => WalletApi(
        baseUrl: dotenv.env['WALLET_API_BASE_URL']!,
      );

  // @LazySingleton(as: RootRouter, env: [Env.prod])
  @lazySingleton
  RootRouter get rootRouter => RootRouter(authGuard: AuthGuard());
}


