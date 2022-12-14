import 'package:flutter/material.dart';
import 'package:leew_wallet/screens/home_screen/home_screen.dart';
import 'package:leew_wallet/screens/walkthrough_screens/walkthrough.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen/screens/widgets/network_provider.dart';
import 'screens/home_screen/screens/widgets/token_info_tile_provider.dart';
import 'screens/home_screen/screens/widgets/transaction_item_provider.dart';
import 'screens/wallet_setup/by_seed_phrase/screens/seed_phrase.dart';
import 'screens/wallet_setup/new_wallet/create_new_wallet_screen.dart';
import 'screens/wallet_setup/wallet_setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NetworkProvider>(
          create: (_) => NetworkProvider(),
        ),
        ChangeNotifierProvider<TransactionProvider>(
          create: (_) => TransactionProvider(),
        ),
        ChangeNotifierProvider<TokenProvider>(
          create: (_) => TokenProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leew Wallet',
        home: const Walkthrough(),
        theme: ThemeData(
          fontFamily: "Archivo",
          scaffoldBackgroundColor: const Color.fromRGBO(8, 10, 12, 1),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(8, 10, 12, 1),
            elevation: 0,
          ),
        ),
        routes: {
          WalletSetup.routeName: (context) => const WalletSetup(),
          SeedPhrase.routeName: (context) => const SeedPhrase(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          CreateNewWalletScreen.routeName: (context) =>
              const CreateNewWalletScreen(),
        },
      ),
    );
  }
}
