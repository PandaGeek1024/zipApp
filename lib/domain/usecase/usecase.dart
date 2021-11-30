// Should only be used when no api called is involved.
import 'package:dartz/dartz.dart';

abstract class Failure {
  final dynamic _message;

  const Failure([this._message]);

  String get message => _message?.toString() ?? 'Unknown error.';
}

class GeneralFailure extends Failure {
  const GeneralFailure({String? message}) : super( message);
}

class NoParams{}


abstract class UseCase<Params, Type> {
  Future<Either<Failure, Type>> call(Params params);
}