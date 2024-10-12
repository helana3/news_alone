import 'package:get_it/get_it.dart';
import 'package:news_alone/data/repo_impl/repo_impl.dart';

import '../data/services/service_api.dart';
import '../domain/repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<NewsService>(NewsService());
  getIt.registerSingleton<Repo>(RepoImpl(newsService: getIt<NewsService>()));


}