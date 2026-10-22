import 'package:dallini/check/utils.dart';
import 'package:dallini/constant/const_style.dart';
import 'package:dallini/screen/home_screen.dart';
import 'package:dallini/services/auth_service.dart';
import 'package:dallini/widget/form_text_field_class.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService=AuthService();
  TextEditingController emailController=TextEditingController();
    TextEditingController passController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    final _formKey=GlobalKey<FormState>();
bool hasaccount=true;
    bool obscure=false;
    @override
    void dispose(){
      emailController.dispose();
      passController.dispose();
      phoneController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            
            spacing: 20,
            children: [
              SizedBox(height: 50,),
              Image.asset('assets/images/logo.png',
              height: size.height/3,
              width: size.width,
              ),
              Form(
                key: _formKey,
                child:Column(
                  spacing: 20,
                  children: [
                    FormTextFieldClass(
                      label: 'email',
                      hint: 'email@domain.com',
                      preIcon: Icons.email,
                      controller: emailController,
                      validator: (value) 
                      {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                          }
                      if(!Utils.isValidEmail(value!)){
                        return 'Enter a valid email';
                      }
                      return null;
                      }
                      
                    ),
                    FormTextFieldClass(
                      label: 'password',
                      hint: '*******',
                      obscure: obscure,
                      preIcon: Icons.password,
                      suffIcon: InkWell(
                        onTap: () => setState(() {
                          obscure=!obscure;
                        }),
                        child: obscure?Icon(Icons.visibility):Icon(Icons.visibility_off),
                      ),
                      controller: passController,
                      
                      validator: (value) 
                      {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }

                      if (!Utils.isValidPassword(value)) {
                        if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }

                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter (A-Z)';
                      }

                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password must contain at least one lowercase letter (a-z)';
                      }

                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      }

                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Password must contain at least one special character (@#\$%)';
                      }
                      }
                      return null;
                    }
                    ),
                    if(!hasaccount)
                    
                      FormTextFieldClass(
                      label: 'phone',
                      hint: '078*****',
                      preIcon: Icons.phone,
                      controller: phoneController,
                      validator: (value) 
                      {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        if (!Utils.isValidPhone(value)) {
                          return 'Enter a valid phone number';
                        } 
                        return null;
                      }
                      
                    ),
                    
                  ],
                )
                ),
        
        
                SizedBox(
                  height: 50,
                  width: .infinity,
                  child: ElevatedButton(
                    style: ConstStyle.buttonStyle,
                    onPressed: ()async{
                      if(_formKey.currentState!.validate()){
                        if(!hasaccount){
                        String result=await authService.signUp(email: emailController.text.trim(),password: passController.text.trim(),phone: phoneController.text.trim(),context: context);

                        if(result=='done'){
                          setState(() {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                        }
                      } 
                      else {
                        String result=await authService.login(emailController.text.trim(), passController.text.trim());
                        if(result=='done'){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomeScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                        }
                      }
                      } 
                      
                      // String result=await AuthService.login(emailController.text, passController.text);
        
                    },
                    child: Text(hasaccount?'Login':'Sign Up',style: ConstStyle.textButtonStyle,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hasaccount?'Dont have an account! ':'Already have an account! ',style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),),
                    InkWell(
                      onTap: () {
                        setState(() {
                          hasaccount=!hasaccount;
                        });
                      },
                      child: Text(hasaccount?'Sign Up':'Login',style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}