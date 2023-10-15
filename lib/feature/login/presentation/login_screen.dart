import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/login/presentation/manager/login_bloc.dart';
import 'package:itlivetest/feature/main/presentation/main_screen.dart';
import 'package:itlivetest/feature/register/presentation/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  late LoginBloc bloc;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    bloc = LoginBloc();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // if(state.status.isInProgress){
            //   AppFunctions.showLoading(context);
            // }else if(state.status.isSuccess){
            //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(),), (route) => false);
            // }else if(state.status.isFailure){
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('check and try again!')));
            // }
          },
          builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  const Expanded(
                  child: Center(
                    child: AutoSizeText(
                        'Login',
                      style: TextStyle(
                        fontFamily: 'DEF Bold',
                        fontSize: 50
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                                labelText: 'email',
                              helperText: 'required',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: password,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'password',
                                helperText: 'required',
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        CupertinoButton(
                          color: Colors.black,
                            child: const Text(
                            'Login',
                          style: TextStyle(
                            fontFamily: 'DEF',
                            color: Colors.white,
                          ),
                        ), onPressed: (){
                            if(email.text.trim().isEmpty||password.text.trim().isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('check and try again!')));
                            }else{
                              TwoObj obj = TwoObj(a: email.text, b: password.text);
                              bloc.add(GetLoginEvent(
                                  obj: obj,
                                loading: (){
                                    AppFunctions.showLoading(context);
                                },
                                  success: (s){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(),), (route) => false);
                                  },
                                onError: (error){
                                    Navigator.pop(context);
                                    AppFunctions.handleErrorFromResponse(error, context);
                                }
                              ));
                            }
                        }),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                        CupertinoButton(child: const Text('Register'),
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));})
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      );
  },
),
),
    );
  }
}
