part of 'cubit_news_cubit.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}


class NewsLoading extends NewsState{}

class NewsSuccess extends NewsState {
  final List<Entity> entities; // تعديل هذا إلى List<Entity>

  NewsSuccess({required this.entities});
}

class NewsFailure extends NewsState {
  final String errMessage;
  NewsFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage]; // أضف `errMessage` للقائمة
}