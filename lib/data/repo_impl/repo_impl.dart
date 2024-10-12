import 'package:dartz/dartz.dart';

import 'package:news_alone/core/error/failure.dart';

import 'package:news_alone/domain/entity.dart';

import '../../domain/repo.dart';
import '../services/service_api.dart';

class RepoImpl extends Repo{
  final NewsService newsService;

  RepoImpl({required this.newsService});
  @override
  Future<Either<serverError, List<Entity>>> fetchNewsData() async{
   var response= await newsService.fetchNewsData();
  return response.fold(
      (failure){
       return left(serverError(errMessage: failure.errMessage));
      },
        (newsList) {
      List<Entity> entityList = newsList.map((news) {
        return Entity(
          image: news.image,
          articleName: news.articleName,
          autherName: news.autherName,
          description: news.description,
        );
      }).toList();
      return Right(entityList);
    },

  );

  }

}