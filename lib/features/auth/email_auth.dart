import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasap/colors.dart';
final _firebase = FirebaseAuth.instance;

class EmailAuth extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EmailAuthState();
  }
}

class _EmailAuthState extends State<EmailAuth>{
  var _isLogin = false;
  final _form = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';


  void _submit() async {
    _form.currentState!.validate();
    _form.currentState! .save();
    if(!_isLogin){
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: _enteredEmail,
         password: _enteredPassword);
      print(userCredentials.user!.uid);
    }else{
      final userCredentials = await _firebase.signInWithEmailAndPassword(
        email: _enteredEmail, 
        password: _enteredPassword);
      print(userCredentials.user!.uid);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/emailAuth.jpg")
                  ),
              ),
              child: Image.asset("assets/emailAuth.jpg",fit: BoxFit.cover,),
            ),
            SizedBox(height: 100,),
            Card(
              elevation: 1,
              child: SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.75,
                        child: TextFormField(
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: _isLogin? "Enter Your Email" : "New Email",
                            filled: true,
                            fillColor: Colors.grey
                          ),
                          validator: (value) {
                            if(value == null){
                              return "Enter a valid email address";
                            }
                            if(value.trim().isEmpty || !value.contains("@")){
                              return "Enter a valid Address";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _enteredEmail=newValue!;
                          },
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.75,
                        child: TextFormField(
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: greyColor,
                            hintText: _isLogin?
                             "Enter Your Password" : "New Password"
                          ),
                          validator: (value) {
                            if(value == null){
                              return "Enter a valid password";
                            }
                            if(value.trim().isEmpty 
                            || value.length<5){
                              return "Enter a valid password";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _enteredPassword = newValue!;
                          },
                        ),
                      ),
                      TextButton(onPressed: (){
                        setState(() {
                          _isLogin=!_isLogin;
                        });
                      }, child: _isLogin? 
                      Text("Create a New Account") :
                       Text("already have an account")),
                      ElevatedButton(
                        onPressed: _submit,
                         child: _isLogin? Text("LogIn") : Text("Sign Up")
                         )
                    ],
                  )
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}