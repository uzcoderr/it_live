import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';

class RatingPage extends StatefulWidget {
  final MainBloc bloc;
  final UserInformation userInformation;

  const RatingPage(
      {super.key, required this.userInformation, required this.bloc});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {

  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetRatingUsersEvent(params: ThreeObj(a: widget.userInformation.status!.id,b: 0,c: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: widget.bloc,
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if(state.ratingUsersStatus.isSuccess){
              var users = state.ratingUsers;
              return ListView.builder(itemCount: users.length, itemBuilder: (context, index) {

                if(index+1==users.length){
                  widget.bloc.add(GetMoreRatingUsersEvent(params: ThreeObj(a: widget.userInformation.status!.id, b: state.ratingUsersPage, c: 20)));
                }

                return ListTile(
                  leading: CircleAvatar(child: Text((index+1).toString(),style: TextStyle(fontFamily: 'DEF Bold',fontSize: 20),)),
                  title: Row(
                    children: [
                      Text(users[index].name.toString()),
                      const SizedBox(width: 10,),
                      Text(users[index].surname.toString())
                    ],
                  ),
                  subtitle: Text(users[index].ball.toString()),
                );

              },);
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
