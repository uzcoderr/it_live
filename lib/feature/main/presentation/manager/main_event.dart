part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}


class GetUserInformationEvent extends MainEvent{
  final Function(UserInformation userInformation) success;
  final Function(Failure) error;
  GetUserInformationEvent({required this.success,required this.error});
}

class UpdateUserInformationEvent extends MainEvent{
  final UpdateUserData userData;
  final Function(RegisterRes user) success;
  final Function(Failure) error;
  final Function loading;
  UpdateUserInformationEvent({required this.success,required this.error,required this.loading,required this.userData});
}

class GetAllGroupsEvent extends MainEvent{
  final Function(List<Group> groups) success;
  final Function(Failure) error;
  final Function loading;
  GetAllGroupsEvent({required this.error,required this.success,required this.loading});
}

class GetStatusByGroupIdEvent extends MainEvent{
  final int id;
  final Function loading;
  final Function(Failure) error;
  final Function(List<StatusModel>) success;
  GetStatusByGroupIdEvent({required this.success,required this.error,required this.loading,required this.id});
}

class GetAllQuestionEvent extends MainEvent{
  final int statusId;
  final Function(List<QuestionModel> questions) success;
  final Function(Failure) error;
  final Function loading;
  GetAllQuestionEvent({required this.error,required this.success,required this.loading,required this.statusId});
}

class GetOneQuestionByStatusIdEvent extends MainEvent{
  final int questionId;
  final int questionPosition;
  final Function(QuestionModel questions) success;
  final Function(Failure) error;
  final Function loading;
  GetOneQuestionByStatusIdEvent({required this.error,required this.success,required this.loading,required this.questionId,required this.questionPosition});
}

class AddUserDataEvent extends MainEvent{
  final TwoObj obj;
  final Function(RegisterRes questions) success;
  final Function(Failure) error;
  final Function loading;
  AddUserDataEvent({required this.error,required this.success,required this.loading,required this.obj});
}

class GetAllLanguagesEvent extends MainEvent{
  final Function(List<ProgrammingLanguageModel> languages) success;
  final Function(Failure) error;
  final Function loading;
  GetAllLanguagesEvent({required this.error,required this.success,required this.loading});
}

class GetInterViewQuestionByLanguageIdEvent extends MainEvent{
  final ThreeObj params;
  final Function(List<InterviewQuestionModel> questions) success;
  final Function(Failure) error;
  final Function loading;
  GetInterViewQuestionByLanguageIdEvent({required this.error,required this.success,required this.loading,required this.params});
}

class GetMoreInterViewQuestionsEvent extends MainEvent{
  final ThreeObj params;
  final Function(List<InterviewQuestionModel> questions) success;
  final Function(Failure) error;
  final Function loading;
  GetMoreInterViewQuestionsEvent({required this.error,required this.success,required this.loading,required this.params});
}

class SetIsFinishedEvent extends MainEvent{
  final Function() success;
  final Function(Failure) error;
  final Function loading;
  SetIsFinishedEvent({required this.error,required this.success,required this.loading});
}

class GetRatingUsersEvent extends MainEvent{
  final ThreeObj params;
  GetRatingUsersEvent({required this.params});
}

class GetMoreRatingUsersEvent extends MainEvent{
  final ThreeObj params;
  GetMoreRatingUsersEvent({required this.params});
}