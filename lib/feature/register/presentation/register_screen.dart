
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/models/register_user.dart';
import 'package:itlivetest/feature/register/presentation/manager/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlivetest/feature/register/presentation/pages/verify_email_page.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late RegisterBloc bloc;
  List<Group> listOfGroup = [];
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ValueNotifier<FormzSubmissionStatus> status = ValueNotifier(FormzSubmissionStatus.initial);
  late Group selectedGroup;

  @override
  void initState() {
    super.initState();
    bloc = RegisterBloc()..add(GetAllGroupsEvent(success: (success){
      listOfGroup.addAll(success);
      selectedGroup = listOfGroup[0];
      status.value = FormzSubmissionStatus.success;
    }, error: (error){
      AppFunctions.handleErrorFromResponse(error, context);
    }, loading: (){

    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterBloc>.value(
        value: bloc,
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if(state.status.isInProgress){
              AppFunctions.showLoading(context);
            }else if(state.status.isSuccess){
              // Navigator.push(context,MaterialPageRoute(builder: (context) => const Scaffold(body: Text('kot'),),));
            }
          },
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: status,
              builder: (context,p0,p1) {
                if(status.value.isSuccess){
                  return SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: Text('Register'),
                        ),
                        SliverToBoxAdapter(
                          child: TextField(
                            controller: name,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'name',
                                helperText: 'required'
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: TextField(
                            controller: surname,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'surname',
                                helperText: 'required'
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: TextField(
                            controller: email,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'email',
                                helperText: 'required'
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DropdownButton(
                            onChanged: (value){
                              setState(() {
                                selectedGroup = value!;
                              });
                            },
                            value: selectedGroup,
                            items: listOfGroup.map((e){
                              return DropdownMenuItem(value: e,child: Text(e.name.toString()),);
                            }).toList(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: password,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'password',
                                helperText: 'required'
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: CupertinoButton(
                            onPressed: (){
                              if(name.text.trim().isEmpty||surname.text.trim().isEmpty||email.text.trim().isEmpty||password.text.trim().isEmpty){
                                AppFunctions.showInfoAlert('check try again !', context,);
                              }else{

                                bloc.add(GetStatusByGroupIdEvent(success: (success){
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
                                        child: ListView.builder(itemCount: success.length, itemBuilder: (context, index) => ListTile(
                                          onTap: (){
                                            RegisterUser user = RegisterUser(
                                              name: name.text.trim(),
                                              surname: surname.text.trim(),
                                              email: email.text.trim(),
                                              password: password.text.trim(),
                                              status: success[index].id,
                                              group: selectedGroup.id!.toInt(),
                                            );
                                            bloc.add(RegisterUserEvent(
                                                user: user,
                                                loading: (){
                                                  AppFunctions.showLoading(context);
                                                },
                                                error: (error){ AppFunctions.handleErrorFromResponse(error, context); },
                                                success: (success){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyEmailPage(email: email.text,bloc: bloc),));
                                                }
                                            ));
                                          }, title: Text(success[index].name.toString()))),
                                      ),
                                    ),),);
                                }, error: (error){}, loading: (){
                                  // AppFunctions.showLoading(context);
                                }, id: selectedGroup.id!.toInt()));

                              }
                            },
                            child: const Text('Next'),
                          ),
                        )
                      ],
                    ),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              }
            );
          },
        )
      ),
    );
  }
}

class AppSnackBar extends SnackBar{
  const AppSnackBar({super.key, required super.content});


}