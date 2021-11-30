import 'package:dartz/dartz.dart';
import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/repository/cart_repository.dart';
import 'package:zip_app/domain/usecase/usecase.dart';

class CheckoutGiftCardUseCase implements UseCase<List<GiftCard>, Any> {
  final CartRepository _repository;

  CheckoutGiftCardUseCase(this._repository);

  @override
  Future<Either<Failure, Any>> call(List<GiftCard> items) async {
    try {
      await _repository.checkout(items);
      return Right(Any());
    } catch (ex) {
      return Left(GeneralFailure(message: ex.toString()));
    }
  }
}