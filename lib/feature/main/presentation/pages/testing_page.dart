import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/presentation/main_screen.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';
import 'package:itlivetest/feature/main/presentation/widgets/question_container.dart';


class TestingPage extends StatefulWidget {
  final MainBloc bloc;
  final UserInformation userInformation;

  const TestingPage({super.key, required this.bloc,required this.userInformation});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {

  late PageController pageController;

  List<QuestionModel> questions = [];

  ValueNotifier<FormzSubmissionStatus> status = ValueNotifier(FormzSubmissionStatus.initial);

  int questionNumber = 1;

  late Timer _timer;

  late ValueNotifier<int> time;

  @override
  void initState() {
    super.initState();
    time = ValueNotifier(int.parse(widget.userInformation.status!.timeExpired!));
    widget.bloc.add(GetAllQuestionEvent(error: (error){
      AppFunctions.handleErrorFromResponse(error, context);
    }, success: (success){
      _timer = Timer.periodic(const Duration(seconds: 1),(Timer timer){
        if(time.value==0){
          widget.bloc.add(SetIsFinishedEvent(error: (error){ _timer.cancel(); Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(),), (route) => true);  }, success: (){ _timer.cancel(); Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(),), (route) => true);  }, loading: (){}));
        }else{
          time.value--;
        }
      });
      widget.bloc.add(GetOneQuestionByStatusIdEvent(questionPosition: 0,error: (error){ AppFunctions.handleErrorFromResponse(error, context); }, success: (success){ status.value = FormzSubmissionStatus.success; }, loading: (){}, questionId: widget.bloc.state.listQuestions[0].id??1));
    }, loading: (){}, statusId: widget.userInformation.status!.id!));
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: widget.bloc,
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: status,
              builder: (context,p0,p1) {
                if(status.value.isSuccess){
                  return Column(
                    children: [
                      const SizedBox(height: 32,),
                      Text('Question $questionNumber/${widget.bloc.state.listQuestions.length}'),
                      ValueListenableBuilder(
                          valueListenable: time,
                          builder: (context, value, child) {
                            return Text(time.value.toString());
                          },
                      ),
                      const Divider(thickness: 1,),
                      Expanded(
                          child: PageView.builder(
                            onPageChanged: (page){
                              setState(() {
                                questionNumber = page+1;
                              });
                            },
                            controller: pageController,
                            itemCount: state.listQuestions.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final question = state.listQuestions[index];
                              return QuestionContainer(
                                questionModel: question,
                                pageController: pageController,
                                bloc: widget.bloc,
                                questionId: question.id!,
                                questionPosition: questionNumber,
                                isFinish: questionNumber==widget.bloc.state.listQuestions.length,
                                timer: time,
                              );
                            },
                          )
                      ),
                    ],
                  );
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
