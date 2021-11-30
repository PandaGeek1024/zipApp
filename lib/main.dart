import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zip_app/presentation/di/injection.dart' as injection;
import 'package:zip_app/presentation/ui/home_screen.dart';
import 'package:zip_app/presentation/viewmodel/cart_viewmodel.dart';
import 'package:zip_app/presentation/viewmodel/gift_cards_viewmodel.dart';

void main() {
  injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GiftCardViewModel(injection.injector())),
        ChangeNotifierProxyProvider<GiftCardViewModel, CartViewModel>(
          create: (context) => CartViewModel(),
          update: (context, giftCardsViewModel, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.giftCards = giftCardsViewModel.giftCards;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
