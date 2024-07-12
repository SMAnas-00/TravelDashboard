import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
// import 'package:stats/Screens/dashboard.dart';
import 'package:stats/provider/login_auth_provider.dart';
import 'package:stats/utils/colors.dart';
// import 'package:stats/utils/notification.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();
  // bool _obsurePassText = true;
  @override
  Widget build(BuildContext context) {
    // var companyname = "Supernet E-Solutions";
    final width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      // backgroundColor: AppColor.base,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.40,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width*0.2,vertical: MediaQuery.of(context).size.height*0.1),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/pie-chart.png'),
                          fit: BoxFit.contain
                        )
                      ),
                    )),
                  ),
                  // Positioned(
                  //   height: 400,
                  //   width: width+20,
                  //   child: FadeInUp(duration: Duration(milliseconds: 1000), child: Container(
                  //     child: Text("Stats"),
                  //   )),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1500), child: const Text("Login", style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 30),)),
                  const SizedBox(height: 30,),
                  FadeInUp(duration: const Duration(milliseconds: 1700), child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: AppColor.grey,
                      border: Border.all(color: AppColor.grey),
                      boxShadow:  [
                        BoxShadow(
                          color: AppColor.cardbg.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: AppColor.textdash
                            ))
                          ),
                          child: TextFormField(
                            controller: _emailcontroller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: AppColor.textdash)
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _passwordcontroller,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: AppColor.textdash)
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  const SizedBox(height: 20),
                  FadeInUp(duration: const Duration(milliseconds: 1700), child: Center(child: TextButton(onPressed: () {}, child: const Text("Forgot Password?", style: TextStyle(color: AppColor.textdash),)))),
                  const SizedBox(height: 30),
                  FadeInUp(duration: const Duration(milliseconds: 1900), child: MaterialButton(
                    onPressed: () async {
                      // print("1. Login Button Pressed");                     
                          await authProvider.login(
                            context,
                            _emailcontroller.text,
                            _passwordcontroller.text,
                          );
                        
                      
                      // if (_emailcontroller.text.toString().trim() == "admin" && _passwordcontroller.text.toString().trim() == "admin123") {
                      //   MyNotification.success(context, 'Login Successful');
                      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                      // } else {
                      //   MyNotification.error(context, 'Login Failed');
                      // }
                    },
                    color: AppColor.button1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text("Login", style: TextStyle(color: AppColor.black,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  )),
                  const SizedBox(height: 40),
                  FadeInUp(duration: const Duration(milliseconds: 2000), child: const Center(child: Text("A Product of SES", style: TextStyle(color: AppColor.textdash),))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}