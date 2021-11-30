import 'package:dio/dio.dart';

abstract class GiftCardApiService {
  Future<Response> fetchAllGiftCards();
}

class GiftCardApiServiceImpl implements GiftCardApiService {
  final Dio client;

  GiftCardApiServiceImpl(this.client);

  @override
  Future<Response> fetchAllGiftCards() => client.get('giftcards');
}
