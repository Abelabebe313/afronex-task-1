import 'dart:async';

import 'package:afronex_task_1/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure,Output>> call(Input input);
}

class NoParams {}
