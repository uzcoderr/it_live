part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  final FormzSubmissionStatus status;
  final List<QuestionModel> listQuestions;
  final List<InterviewQuestionModel> interViewQuestions;
  final List<RatingModel> ratingUsers;
  final bool isFinishInterViewQuestions;
  final FormzSubmissionStatus interViewQuestionsStatus;
  final FormzSubmissionStatus ratingUsersStatus;
  final int page;
  final int ratingUsersPage;

  const MainState(
      {this.ratingUsers = const [],
      this.page = 0,
      this.status = FormzSubmissionStatus.initial,
      this.listQuestions = const [],
      this.interViewQuestions = const [],
      this.isFinishInterViewQuestions = false,
        this.ratingUsersStatus = FormzSubmissionStatus.initial,
        this.ratingUsersPage = 0,
      this.interViewQuestionsStatus = FormzSubmissionStatus.initial});

  MainState copyWith(
          {FormzSubmissionStatus? status,
            FormzSubmissionStatus? ratingUsersStatus,
            int? ratingUsersPage,
          List<QuestionModel>? listQuestions,
          List<InterviewQuestionModel>? interViewQuestions,
          bool? isFinishInterViewQuestions,
          FormzSubmissionStatus? interViewQuestionsStatus,
          int? page,
          List<RatingModel>? ratingUsers}) =>
      MainState(
          status: status ?? this.status,
          listQuestions: listQuestions ?? this.listQuestions,
          interViewQuestions: interViewQuestions ?? this.interViewQuestions,
          isFinishInterViewQuestions:
              isFinishInterViewQuestions ?? this.isFinishInterViewQuestions,
          interViewQuestionsStatus:
              interViewQuestionsStatus ?? this.interViewQuestionsStatus,
          page: page ?? this.page,
          ratingUsersPage: ratingUsersPage ?? this.ratingUsersPage,
          ratingUsersStatus: ratingUsersStatus ?? this.ratingUsersStatus,
          ratingUsers: ratingUsers??this.ratingUsers);

  @override
  List<Object?> get props => [
        status,
        listQuestions,
        interViewQuestions,
        isFinishInterViewQuestions,
        interViewQuestionsStatus,
        page,
        ratingUsers,
        ratingUsersStatus,ratingUsersPage
      ];
}
