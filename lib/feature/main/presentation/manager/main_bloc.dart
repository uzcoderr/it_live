import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/main/data/models/answer_model.dart';
import 'package:itlivetest/feature/main/data/models/interview_question_model.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/data/models/rating_model.dart';
import 'package:itlivetest/feature/main/data/models/update_user_data.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/domain/use_cases/add_user_data_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_all_languges_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_all_questions_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_one_question_by_status_id_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_user_rating_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/set_is_finished_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/update_user_information_usecase.dart';
import 'package:itlivetest/feature/main/domain/use_cases/user_information_usecase.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';
import 'package:itlivetest/feature/register/data/models/status_model.dart';
import 'package:itlivetest/feature/register/domain/use_cases/get_all_groups_usecase.dart';
import 'package:itlivetest/feature/register/domain/use_cases/get_status_by_grou_id_usecase.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  UserInformationUseCase userInformationUseCase = UserInformationUseCase();
  UpdateUserInformationUseCase updateUserInformationUseCase = UpdateUserInformationUseCase();
  GetStatusByGroupIdUseCase getStatusByGroupIdUseCase = GetStatusByGroupIdUseCase();
  GetAllGroupsUseCase getAllGroupsUseCase = GetAllGroupsUseCase();
  GetAllQuestionsUseCase getAllQuestionsUseCase = GetAllQuestionsUseCase();
  GetOneQuestionByStatusIdUseCase getOneQuestionByStatusId = GetOneQuestionByStatusIdUseCase();
  AddUserDataUseCase addUserDataUseCase = AddUserDataUseCase();
  GetInterViewQuestionByLanguageIdUseCase getInterViewQuestionByLanguageIdUseCase = GetInterViewQuestionByLanguageIdUseCase();
  GetAllLanguagesUseCase getAllLanguagesUseCase = GetAllLanguagesUseCase();
  SetIsFinishedUseCase setIsFinishedUseCase = SetIsFinishedUseCase();
  GetUsersRatingUseCase getUsersRatingUseCase = GetUsersRatingUseCase();

  MainBloc() : super(const MainState()) {
    on<InterViewResetEvent>((event,emit)async{
      emit(state.copyWith(isFinishInterViewQuestions: false));
      emit(state.copyWith(interViewQuestions: [],interViewQuestionsStatus: FormzSubmissionStatus.initial,page: 0));
      event.success();
    });
    on<GetMoreRatingUsersEvent>((event,emit)async{
      final result = await getUsersRatingUseCase.call(event.params);
      if(result.isRight){
        emit(state.copyWith(ratingUsers: [...state.ratingUsers, ...result.right],ratingUsersPage: state.page+1));
      }else{
        emit(state.copyWith(ratingUsersStatus: FormzSubmissionStatus.failure));
      }
    });
    on<GetRatingUsersEvent>((event,emit)async{
      emit(state.copyWith(ratingUsersStatus: FormzSubmissionStatus.inProgress));
      final result = await getUsersRatingUseCase.call(event.params);
      if(result.isRight){
        emit(state.copyWith(ratingUsersStatus: FormzSubmissionStatus.success,ratingUsers: result.right));
      }else{
        emit(state.copyWith(ratingUsersStatus: FormzSubmissionStatus.failure));
      }
    });
    on<GetMoreInterViewQuestionsEvent>((event,emit)async{
      event.loading();
      final result = await getInterViewQuestionByLanguageIdUseCase.call(event.params);
      if(result.isRight){
        if(result.right.isEmpty){
          emit(state.copyWith(isFinishInterViewQuestions: true));
        }else{
          emit(state.copyWith(interViewQuestions: [...state.interViewQuestions, ...result.right],interViewQuestionsStatus: FormzSubmissionStatus.success,page: state.page+1));
        }
      }
    });
    on<SetIsFinishedEvent>((event,emit)async{
      event.loading();
      final result = await setIsFinishedUseCase.call(1);
      if(result.isRight){
        event.success();
      }else{
        event.error(result.left);
      }
    });
    on<GetInterViewQuestionByLanguageIdEvent>((event,emit)async{
      event.loading();
      final result = await getInterViewQuestionByLanguageIdUseCase.call(event.params);
      if(result.isRight){
        emit(state.copyWith(interViewQuestions: result.right,interViewQuestionsStatus: FormzSubmissionStatus.success,page: state.page+1));
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<GetAllLanguagesEvent>((event,emit)async{
      event.loading();
      final result = await getAllLanguagesUseCase.call(1);
      if(result.isRight){
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<AddUserDataEvent>((event,emit)async{
      event.loading();
      final result = await addUserDataUseCase.call(event.obj);
      if(result.isRight){
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<GetOneQuestionByStatusIdEvent>((event,emit)async{
      event.loading();
      final result = await getOneQuestionByStatusId.call(event.questionId);
      if(result.isRight){
        List<QuestionModel> list = state.listQuestions;
        list[event.questionPosition].answers!.addAll(result.right.answers as Iterable<AnswerModel>);
        emit(state.copyWith(listQuestions: list));
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<GetAllQuestionEvent>((event,emit)async{
      event.loading();
      final result = await getAllQuestionsUseCase.call(event.statusId);
      if(result.isRight){
        emit(state.copyWith(listQuestions: result.right));
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<GetUserInformationEvent>((event, emit) async{
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await userInformationUseCase.call(0);
      if(result.isRight){
        event.success(result.right);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      }else{
        event.error(result.left);
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<UpdateUserInformationEvent>((event,emit)async{
      event.loading();
      final result = await updateUserInformationUseCase.call(event.userData);
      if(result.isRight){
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<GetStatusByGroupIdEvent>((event,emit)async{
      event.loading();
      final result = await getStatusByGroupIdUseCase.call(event.id);
      if(result.isRight){
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
    on<GetAllGroupsEvent>((event,emit)async{
      event.loading();
      final result = await getAllGroupsUseCase.call(0);
      if(result.isRight){
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
  }
}
