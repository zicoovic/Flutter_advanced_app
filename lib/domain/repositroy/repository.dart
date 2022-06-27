import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/network/requests.dart';
import '/domain/model/models.dart';

abstract class Repositry {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, HomeObject>> getHomeData();
}
