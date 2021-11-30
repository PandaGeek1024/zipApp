import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zip_app/presentation/ui/success_screen.dart';
import 'package:zip_app/presentation/viewmodel/cart_viewmodel.dart';

class ShoppingCardScreen extends StatefulWidget {
  const ShoppingCardScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCardScreen> createState() => _ShoppingCardScreenState();
}

class _ShoppingCardScreenState extends State<ShoppingCardScreen> {
  bool _didInitState = false;
  StreamSubscription? _streamSubscription;

  @override
  @mustCallSuper
  void didChangeDependencies() {
    if (!_didInitState) {
      didInitState();
      _didInitState = true;
    }
    super.didChangeDependencies();
  }

  void didInitState() {
    //Just a way to demo how to call one off action with provider
    _streamSubscription = context.read<CartViewModel>().stream.listen((event) {
      if (event == Result.success) {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                settings: const RouteSettings(name: "/success"),
                builder: (context) => const SuccessScreen()));
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _CartList()),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
          context.read<CartViewModel>().checkout();
        }, child: const Text('checkout'))),
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<CartViewModel>();
    return ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) {
          final item = viewModel.items[index];
          return ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                viewModel.remove(viewModel.items[index]);
              },
            ),
            title: Text('${item.vendor}, ${item.brand}'),
            subtitle: Text(item.discount.toString()),
          );
        });
  }
}
