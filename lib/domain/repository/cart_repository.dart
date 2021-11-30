import 'package:zip_app/domain/data/gift_card.dart';

abstract class CartRepository {
  Future<void> checkout(List<GiftCard> items);
}