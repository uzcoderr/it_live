import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/login/presentation/login_screen.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';
import 'package:itlivetest/feature/main/presentation/pages/languages_page.dart';
import 'package:itlivetest/feature/main/presentation/pages/rating_page.dart';
import 'package:itlivetest/feature/main/presentation/pages/testing_page.dart';
import 'package:itlivetest/feature/main/presentation/pages/update_user_info_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late MainBloc bloc;
  late UserInformation user;

  @override
  void initState() {
    super.initState();
    bloc = MainBloc()
      ..add(GetUserInformationEvent(
          success: (success) {
            user = success;
          },
          error: (error) {
            AppFunctions.handleErrorFromResponse(error, context);
          }
      ));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MainBloc>.value(
        value: bloc,
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state.status.isInProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state.status.isSuccess){
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        user.name??'tursunxon',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'DEF Bold'
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text('Umumiy ball: ${user.userBall}',textAlign: TextAlign.center,),
                    Text( user.isFinished??false ? 'Tugallangan' : 'Tugallanmagan',style: const TextStyle(
                      fontFamily: 'DEF Bold'
                    ),textAlign: TextAlign.center,),
                    const Expanded(child: SizedBox()),
                    const SizedBox(
                      child: Icon(
                          CupertinoIcons.person_alt_circle,
                        size: 170,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserInfoPage(bloc: bloc, userInformation: user),));
                      }, child: const Text('o\'zgartirish')),
                    ),
                    CupertinoButton(
                          child: Text(user.isFinished??false ?  'Reyting' : 'test yechish'),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  user.isFinished??false ? RatingPage(bloc: bloc,userInformation: user,) : TestingPage(bloc: bloc,userInformation: user),));
                          },
                        ),
                    CupertinoButton(
                          child: const Text('interview question'),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagesPage(bloc: bloc,userInformation: user),));
                          },
                        ),
                    CupertinoButton(
                      child: const Text('Logout'),
                      onPressed: (){
                        StorageRepository.deleteString(StoreKeys.token);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),(route) => false,);
                      },
                    ),
                    const Expanded(child: SizedBox()),

                  ],
                ),
              );
            }else{
              return const Center(
                child: Text('Something went wrong '),
              );
            }

          },
        ),
      ),
    );
  }
}
