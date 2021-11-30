import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift_card.freezed.dart';

@freezed
class GiftCard with _$GiftCard {
  factory GiftCard(
      {required String id,
      required String vendor,
      required String brand,
      required String image,
      required List<Denomination> denominations,
      required int position,
      required double discount,
      required String terms,
      required String importantContent,
      required String cardTypeStatus,
      required List<Denomination>? customDenominations,
      required String disclaimer}) = _GiftCard;

  const GiftCard._();
}

@freezed
class Denomination with _$Denomination {
  factory Denomination({required double price, String? currency, String? stock}) =
      _Denomination;

  const Denomination._();
}
