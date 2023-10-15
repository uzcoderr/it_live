
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';
import 'package:itlivetest/feature/main/presentation/pages/interview_questions_page.dart';

class LanguagesPage extends StatefulWidget {
  final MainBloc bloc;
  final UserInformation userInformation;
  const LanguagesPage({super.key, required this.bloc,required this.userInformation});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {


  ValueNotifier<FormzSubmissionStatus> status = ValueNotifier(FormzSubmissionStatus.initial);
  List<ProgrammingLanguageModel> languages = [];

  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetAllLanguagesEvent(error: (error){ AppFunctions.handleErrorFromResponse(error, context); }, success: (success){
      languages.addAll(success);
      status.value = FormzSubmissionStatus.success;
    }, loading: (){}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: widget.bloc,
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: status,
              builder: (context,p0,p1) {
                if(status.value.isSuccess){
                  return ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InterViewQuestionsPage(userInformation: widget.userInformation, bloc: widget.bloc, interviewQuestionModel: languages[index]),));
                      },
                      title: Text(languages[index].programmingLanguageName!),
                    );
                  },);
                }else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            );
          },
        ),
      ),
    );
  }
}
