import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/login/domain/use_cases/login_usecase.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginUseCase loginUseCase = LoginUseCase();

  LoginBloc() : super(const LoginState()) {
    on<GetLoginEvent>((event, emit) async{
        event.loading();
        final result = await loginUseCase.call(event.obj);
        if(result.isRight){
          await StorageRepository.putString(StoreKeys.token, result.right.object);
          event.success(result.right);
        }else{
          event.onError(result.left);
        }
    });
  }

}
