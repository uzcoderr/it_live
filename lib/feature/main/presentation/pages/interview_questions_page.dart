import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/main/data/models/interview_question_model.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';

class InterViewQuestionsPage extends StatefulWidget {
  final MainBloc bloc;
  final UserInformation userInformation;
  final ProgrammingLanguageModel interviewQuestionModel;

  const InterViewQuestionsPage(
      {super.key, required this.userInformation, required this.bloc,required this.interviewQuestionModel});

  @override
  State<InterViewQuestionsPage> createState() => _InterViewQuestionsPageState();
}

class _InterViewQuestionsPageState extends State<InterViewQuestionsPage> with TickerProviderStateMixin{

  var page = 0;
  ValueNotifier<FormzSubmissionStatus> status = ValueNotifier(FormzSubmissionStatus.initial);
  late AnimationController myAnimationController;

  @override
  void initState() {
    super.initState();
    myAnimationController = BottomSheet.createAnimationController(this);
    widget.bloc.add(GetInterViewQuestionByLanguageIdEvent(error: (error){ AppFunctions.handleErrorFromResponse(error, context); }, success: (success){
      page+=1;
      status.value = FormzSubmissionStatus.success;
    }, loading: (){}, params: ThreeObj(a: widget.interviewQuestionModel.id, b: page, c: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        widget.bloc.add(InterViewResetEvent(success: (){
          Navigator.pop(context);
        }));
        return false;
      },
      child: Scaffold(
        body: BlocProvider.value(
          value: widget.bloc,
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
                  if(state.interViewQuestionsStatus.isSuccess){
                    var questions =  state.interViewQuestions;
                    return ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index){
                        if(questions.length==index+1){
                          // if(!state.isFinishInterViewQuestions){
                            widget.bloc.add(GetMoreInterViewQuestionsEvent(error: (error){}, success: (success){}, loading: (){}, params: ThreeObj(a: widget.interviewQuestionModel.id, b: state.page, c: 15)));
                          // }
                        }
                        return ListTile(
                          leading: Text(index.toString()),
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (context) {
                                return DraggableScrollableSheet(
                                  initialChildSize: 0.4,
                                  minChildSize: 0.2,
                                  maxChildSize: 0.95,
                                  expand: false,
                                  builder: (context, scrollController) => Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
                                      child: ListView(
                                        controller: scrollController,
                                        children: [
                                          Text(questions[index].questionCount.toString(),style: const TextStyle(fontFamily: 'DEF Bold',fontSize: 25),),
                                          Text(questions[index].questionAnswer.toString()),
                                        ],
                                      ),
                                    ),
                                  ), );
                              });
                          },
                          title: Text(questions[index].questionCount.toString()),
                        );
                      },
                    );
                  }else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
            },
          ),
        ),
      ),
    );
  }
}
