import 'package:FlutterWeek/modules/search/domain/entities/result_search.dart';
import 'package:FlutterWeek/modules/search/domain/errors/erros.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository{
    Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}