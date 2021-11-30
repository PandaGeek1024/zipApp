import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(8),
          child: Text(
            'You have successfully purchased the item',
            style: textTheme.headline5?.copyWith(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
