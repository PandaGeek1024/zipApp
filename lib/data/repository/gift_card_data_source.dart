import 'dart:io';

import 'package:zip_app/data/api/gift_card_api.dart';
import 'package:zip_app/data/entity/gift_card_response.dart';

import 'package:zip_app/domain/data/gift_card.dart';

abstract class GiftCardDataSource {
  Future<List<GiftCard>> fetchAllGiftCards();
}

class GiftCardDataSourceImpl implements GiftCardDataSource {
  final GiftCardApiService api;

  GiftCardDataSourceImpl(this.api);

  @override
  Future<List<GiftCard>> fetchAllGiftCards() async {
    try {
      var response = await api.fetchAllGiftCards();
      if (response.statusCode == HttpStatus.ok) {
        return (response.data as List).map<GiftCard>((x) {
          return GiftCardResponse.fromJson(x as Map<String, dynamic>).toGiftCard();
        }).toList();
      } else {
        throw Exception('Call returned error.');
      }
    } catch (e) {
      //TODO Refactor exception handling
      throw Exception('Network call failed.');
    }
  }
}
