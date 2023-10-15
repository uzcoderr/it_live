import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';

class AppFunctions{
  AppFunctions._();

  static GlobalKey loadingAlertKey = GlobalKey();
  static GlobalKey errorAlertKey = GlobalKey();
  static GlobalKey infoAlertKey = GlobalKey();

  static  showAlertError(String description,BuildContext context,{bool? isSkip = false,VoidCallback? onSkip = nullFunction,String skipMessage = 'null'}){
    showDialog(context: context, builder: (context) => AlertDialog(actions: [ isSkip! ? CupertinoButton(
        onPressed: (){
          onSkip!();
        },
        child: Text(skipMessage)) : const SizedBox.shrink() ], key: errorAlertKey, title: const Text('Error'),content: Text(description??'')),);
  }

  static showInfoAlert(String description,BuildContext context,{bool? log = false}){
    if(!log!){
      if(loadingAlertKey.currentContext!=null || errorAlertKey.currentContext != null || infoAlertKey.currentWidget != null){
        Navigator.pop(context);
      }
    }
    if(description=='Ushbu savolga xato javob berdingiz'){
      showDialog(context: context, builder: (context) => AlertDialog(
        key: infoAlertKey,
        title: const Text('Info'),
        content: Text(description),
        backgroundColor: Colors.red,
      ),);
    }else{
      showDialog(context: context, builder: (context) => AlertDialog(
        key: infoAlertKey,
        title: const Text('Info'),
        content: Text(description),
        backgroundColor: Colors.green,
      ),);
    }
  }

  static showLoading(BuildContext context,{bool? log = false}){
    if(!log!){
      if(loadingAlertKey.currentContext!=null || errorAlertKey.currentContext != null || infoAlertKey.currentWidget != null){
        Navigator.pop(context);
      }
    }
    showDialog(context: context, builder: (context) => AlertDialog(key: loadingAlertKey, content: const CupertinoActivityIndicator(),),);
  }

  static handleErrorFromResponse(Failure error,BuildContext context,{bool isSkip = false,VoidCallback onSkip =  nullFunction,String skipMessage = 'null',bool? log = false}){
    if(!log!){
      if(loadingAlertKey.currentContext!=null || errorAlertKey.currentContext != null || infoAlertKey.currentWidget != null){
        Navigator.pop(context);
      }
    }
    if(error is ParsingFailure){
      showAlertError(error.errorMessage,context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }else if(error is DioFailure){
      showAlertError('Code error !',context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }else if(error is ParsingFailure){
      showAlertError(error.errorMessage,context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }else if(error is CacheFailure){
      showAlertError(error.errorMessage,context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }else if(error is ParsingException){
      showAlertError('Parsing exception',context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }else if(error is ServerFailure){
      showAlertError(error.errorMessage, context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }else {
      showAlertError(error.toString(), context,isSkip: isSkip,onSkip: onSkip,skipMessage: skipMessage);
    }
  }

  static Function nullFunction(){
    return (){};
  }
}