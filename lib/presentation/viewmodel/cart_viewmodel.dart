import 'package:flutter/cupertino.dart';
import 'package:zip_app/domain/data/gift_card.dart';

import 'gift_cards_viewmodel.dart';

class CartViewModel with ChangeNotifier {
  late List<GiftCard>? _giftCards;

  List<GiftCard>? get giftCards => _giftCards;

  set giftCards(List<GiftCard>? giftCards) {
    _giftCards = giftCards;
    notifyListeners();
  }
}