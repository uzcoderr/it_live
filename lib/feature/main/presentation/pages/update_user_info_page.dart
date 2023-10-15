import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/main/data/models/update_user_data.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/presentation/main_screen.dart';
import 'package:itlivetest/feature/main/presentation/manager/main_bloc.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';

class UpdateUserInfoPage extends StatefulWidget {
  final MainBloc bloc;
  final UserInformation userInformation;
  const UpdateUserInfoPage({super.key,required this.bloc,required this.userInformation});

  @override
  State<UpdateUserInfoPage> createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {

  List<Group> listGroup = [];
  TextEditingController name =  TextEditingController();
  TextEditingController surname =  TextEditingController();
  TextEditingController oldPassword =  TextEditingController();
  TextEditingController password =  TextEditingController();
  ValueNotifier<FormzSubmissionStatus> status = ValueNotifier(FormzSubmissionStatus.initial);
  late Group selectedGroup;

  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetAllGroupsEvent(
        error: (error){AppFunctions.handleErrorFromResponse(error, context);},
        success: (success)async{
            listGroup.addAll(success);
            selectedGroup = listGroup[listGroup.indexWhere((element) => element.id==widget.userInformation.groups!.id)];

            status.value = FormzSubmissionStatus.success;
          },
        loading: (){
          status.value = FormzSubmissionStatus.inProgress;
        }));
    name.text = widget.userInformation.name.toString();
    surname.text = widget.userInformation.surname.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MainBloc>.value(
        value: widget.bloc,
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {

          },
          builder: (context, state) {

              return ValueListenableBuilder(
                valueListenable: status,
                builder: (context,p0,p1) {
                  if(status.value.isInProgress){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(status.value.isSuccess){
                    return SafeArea(
                      child: Column(
                        children: [
                          TextField(
                            controller: name,
                            decoration: const InputDecoration(
                                hintText: 'name'
                            ),
                          ),
                          TextField(
                            controller: surname,
                            decoration: const InputDecoration(
                                hintText: 'surname'
                            ),
                          ),
                          TextField(
                            controller: oldPassword,
                            decoration: const InputDecoration(
                                hintText: 'oldPassword'
                            ),
                          ),
                          TextField(
                            controller: password,
                            decoration: const InputDecoration(
                                hintText: 'password'
                            ),
                          ),
                          DropdownButton(
                              value: selectedGroup,
                              onChanged: (v){
                                setState(() {
                                  selectedGroup = v!;
                                });
                              },
                              items: listGroup.map((e) {
                                return DropdownMenuItem(value: e, child: Text(e.name.toString()));
                              }).toList(),
                          ),
                          CupertinoButton(onPressed: (){
                            widget.bloc.add(GetStatusByGroupIdEvent(success: (statuses){
                              Navigator.pop(context);
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(25),
                                    topStart: Radius.circular(25),
                                  ),
                                ),
                                context: context,
                                builder: (context) => BottomSheet(onClosing: (){

                                }, builder: (context) => SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height /2),
                                    child: ListView.builder(itemCount: statuses.length, itemBuilder: (context, index) => ListTile(
                                        onTap: (){
                                          UpdateUserData user = UpdateUserData(
                                              name: name.text.trim(),
                                              surname: surname.text.trim(),
                                              password: password.text.trim(),
                                              groupsId: selectedGroup.id,
                                              oldPassword: oldPassword.text.trim(),
                                              statusId: statuses[index].id
                                          );
                                          if(name.text.trim().isEmpty || surname.text.trim().isEmpty || oldPassword.text.trim().isEmpty){
                                            if(oldPassword.text.trim().isEmpty){
                                              AppFunctions.showAlertError('Old password is empty!', context);
                                            }else if(name.text.trim().isEmpty){
                                              AppFunctions.showAlertError('Name is empty!', context);
                                            }else if(surname.text.trim().isEmpty){
                                              AppFunctions.showAlertError('Surname is empty!', context);
                                            }
                                          }else{
                                              widget.bloc.add(UpdateUserInformationEvent(
                                                  userData: user,
                                                  loading: (){
                                                    AppFunctions.showLoading(context);
                                                  },
                                                  error: (error){ AppFunctions.handleErrorFromResponse(error, context); },
                                                  success: (success){
                                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(),), (route) => false);
                                                  }
                                              ));

                                          }
                                        }, title: Text(statuses[index].name.toString()))),
                                  ),
                                ),),);
                            }, error: (error){
                              AppFunctions.handleErrorFromResponse(error, context);
                            }, loading: (){
                              AppFunctions.showLoading(context);
                            }, id: selectedGroup?.id!.toInt()??-1));
                          }, child: const Text('Save change'))
                        ],
                      ),
                    );
                  }else{
                    return const Center(
                      child: Text('Something went wrong !'),
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
