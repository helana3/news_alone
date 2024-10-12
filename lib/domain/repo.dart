import 'package:dartz/dartz.dart';
import 'package:news_alone/core/error/failure.dart';
import 'package:news_alone/domain/entity.dart';

abstract class Repo{
Future<Either<serverError,List<Entity>>> fetchNewsData();
}