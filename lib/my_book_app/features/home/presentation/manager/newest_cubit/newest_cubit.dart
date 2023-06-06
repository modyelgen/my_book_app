import 'package:app_1/my_book_app/features/home/presentation/manager/newest_cubit/newest_states.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/fetch_newest_book_use_case.dart';

class FetchNewestCubit extends Cubit<NewestBooksStates>
{
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  FetchNewestCubit(this.fetchNewestBooksUseCase):super(InitialFetchNewestBooksState());
  Future<void>fetchNewestBooks({int pageNumber=0})async{
    if(pageNumber==0){
      emit(LoadingFetchNewestBooksState());
    }
    else{
      emit(LoadingPaginationFetchNewestBooksState());
    }
    var result=await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if(pageNumber ==0){
        emit(FailureFetchNewestBooksState(failure.errMessage));
      }
      else {
        emit(FailurePaginationFetchNewestBooksState(failure.errMessage));
      }

    }, (books)  {
      emit(SuccessFetchNewestBooksState(books));
    });
  }
}