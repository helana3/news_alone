import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:news_alone/core/error/failure.dart';

import '../model/modelNews.dart';

class NewsService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://newsapi.org/v2/everything?q=tesla&from=2024-09-10&sortBy=publishedAt&apiKey=a5b2c01c14e84694bf7c3b61a69223ae';

  Future<Either<Failure, List<ModelNews>>> fetchNewsData() async {
    try {
      // استدعاء API
      final response = await _dio.get(_baseUrl);

      // التأكد من نجاح الطلب
      if (response.statusCode == 200) {
        // استخراج البيانات من الاستجابة وتحويلها إلى قائمة ModelNews
        List articles = response.data['articles'];

        List<ModelNews> newsList = articles.map((article) {
          return ModelNews.fromjson(article);
        }).toList();

        return Right(newsList); // إرجاع البيانات بنجاح
      } else {
        // إذا كانت الاستجابة غير ناجحة
        return Left(serverError(
            errMessage: 'Failed to fetch news. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة
      return Left(serverError(errMessage: e.toString()));
    }
  }
}
