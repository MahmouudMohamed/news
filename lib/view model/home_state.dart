
abstract class HomeStates {}

final class HomeInitialState extends HomeStates {}

final class GetSourcesLoadingState extends HomeStates {}

final class GetSourcesErrorState extends HomeStates {}

final class GetSourcesSuccessState extends HomeStates {}

final class GetNewsLoadingState extends HomeStates {}

final class GetNewsErrorState extends HomeStates {}

final class GetNewsSuccessState extends HomeStates {}
final class HomeChangeSource extends HomeStates {}