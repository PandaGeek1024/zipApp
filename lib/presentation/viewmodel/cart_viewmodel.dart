import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/usecase/cart_usecase.dart';

enum Result {success, failure}

class CartViewModel with ChangeNotifier {
  final CheckoutGiftCardUseCase _checkoutGiftCardUseCase;

  final List<String> _itemIds = [];

  late List<GiftCard>? _giftCards;

  CartViewModel(this._checkoutGiftCardUseCase);

  List<GiftCard> get giftCards => _giftCards ?? [];

  List<GiftCard> get items => _itemIds.map((id) => giftCards.firstWhere((e) => id == e.id)).toList();

  final StreamController<Result> _streamController = StreamController<Result>.broadcast();
  Stream<Result> get stream => _streamController.stream;

  set giftCards(List<GiftCard>? giftCards) {
    _giftCards = giftCards;
    notifyListeners();
  }

  void add(GiftCard item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(GiftCard item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }

  void checkout() async {
    final result = await _checkoutGiftCardUseCase(items);
    result.fold((failure) => null, (_) {
      _itemIds.clear();
      notifyListeners();
      _streamController.add(Result.success);
    });
  }
}
