import 'package:flutter/material.dart';
class AuthForm extends StatefulWidget {
  //const AuthForm(void Function(String email, String password, String username, bool isLogin, BuildContext ctx) submitAuthForm, {Key? key,required this.submitFn}) : super(key: key);

  final void Function(
      String email,
      String password,
      String userName,
      bool isLogin,
      BuildContext ctx)
  submitFn;

  const AuthForm(this.submitFn);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey= GlobalKey<FormState>();
  var _isLogin= true;
  var _userEmail='';
  var _userName='';
  var _userPassword='';


  void _trySubmit(){
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(isValid){
      _formKey.currentState?.save();
       widget.submitFn(
         _userEmail,  _userPassword, _userName,  _isLogin, context
       );
      // use these values to send our auth request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child:Column(
                    mainAxisSize:MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        key: ValueKey('email'),
                        validator: (value){
                          if(value!.isEmpty || !value.contains('@')){
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'email'),
                        onSaved: (value){
                          _userEmail= value!;
                        },
                      ),
                      if(!_isLogin)
                      TextFormField(
                        key: ValueKey('username'),
                        validator: (value){
                          if(value!.isEmpty || value.length< 4){
                            return 'username should be atleast 5 letters';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: 'username'
                      ),
                        onSaved: (value){
                          _userName= value!;
                        },),
                      TextFormField(
                        key: ValueKey('password'),
                        validator: (value){
                          if(value!.isEmpty || value.length< 7){
                            return 'Password must be greater than 7 characters';
                          }
                          return null;
                        },
                       keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'password'),
                        obscureText: true,
                        onSaved: (value){
                          _userPassword = value!;
                        },
                      ),
                      SizedBox(height: 12,),
                      ElevatedButton(onPressed:_trySubmit, child: Text(_isLogin? 'Login': 'Sign Up')),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          _isLogin =!_isLogin;
                        });
                      }, child: Text(_isLogin ? 'Create new account' : 'I already have an account'))
                      
                    ],
                  ) ,
                )))));
  }
}
