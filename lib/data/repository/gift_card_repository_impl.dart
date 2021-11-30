import 'package:zip_app/data/repository/gift_card_data_source.dart';
import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/repository/gift_card_repository.dart';

class GiftCardRepositoryImpl implements GiftCardRepository {
  final GiftCardDataSource apiDataSource;

  GiftCardRepositoryImpl(this.apiDataSource);
  @override
  Future<List<GiftCard>> fetchAllGiftCards() => apiDataSource.fetchAllGiftCards();

}