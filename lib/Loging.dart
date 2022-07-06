import 'package:classapp/app/route.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/constants/image_constants.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/models/login_response_model.dart';
import 'package:classapp/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logingpage extends StatefulWidget {
  const Logingpage({ Key? key }) : super(key: key);

  @override
  State<Logingpage> createState() => _LogingpageState();
}

class _LogingpageState extends State<Logingpage> {
  final GlobalKey<FormState>_loginFormkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading =false ;
  bool isObscure =true;
 



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromARGB(255, 241, 232, 162),
        
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _loginFormkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                            
                      children: [
                        const SizedBox(height: 100,),
                        Image.asset(ImageConstants.appLogo,height: 200, width: 200,),
                        TextFormField(controller: phoneController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        validator: (String? value){
                          if (value ==null || value.length <10){
                            return "Please enter a valid Phone number.";
                          } else { 
                            return null;
                          }
                            
                        },
                        decoration:const InputDecoration(
                          hintText: "Phone number",
                          labelText: "Phone number",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Color.fromARGB(65, 245, 9, 9),)
                          ),
                          ),
                        ),
                            
                        TextFormField(controller: passwordController,
                        obscureText: isObscure,
                        validator: (String? value){
                          if (value == null|| value.length<8) {
                            return "Please enter your password.";
                          } else if(value.length<8) {
                            return "passsword must be greater than 8 characters.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration
                        (hintText: "Password",
                        labelText: "Password",
                        prefixIcon:const Icon(Icons.fingerprint),
                        border:const OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          child:const Icon(Icons.visibility),
                          onLongPressStart:(val) {
                            setState(() {
                              isObscure = false;
                            });
                          } ,
                          onLongPressEnd: (val){
                            setState(() {
                              isObscure = true;
                            });
                          },
                          ),
                  
                  
                        // suffixIcon: IconButton(onPressed: (){
                        //   setState(() {
                        //     isObscure =! isObscure;
                        //   });
                        // },
                        //  icon: Icon(
                        //    isObscure
                        //    ?Icons.remove_red_eye
                        //    :Icons.visibility_off,
                        //    ))
                        ),
                        ),
                        ElevatedButton(
                          onPressed: () async{
                            if (_loginFormkey.currentState!.validate()) {
                               setState(() {
                                    _isLoading = true;
                                  });
                              Authservices authservices = Authservices();
                             LoginResponseModel? response= await authservices.login(
                                phoneController.text, passwordController.text);
                                setState(() {
                                    _isLoading = false;
                                  });

                                if (response == null) {
                                 AppSnacks.showSnackBar(context,
                                  message: "No response from the server."); 
                                } else if (response.data !=null) {
                                 
                                  locator.get<SharedPreferences>().setString(AppConstants.token, response.data!);
                                  AppSnacks.showSnackBar(context,message: "rohan");
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //   content: Text("login is ${response.data}"),
                                  //   duration: Duration(seconds: 5),
                                  //   ));
                                    // Navigator.pushAndRemoveUntil(
                                    //   context, CupertinoPageRoute(builder: (context) => Homepage()), 
                                    //   (route) => false);
                                    Navigator.pushNamedAndRemoveUntil(context, AppRoute.homeRoute, (route) => false);
                                } else {
                                  // setState(() {
                                  //   _isLoading = false;
                                  // });
                                  AppSnacks.showSnackBar(context, message: "Invalid Credentials.");
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //    SnackBar(content: Text("please enter correct username and password ")));
                                }
                            }
                            }, child:const Text("Login"))
                      ]
                    
                    ),
                  ),
                ),
              ),

           if(_isLoading)
           const Center(
             child: CircularProgressIndicator(),
           )
            ],
          ),
      ),  
        
      );
    
  }
}