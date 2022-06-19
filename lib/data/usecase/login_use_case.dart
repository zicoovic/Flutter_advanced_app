import '/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '/data/network/requests.dart';
import '/data/usecase/base_use_case.dart';
import '/domain/model/models.dart';
import '/domain/repositroy/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repositry _repositry;

  LoginUseCase(this._repositry);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repositry.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
