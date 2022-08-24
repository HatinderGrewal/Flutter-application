import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_client.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure=true,loading=false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();

  String emailErrorMsg='',
      passwordErrorMsg='',
      confirmPassErrorMsg='',result='';

  void removeFocus(){
    if(emailFocus.hasFocus){
      emailFocus.unfocus();
    }else if(passwordFocus.hasFocus){
      passwordFocus.unfocus();
    }else if(confirmPassFocus.hasFocus){
      confirmPassFocus.unfocus();
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

  bool validatePassword(){
    if(passwordController.text.isEmpty){
      passwordErrorMsg = 'Password is required';
    }else if(passwordController.text.length<6){
      passwordErrorMsg = 'Password must be 6+ digits';
    }else{
      passwordErrorMsg = '';
    }
    return passwordErrorMsg.isEmpty;
  }

  bool validateConfirmPass(){
    if(confirmPassController.text.isEmpty){
      confirmPassErrorMsg = 'Confirm Password is required';
    }else if(passwordController.text != confirmPassController.text){
      confirmPassErrorMsg = 'Password and confirm password are not same';
    }else{
      confirmPassErrorMsg = '';
    }
    return confirmPassErrorMsg.isEmpty;
  }

  void signUpMethod()async{
    removeFocus();
    if(validateEmail() & validatePassword() & validateConfirmPass()){
      loading = !loading;
      setState(() {});
      result = await FirebaseClient().createAnAccount(email: emailController.text.trim(), password: passwordController.text);
      loading = !loading;
      setState(() {});
      if(result == 'User Created SuccessFully'){
        Navigator.of(context).pop();
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
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Firebase Auth App',style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text('Sign Up Page',style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              TextField(
                focusNode: emailFocus,
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
                  focusNode: passwordFocus,
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  obscureText: isObscure,
                  maxLines: 1,
                  onChanged: (text){
                    setState(() {
                      validatePassword();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          isObscure=!isObscure;
                        });
                      },
                      child: Icon(isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.grey,),),
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
                visible: passwordErrorMsg.isNotEmpty,
                child: Text(passwordErrorMsg,style: const TextStyle(color: Colors.blue),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  focusNode: confirmPassFocus,
                  controller: confirmPassController,
                  textAlign: TextAlign.center,
                  obscureText: isObscure,
                  maxLines: 1,
                  onChanged: (text){
                    setState(() {
                      validateConfirmPass();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          isObscure=!isObscure;
                        });
                      },
                      child: Icon(isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.grey,),),
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
                visible: confirmPassErrorMsg.isNotEmpty,
                child: Text(confirmPassErrorMsg,style: const TextStyle(color: Colors.blue),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: !loading ? signUpMethod : null,
                  child: const Text('Sign Up'),
                ),
              ),
              const Text('Already have an account.?'),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Text('SingIn',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
