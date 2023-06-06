import 'package:app_1/my_book_app/features/home/presentation/manager/feature_cubit/feature_states.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/use_cases/fetch_feature_use_case.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksStates>{
  final FetchFeatureBookUseCase featureBookUseCase;
  FeatureBooksCubit(this.featureBookUseCase):super(InitialFetchFeatureBooksState());
  Future<void>fetchFeaturedBooks({int pageNumber=0})async{
    if(pageNumber==0){
      emit(LoadingFetchFeatureBooksState());
    }
    else{
      emit(LoadingPaginationFetchFeatureBooksState());
    }
    var result=await featureBookUseCase.call(pageNumber);
    result.fold(
            (failure) {
              if(pageNumber==0){
                emit(FailureFetchFeatureBooksState(failure.errMessage));
              }

              else {
                emit(FailurePaginationFetchFeatureBooksState(failure.errMessage));
              }
              },
            (books) {emit(SuccessFetchFeatureBooksState(books));});
  }
}