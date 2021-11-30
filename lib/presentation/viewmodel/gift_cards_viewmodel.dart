import 'package:flutter/cupertino.dart';
import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/usecase/gift_card_usecase.dart';
import 'package:zip_app/domain/usecase/usecase.dart';

class GiftCardViewModel with ChangeNotifier {
  final FetchAllGiftCardsUseCase _fetchAllGiftCardsUseCase;

  List<GiftCard>? _giftCards;

  List<GiftCard>? get giftCards => _giftCards;

  GiftCardViewModel(this._fetchAllGiftCardsUseCase) {
    _fetchAllGiftCards();
  }

  Future<void> _fetchAllGiftCards() async{
    final result = await _fetchAllGiftCardsUseCase(NoParams());
    result.fold((failure) => null, (items) {
      _giftCards = items;
      notifyListeners();
    });
  }
}
