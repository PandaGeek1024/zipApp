import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zip_app/domain/data/gift_card.dart';

class DetailScreen extends StatelessWidget {
  final GiftCard item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  Widget _buildDenominations() {
    return Column(
      children: item.denominations
          .map((e) => ListTile(
                title: Text(e.price.toString()),
                subtitle: Text(e.currency ?? ''),
                trailing: Text(e.stock ?? ''),
              ))
          .toList(),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: () {

        }, child: const Text('buy now')),
        ElevatedButton(onPressed: () {}, child: const Text('add to cart')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item.brand),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: item.image,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              Text(item.discount.toString()),
              Text(item.terms),
              _buildDenominations(),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
