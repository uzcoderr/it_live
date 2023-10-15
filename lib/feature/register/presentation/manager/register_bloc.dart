
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/models/register_user.dart';
import 'package:itlivetest/feature/register/data/models/status_model.dart';
import 'package:itlivetest/feature/register/domain/use_cases/email_verify_usecase.dart';
import 'package:itlivetest/feature/register/domain/use_cases/get_all_groups_usecase.dart';
import 'package:itlivetest/feature/register/domain/use_cases/get_status_by_grou_id_usecase.dart';
import 'package:itlivetest/feature/register/domain/use_cases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterUserUseCase registerUserUseCase = RegisterUserUseCase();
  EmailVerifyUseCase emailVerifyUseCase = EmailVerifyUseCase();
  GetAllGroupsUseCase getAllGroupsUseCase = GetAllGroupsUseCase();
  GetStatusByGroupIdUseCase getStatusByGroupIdUseCase = GetStatusByGroupIdUseCase();

  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {

    });

    on<RegisterUserEvent>((event,emit)async{
      event.loading();
      final result = await registerUserUseCase.call(event.user);
      if(result.isRight){
        event.success(event.user.email.toString());
      }else{
        event.error(result.left);
      }
    });

    on<VerifyUserEmailEvent>((event,emit)async{
      event.loading();
      final result = await emailVerifyUseCase.call(event.obj);
      if(result.isRight){
        await StorageRepository.putString(StoreKeys.token, result.right.object);
        event.success();
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

    on<GetStatusByGroupIdEvent>((event,emit)async{
      event.loading();
      final result = await getStatusByGroupIdUseCase.call(event.id);
      if(result.isRight){
        event.success(result.right);
      }else{
        event.error(result.left);
      }
    });
  }


}
