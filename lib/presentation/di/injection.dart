import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zip_app/data/api/api_client.dart' as client_builder;
import 'package:zip_app/data/api/gift_card_api.dart';
import 'package:zip_app/data/repository/gift_card_data_source.dart';
import 'package:zip_app/data/repository/gift_card_repository_impl.dart';
import 'package:zip_app/domain/repository/gift_card_repository.dart';
import 'package:zip_app/domain/usecase/gift_card_usecase.dart';

final injector = GetIt.instance;

void init() {
  injector.registerLazySingleton<Dio>(() => client_builder.buildApiClient());
  injector.registerLazySingleton<GiftCardApiService>(() => GiftCardApiServiceImpl(injector()));
  injector.registerLazySingleton<GiftCardDataSource>(
        () => GiftCardDataSourceImpl(injector()),
  );
  injector.registerLazySingleton<GiftCardRepository>(
        () => GiftCardRepositoryImpl(injector()),
  );
  injector.registerFactory(() => FetchAllGiftCardsUseCase(injector()));
}