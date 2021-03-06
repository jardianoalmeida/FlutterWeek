import 'package:FlutterWeek/modules/search/domain/entities/result_search.dart';
import 'package:FlutterWeek/modules/search/domain/errors/erros.dart';
import 'package:FlutterWeek/modules/search/domain/repositories/search_respository.dart';
import 'package:FlutterWeek/modules/search/domain/usercases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository{}

main(){
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("jardiano");
    expect(result.getOrElse(() => null), isA<List<ResultSearch>>());
  });

  test('deve retornar um InvalideTextError caso o texto seja invalido', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.fold(id,id), isA<InvalideTextError>());
    result = await usecase("");
    expect(result.fold(id,id), isA<InvalideTextError>());
  });
}