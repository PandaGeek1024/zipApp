import 'package:flutter/material.dart';
import 'package:zip_app/presentation/ui/shopping_cart_screen.dart';

import 'gift_cards_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ['Gift Cards', 'Shopping Cart'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildPage(String tab) {
    if (tabs[0] == tab) {
      return const GiftCardsScreen();
    } else {
      return const ShoppingCardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zip co'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        for (final tab in tabs) _buildPage(tab),
      ]),
    );
  }
}
