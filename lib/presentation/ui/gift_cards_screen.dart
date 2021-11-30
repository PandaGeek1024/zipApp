import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zip_app/presentation/viewmodel/gift_cards_viewmodel.dart';

import 'detail_screen.dart';

// Width and height for thumbnail images.
const mobileThumbnailSize = 60.0;

class GiftCardsScreen extends StatelessWidget {
  const GiftCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<GiftCardViewModel>().giftCards ?? [];
    return ListView.separated(
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: SizedBox(
                width: mobileThumbnailSize,
                height: mobileThumbnailSize,
                child: CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: Text(item.brand),
            subtitle: Text(item.vendor),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.discount.toString()),
                const SizedBox(
                  width: 4,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              settings: const RouteSettings(name: "/detail"),
                              builder: (context) => DetailScreen(
                                    item: item,
                                  )));
                    },
                    child: const Text('detail'))
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4,
          );
        },
        itemCount: items.length);
  }
}
