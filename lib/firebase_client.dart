import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient{

  FirebaseClient._internalConstructor();
  static final FirebaseClient _instance = FirebaseClient._internalConstructor();

  factory FirebaseClient(){
    return _instance;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> createAnAccount({required String email,required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return 'User Created SuccessFully';
    } on FirebaseException catch(exc) {
      return exc.code;
    }
  }

  Future<String> loginAccount({required String email,required String password})async{
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Login SuccessFully';
    } on FirebaseException catch (exc) {
      return exc.code;
    }
  }

}