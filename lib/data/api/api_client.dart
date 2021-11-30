import 'package:dio/dio.dart';

Dio buildApiClient() {
  final options = BaseOptions(baseUrl: 'https://zip.co/giftcards/api/');
  final dio = Dio(options);
  return dio;
}