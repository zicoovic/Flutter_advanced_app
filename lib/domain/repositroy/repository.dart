import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_app/data/network/failure.dart';
import 'package:flutter_advanced_app/data/network/requests.dart';
import 'package:flutter_advanced_app/domain/model/models.dart';

abstract class Repositry {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
