import '../../../domain/entites/book_entites.dart';

abstract class NewestBooksStates {}

class InitialFetchNewestBooksState extends NewestBooksStates {}

class LoadingFetchNewestBooksState extends NewestBooksStates {}

class LoadingPaginationFetchNewestBooksState extends NewestBooksStates {}

class FailurePaginationFetchNewestBooksState extends NewestBooksStates {
  final String errMessage;

  FailurePaginationFetchNewestBooksState(this.errMessage);

}

class FailureFetchNewestBooksState extends NewestBooksStates {
  final String errMessage;

  FailureFetchNewestBooksState(this.errMessage);

}

class SuccessFetchNewestBooksState extends NewestBooksStates {
  final List<BookEntity>books;

  SuccessFetchNewestBooksState(this.books);

}