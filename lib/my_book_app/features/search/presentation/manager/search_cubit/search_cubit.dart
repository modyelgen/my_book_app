import 'package:app_1/my_book_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/use_case/fetch_searched_book_use_case.dart';

class SearchCubit extends Cubit<SearchState>{
  final SearchUseCase searchUseCase;
  SearchCubit(this.searchUseCase):super(InitialSearchState());
  String word='';
  void fetchWord({required String searchWord}){
    word=searchWord;
    if(word==''){
      emit(InitialAfterSearchState());
    }
  }
  Future<void> fetchSearchBooks()async {
    emit(LoadingSearchState());
    var result =await searchUseCase.call(word);
   return result.fold((failure){
      emit(FailureSearchState(failure.errMessage));
    },
            (book){
      emit(SuccessSearchState(book));
            });

  }
}