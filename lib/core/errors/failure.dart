import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  final String message;
  final int statusCode;

  const Failure(this.message, this.statusCode,
      [this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties, message, statusCode];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({required String message, required int statusCode})
      : super(message, statusCode);
}

class CacheFailure extends Failure {

  const CacheFailure({required String message, required int statusCode})
      : super(message, statusCode);
}
