import '/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '/domain/model/models.dart';
import '/domain/repositroy/repository.dart';
import 'base_use_case.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repositry _repositry;

  HomeUseCase(this._repositry);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repositry.getHomeData();
  }
}
