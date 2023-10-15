import 'dart:async';

import 'package:flutter/material.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/presentation/main_screen.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';
import 'package:itlivetest/feature/main/presentation/widgets/question_options_widget.dart';

class QuestionContainer extends StatelessWidget {
  final QuestionModel questionModel;
  final PageController pageController;
  final MainBloc bloc;
  final int questionId;
  final int questionPosition;
  final ValueNotifier<int> timer;
  const QuestionContainer({super.key,required this.timer, required this.questionModel,required this.pageController,required this.bloc,required this.questionId,required this.questionPosition});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(questionModel.title??'Question',style: const TextStyle(
              fontFamily: 'DEF Bold',
              fontSize: 25
            ),),
          ),
        const SizedBox(height: 33,),
        Expanded(child: QuestionOptionsWidget(questionModel: questionModel,onClickedAnswers: (q){
          bloc.add(AddUserDataEvent(error: (error){
              if(error is ServerFailure){
                if(error.errorMessage=='Bu savolga allaqachon javob bergansiz'){
                  AppFunctions.handleErrorFromResponse(error, context,onSkip: (){
                    nextPage(context);
                  },isSkip: true,skipMessage: 'Next');
                }else{
                  AppFunctions.handleErrorFromResponse(error, context);
                }
              }
            }, success: (success){
            AppFunctions.showInfoAlert(success.message.toString(), context);
            nextPage(context);
          }, loading: (){
            AppFunctions.showLoading(context);
          }, obj: TwoObj(a: q.questionId,b: q.answerId)));
        },)),
      ],
    );
  }

  void nextPage(BuildContext context){
    bloc.add(GetOneQuestionByStatusIdEvent(error: (error){ AppFunctions.handleErrorFromResponse(error, context); }, success: (success){
      Navigator.pop(context);
      if(questionPosition==pageController.page!.toInt()+1){
        bloc.add(SetIsFinishedEvent(error: (error){ AppFunctions.handleErrorFromResponse(error, context); }, success: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
        }, loading: (){}));
      }else{
        pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    }, loading: (){}, questionId: questionId, questionPosition: questionPosition));
  }

}
