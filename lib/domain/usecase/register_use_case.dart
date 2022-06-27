import '/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '/data/network/requests.dart';

import '/domain/model/models.dart';
import '/domain/repositroy/repository.dart';
import 'base_use_case.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repositry _repositry;

  RegisterUseCase(this._repositry);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repositry.register((RegisterRequest(
        input.countryMobileCode,
        input.email,
        input.mobileNumber,
        input.password,
        input.profilePicture,
        input.userName)));
  }
}

class RegisterUseCaseInput {
  String email;
  String password;
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String profilePicture;
  RegisterUseCaseInput(this.userName, this.countryMobileCode, this.email,
      this.password, this.mobileNumber, this.profilePicture);
}
