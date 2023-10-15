import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/core/utils/my_functions.dart';
import 'package:itlivetest/feature/main/presentation/main_screen.dart';
import 'package:itlivetest/feature/register/presentation/manager/register_bloc.dart';

class VerifyEmailPage extends StatefulWidget {
  final RegisterBloc bloc;
  final String email;
  const VerifyEmailPage({super.key,required this.bloc,required this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {


  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterBloc>.value(
        value: widget.bloc,
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('OTP email verfication'),
                    TextField(
                      controller: code,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: true),
                      decoration: InputDecoration(
                        hintText: 'we sent code this email -> ${widget.email}'
                      ),
                    ),
                    CupertinoButton(child: const Text('check'), onPressed: (){
                      widget.bloc.add(VerifyUserEmailEvent(
                          success: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(),), (route) => false);
                          },
                          loading: (){ AppFunctions.showLoading(context); },
                          error: (error){
                            AppFunctions.handleErrorFromResponse(error, context);
                          },
                          obj: TwoObj(a: widget.email.toString(), b: int.parse(code.text))));
                    })
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
