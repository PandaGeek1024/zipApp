import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zip_app/domain/data/gift_card.dart';
import 'package:zip_app/domain/repository/cart_repository.dart';
import 'package:zip_app/domain/repository/gift_card_repository.dart';
import 'package:zip_app/domain/usecase/cart_usecase.dart';
import 'package:zip_app/domain/usecase/gift_card_usecase.dart';
import 'package:zip_app/domain/usecase/usecase.dart';

import 'mock_data.dart' as mock_data;
import 'usecase_test.mocks.dart';

@GenerateMocks([GiftCardRepository, CartRepository])
void main() {
  FetchAllGiftCardsUseCase fetchAllGiftCardsUseCase;
  group('Test fetch gift cards', () {
    test('Returns a list of gift cards successfully.', () async {
      final repository = MockGiftCardRepository();
      when(repository.fetchAllGiftCards())
          .thenAnswer((_) async => mock_data.fakeGiftCards);
      fetchAllGiftCardsUseCase = FetchAllGiftCardsUseCase(repository);
      final result = await fetchAllGiftCardsUseCase(NoParams());
      expect(result, const Right(mock_data.fakeGiftCards));
    });

    test('Fetch gift cards failed.', () async {
      final repository = MockGiftCardRepository();
      final exception = Exception('Demo exception');
      when(repository.fetchAllGiftCards()).thenThrow(exception);
      fetchAllGiftCardsUseCase = FetchAllGiftCardsUseCase(repository);
      final result = await fetchAllGiftCardsUseCase(NoParams());
      expect(result, Left(GeneralFailure(message: exception.toString())));
    });
  });

  group('Test checkout gift cards failed.', () {
    CheckoutGiftCardUseCase checkoutGiftCardUseCase;
    final repository = MockCartRepository();
    test('Checkout gift card successfully.', () async {
      checkoutGiftCardUseCase = CheckoutGiftCardUseCase(repository);
      final result = await checkoutGiftCardUseCase(mock_data.fakeGiftCards);
      verify(repository.checkout(mock_data.fakeGiftCards));
      expect(result, Right(Any()));
    });

    test('Checkout gift card failed.', () async {
      final exception = Exception('Demo exception');
      when(repository.checkout(mock_data.fakeGiftCards)).thenThrow(exception);
      checkoutGiftCardUseCase = CheckoutGiftCardUseCase(repository);
      final result = await checkoutGiftCardUseCase(mock_data.fakeGiftCards);
      expect(result, Left(GeneralFailure(message: exception.toString())));
    });
  });
}
