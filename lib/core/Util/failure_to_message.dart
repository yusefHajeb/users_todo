import '../error/failure.dart';
import '../strings/failure.dart';

String failureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case EmptyCasheFailure:
      return emptyCacheFailureMessage;
    case OffLineFailure:
      return offlineFailureMessage;
    default:
      return "Unexpected Error, Please try again later.";
  }
}
