// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCardResponse _$GiftCardResponseFromJson(Map<String, dynamic> json) =>
    GiftCardResponse(
      json['id'] as String,
      json['vendor'] as String,
      json['brand'] as String,
      json['image'] as String,
      (json['denominations'] as List<dynamic>)
          .map((e) => Denomination.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['position'] as int,
      (json['discount'] as num).toDouble(),
      json['terms'] as String,
      json['importantContent'] as String,
      json['cardTypeStatus'] as String,
      json['customDenominations'] as String,
      json['disclaimer'] as String,
    );

Map<String, dynamic> _$GiftCardResponseToJson(GiftCardResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor': instance.vendor,
      'brand': instance.brand,
      'image': instance.image,
      'denominations': instance.denominations,
      'position': instance.position,
      'discount': instance.discount,
      'terms': instance.terms,
      'importantContent': instance.importantContent,
      'cardTypeStatus': instance.cardTypeStatus,
      'customDenominations': instance.customDenominations,
      'disclaimer': instance.disclaimer,
    };

Denomination _$DenominationFromJson(Map<String, dynamic> json) => Denomination(
      (json['price'] as num).toDouble(),
      json['currency'] as String,
      json['stock'] as String,
    );

Map<String, dynamic> _$DenominationToJson(Denomination instance) =>
    <String, dynamic>{
      'price': instance.price,
      'currency': instance.currency,
      'stock': instance.stock,
    };
