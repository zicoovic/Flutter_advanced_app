import 'package:advanced_flutter_arabic/domain/repositroy/repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/models.dart';
import 'base_use_case.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  Repositry repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}
