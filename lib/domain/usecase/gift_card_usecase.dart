import 'package:dartz/dartz.dart';
import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/repository/gift_card_repository.dart';
import 'package:zip_app/domain/usecase/usecase.dart';

class FetchAllGiftCardsUseCase implements UseCase<NoParams, List<GiftCard>> {
  final GiftCardRepository _repository;

  FetchAllGiftCardsUseCase(this._repository);

  @override
  Future<Either<Failure, List<GiftCard>>> call(NoParams params) async {
    try {
      final items = await _repository.fetchAllGiftCards();
      return Right(items);
    } catch (ex) {
      return Left(GeneralFailure(message: ex.toString()));
    }
  }
}
