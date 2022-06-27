import '/data/data_source/remote_data_source.dart';
import '/data/mapper/mapper.dart';
import '/data/network/error_handler.dart';
import '/data/network/network_info.dart';
import '/domain/model/models.dart';
import '/data/network/requests.dart';
import '/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '/domain/repositroy/repository.dart';

class RepositroyImpl implements Repositry {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositroyImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // it's connected to internet, it's safe to call API
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          // success
          return right(response.toDomain());
        } else {
          // failure -- business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.DEFUALT));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await _remoteDataSource.forgotPassword(email);

        if (response.status == ApiInternalStatus.success) {
          // success
          // return right
          return Right(response.toDomain());
        } else {
          // failure
          // return left
          return Left(Failure(response.status ?? ResponseCode.DEFUALT,
              response.message ?? ResponseMessage.DEFUALT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      // it's connected to internet, it's safe to call API
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ApiInternalStatus.success) {
          // success
          return right(response.toDomain());
        } else {
          // failure -- business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.DEFUALT));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await _remoteDataSource.getHomeData();

        if (response.status == ApiInternalStatus.success) {
          // success
          // return right
          return Right(response.toDomain());
        } else {
          // failure
          // return left
          return Left(Failure(response.status ?? ResponseCode.DEFUALT,
              response.message ?? ResponseMessage.DEFUALT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
