import 'package:bloc/bloc.dart';


import '../domain/entity.dart';
import '../domain/repo.dart';

part 'cubit_news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.repo) : super(NewsInitial());
  final Repo repo;

  void fetchNewsData() async{
    emit(NewsLoading());
    final response=  await repo.fetchNewsData();
    response.fold((failure) {
      emit(NewsFailure(errMessage: failure.errMessage)); // تعيين الحالة إلى فشل مع رسالة الخطأ
    },
          (entities) {
        emit(NewsSuccess(entities: entities)); // تعيين الحالة إلى نجاح مع البيانات
      },);
  }

}
