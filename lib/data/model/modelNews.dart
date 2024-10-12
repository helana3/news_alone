

import 'package:news_alone/domain/entity.dart';

class ModelNews extends Entity{
  ModelNews({required super.image, required super.articleName, required super.autherName, required super.description});


  factory ModelNews.fromjson(Map<String,dynamic> json){
    return ModelNews(
        image: json['urlToImage']??"",
        articleName: json['title'] ?? 'Unknown article name',
        autherName: json['author'] ?? 'Unknown author',
        description:json['description'] ?? 'No description available',
    );
  }
}