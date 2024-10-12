abstract class Failure{
  final String errMessage;

  Failure({required this.errMessage});
}


class serverError extends Failure{
  serverError({required super.errMessage});
}