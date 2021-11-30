import 'package:zip_app/domain/data/gift_card.dart';

abstract class GiftCardRepository {
  Future<List<GiftCard>> fetchAllGiftCards();
}