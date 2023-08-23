import 'package:flutter/material.dart';
import 'package:test_trauxit/navigation.dart';
import 'package:test_trauxit/task_one/layout.dart';
class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Text(
                  "Login",
                  style:TextStyle(
                      color: Colors.black,
                      fontSize:40,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator:(value){
    if (value!.isEmpty) {
    return 'Please Enter Your Email';
    }
    return null;
                  },
                  controller: emailController,
                  decoration:const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onFieldSubmitted: (value)
                  {
                    print('Email :$value');
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator:(value){
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration:const InputDecoration(
                    labelText:'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted:(value)
                  {
                    print('Password : $value');
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.cyan,
                  height: 50,
                  child: MaterialButton(
                    onPressed:() {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                        navigateAndFinish(context, LayoutScreen());
                      }
                    },
                    child:const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ) ,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have account'),
                    TextButton(
                        onPressed:(){},
                        child:const Text('Register Now')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
