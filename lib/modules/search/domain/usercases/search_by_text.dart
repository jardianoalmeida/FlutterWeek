import 'package:FlutterWeek/modules/search/domain/entities/result_search.dart';
import 'package:FlutterWeek/modules/search/domain/errors/erros.dart';
import 'package:FlutterWeek/modules/search/domain/repositories/search_respository.dart';

import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {

  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {

    if(searchText == null || searchText.isEmpty){
      return Left(InvalideTextError());
    }

    return repository.search(searchText);
  }
}