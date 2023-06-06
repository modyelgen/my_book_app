import '../../../../home/domain/entites/book_entites.dart';

abstract class SearchState{}

class InitialSearchState extends SearchState {}

class InitialAfterSearchState extends SearchState {}

class LoadingSearchState extends SearchState {}

class FailureSearchState extends SearchState {
  final String errMessage;
  FailureSearchState(this.errMessage);
}

class SuccessSearchState extends SearchState {
  final List<BookEntity> books;
  SuccessSearchState(this.books);

}
