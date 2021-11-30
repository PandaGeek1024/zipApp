import 'package:json_annotation/json_annotation.dart';
import 'package:zip_app/data/entity/price_format_converter.dart';
import 'package:zip_app/domain/data/gift_card.dart' as data;

part 'gift_card_response.g.dart';

@JsonSerializable()
class GiftCardResponse {
  final String id;
  final String vendor;
  final String brand;
  final String image;
  final List<Denomination> denominations;
  final int position;
  final double discount;
  final String terms;
  final String importantContent;
  final String cardTypeStatus;
  final List<Denomination>? customDenominations;
  final String disclaimer;

  GiftCardResponse(
      this.id,
      this.vendor,
      this.brand,
      this.image,
      this.denominations,
      this.position,
      this.discount,
      this.terms,
      this.importantContent,
      this.cardTypeStatus,
      this.customDenominations,
      this.disclaimer);

  factory GiftCardResponse.fromJson(Map<String, dynamic> json) => _$GiftCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardResponseToJson(this);

  data.GiftCard toGiftCard() {
    final denominationList = denominations.map((e) => e.toDenomination()).toList();
    final customDenominationsList = customDenominations?.map((e) => e.toDenomination()).toList();
    return data.GiftCard(
        id: id,
        vendor: vendor,
        brand: brand,
        image: image,
        denominations: denominationList,
        position: position,
        discount: discount,
        terms: terms,
        importantContent: importantContent,
        cardTypeStatus: cardTypeStatus,
        customDenominations: customDenominationsList,
        disclaimer: disclaimer);
  }
}

@JsonSerializable()
class Denomination {
  @PriceFormatConverter()
  final double price;
  final String? currency;
  final String? stock;

  Denomination(this.price, this.currency, this.stock);

  factory Denomination.fromJson(Map<String, dynamic> json) => _$DenominationFromJson(json);

  Map<String, dynamic> toJson() => _$DenominationToJson(this);

  data.Denomination toDenomination() => data.Denomination(price: price, currency: currency, stock: stock);
}
