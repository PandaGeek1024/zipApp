import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zip_app/data/api/api_client.dart' as client_builder;
import 'package:zip_app/data/api/gift_card_api.dart';
import 'package:zip_app/data/repository/gift_card_data_source.dart';
import 'package:zip_app/data/repository/gift_card_repository_impl.dart';
import 'package:zip_app/domain/repository/gift_card_repository.dart';
import 'package:zip_app/domain/usecase/gift_card_usecase.dart';

final _injector = GetIt.instance;

void init() {
  _injector.registerLazySingleton<Dio>(() => client_builder.buildApiClient());
  _injector.registerLazySingleton<GiftCardApiService>(() => GiftCardApiServiceImpl(_injector()));
  _injector.registerLazySingleton<GiftCardDataSource>(
        () => GiftCardDataSourceImpl(_injector()),
  );
  _injector.registerLazySingleton<GiftCardRepository>(
        () => GiftCardRepositoryImpl(_injector()),
  );
  _injector.registerFactory(() => FetchAllGiftCardsUseCase(_injector()));
}