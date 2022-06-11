import 'package:flutter_advanced_app/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_app/data/mapper/mapper.dart';
import 'package:flutter_advanced_app/data/network/error_handler.dart';
import 'package:flutter_advanced_app/data/network/network_info.dart';
import 'package:flutter_advanced_app/domain/model/models.dart';
import 'package:flutter_advanced_app/data/network/requests.dart';
import 'package:flutter_advanced_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_app/domain/repositroy/repository.dart';

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
}
