import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<void> checkout(List<GiftCard> items) async {
    //TODO mock checkout behaviour.
  }

}