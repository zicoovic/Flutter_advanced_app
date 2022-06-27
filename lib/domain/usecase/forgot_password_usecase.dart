import 'package:dartz/dartz.dart';

import '../repositroy/repository.dart';
import '../../data/network/failure.dart';
import 'base_use_case.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final Repositry _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgetPassword(input);
  }
}
