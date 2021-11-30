// Should only be used when no api called is involved.
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic _message;

  const Failure([this._message]);

  String get message => _message?.toString() ?? 'Unknown error.';

  @override
  List<Object> get props => [_message];
}

class GeneralFailure extends Failure {
  const GeneralFailure({String? message}) : super( message);
}

class NoParams{}
class Any extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class UseCase<Params, Type> {
  Future<Either<Failure, Type>> call(Params params);
}