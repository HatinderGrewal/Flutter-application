import 'package:flutter/material.dart';
import 'package:flutter_firebase/app_constants.dart';
import 'package:flutter_firebase/firebase_client.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isObscure=true,loading=false;
  String emailErrorMsg='',passErrorMsg='',result='';

  void removeFocus(){
    if(emailFocusNode.hasFocus){
      emailFocusNode.unfocus();
    }else if(passwordFocusNode.hasFocus){
      passwordFocusNode.unfocus();
    }
  }

  bool validateEmail(){
    if(emailController.text.isEmpty){
      emailErrorMsg='Email is required';
    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)){
      emailErrorMsg='Invalid email address';
    }else {
      emailErrorMsg='';
    }
    return emailErrorMsg.isEmpty;
  }

  bool validatePass(){
    if(passwordController.text.isEmpty){
      passErrorMsg='Password is required';
    }else if(passwordController.text.length<6){
      passErrorMsg='Password must be 6+ digits';
    }else {
      passErrorMsg='';
    }
    return passErrorMsg.isEmpty;
  }

  void loginMethod()async{
    removeFocus();
    if(validateEmail() & validatePass()){
      loading = !loading;
      setState(() {});
      result = await FirebaseClient().loginAccount(email: emailController.text.trim(), password: passwordController.text);
      loading = !loading;
      setState(() {});
      if(result == 'Login SuccessFully'){
        Navigator.pushNamedAndRemoveUntil(context, kHomeScreenRoute, (route) => false);
      }
    }else{
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: removeFocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('My Flutter App',style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text('Hatinder Singh',style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              TextField(
                enabled: !loading,
                focusNode: emailFocusNode,
                controller: emailController,
                textAlign: TextAlign.center,
                maxLines: 1,
                onChanged: (text){
                  setState(() {
                    validateEmail();
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Email",
                  suffixIcon: Icon(Icons.person,color: Colors.grey,),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 2.0, color: Colors.blueGrey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 2.0, color: Colors.black26)),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
              Visibility(
                visible: emailErrorMsg.isNotEmpty,
                child: Text(emailErrorMsg,style: const TextStyle(color: Colors.blue),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  enabled: !loading,
                  focusNode: passwordFocusNode,
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  obscureText: isObscure,
                  onChanged: (text){
                    setState(() {
                      validatePass();
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          isObscure=!isObscure;
                        });
                      },
                      child: Icon(isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.grey,),
                    ),
                    hintText: "Password",
                    focusedBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.blueGrey)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.black26)),
                    border: const OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: passErrorMsg.isNotEmpty,
                child: Text(passErrorMsg,style: const TextStyle(color: Colors.red),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(onPressed:!loading ? loginMethod : null, child: const Text('SingIn')),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('Don\'t have an account.?'),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, kSignUpScreenRoute);
                },
                child: const Text('SignUp Here',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                ),
              ),
              Visibility(
                visible: loading,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Loading ...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: result.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(result,style: const TextStyle(color: Colors.blue,fontSize: 20.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
