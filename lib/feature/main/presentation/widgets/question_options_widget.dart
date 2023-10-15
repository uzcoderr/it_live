import 'package:flutter/material.dart';
import 'package:itlivetest/feature/main/data/models/answer_model.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';

class QuestionOptionsWidget extends StatefulWidget {
  final QuestionModel questionModel;
  final ValueChanged<AnswerModel> onClickedAnswers;
  const QuestionOptionsWidget({super.key,required this.questionModel,required this.onClickedAnswers});

  @override
  State<QuestionOptionsWidget> createState() => _QuestionOptionsWidgetState();
}

class _QuestionOptionsWidgetState extends State<QuestionOptionsWidget> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: widget.questionModel.answers?.map((item)=>questionItemWidget(context, item)).toList()??[],
      ),
    );

  }

  Widget questionItemWidget(BuildContext context,AnswerModel answerModel){
    return GestureDetector(
      onTap: (){
        widget.onClickedAnswers(answerModel);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answerModel.value.toString(),
              style: const TextStyle(
                  fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
