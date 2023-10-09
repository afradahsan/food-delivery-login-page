import 'package:app/main.dart';
import 'package:app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernamecontroller = TextEditingController();
  final _passwordController = TextEditingController();
  final _Formkey = GlobalKey<FormState>();
  bool _isDataMatched = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _Formkey,
        
        // child: Positioned(
        //   top: 10,
        //   right: 10,
          
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              padding: EdgeInsets.all(20),
              
              child: Column(
                children: [
                  Image.asset('assets/images/burger-png-png-images-yellow-images-12.png', 
                  height: 162,
                  ),
                  Text("Log in for your Cravings!!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(        
                    controller: _usernamecontroller,           
                    decoration: InputDecoration(                      
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderSide: BorderSide( width: 5),
                      )
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Enter your Username';
                      }
                      else{
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Enter Password';
                      }
                      else{
                        return null;
                      }
                    },
                  ),

                  Visibility(
                    visible: !_isDataMatched,
                    child: Text("Username and Password doesn't match" , style: TextStyle(
                      color: Colors.red, fontFamily: 'Poppins'
                    ),),
                  ),

                  ElevatedButton(onPressed: (){
                    if(_Formkey.currentState!.validate()){
                    checkUsername(context);
                  }else{
                    print("Data Empty");
                  }
                  }, 
                  child: Text("Log In" ,style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500
                  ,fontSize: 18),)),
                ],
              ),
              
            ),
          ],
        ),
            ),
          ),
          
        ),
        
        // ),
      ),
    );
  }

void checkUsername(BuildContext ctx) async{

  final usern = _usernamecontroller.text;
  final pass = _passwordController.text;


  if(usern=='Afrad' && pass=='Afrad@123'){

  final _sharedpref = await SharedPreferences.getInstance();
  await _sharedpref.setBool(SAVE_KEY, true);

    print(null);
    setState(() {
      _isDataMatched = true;
    });
    print('Proceed');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => HomePage(),),);
  }
  else{
    print('Username and Password not match');
    setState(() {
      _isDataMatched = false;
    });
    print('Not Match');
  }
}
}