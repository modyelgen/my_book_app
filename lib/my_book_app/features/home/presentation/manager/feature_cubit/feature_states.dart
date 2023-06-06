import '../../../domain/entites/book_entites.dart';

abstract class FeatureBooksStates {}

class InitialFetchFeatureBooksState extends FeatureBooksStates {}

class LoadingFetchFeatureBooksState extends FeatureBooksStates {}

class LoadingPaginationFetchFeatureBooksState extends FeatureBooksStates {}

class FailurePaginationFetchFeatureBooksState extends FeatureBooksStates {
  final String errMessage;

  FailurePaginationFetchFeatureBooksState(this.errMessage);

}

class FailureFetchFeatureBooksState extends FeatureBooksStates {
  final String errMessage;

  FailureFetchFeatureBooksState(this.errMessage);

}

class SuccessFetchFeatureBooksState extends FeatureBooksStates {
  final List<BookEntity>books;

  SuccessFetchFeatureBooksState(this.books);

}