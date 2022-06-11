import 'package:flutter/material.dart';
import 'package:innocart/main.dart';
import 'package:innocart/signup/see.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title, required this.onTouched}) : super(key: key);
  final Function onTouched;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpState();
}
class _SignUpState extends State<SignUpPage> {
  bool checked = false;
  bool customer = true;
  String email = "",password = "";
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height, width = size.width;
    Color buttonsColor1 = Color(0xffc3c3d3);
    Color buttonsColor2 = Color(0xff3b42f0);
    Widget o = See(onClick: (){setState((){
      showPassword = ! showPassword;
      });
    });
    return Scaffold(

          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column (children: <Widget>[
                Container(
                    width: width,
                    height: height * 0.23,
                    decoration: const BoxDecoration(
                      color : Color.fromRGBO(137, 141, 247, 1),
                    ),
                    child: Image.asset("assets/images/logo.png")
                ),
                const SizedBox(height: 20),
                SizedBox(width: 0.8 * width,height: 0.75 * height,child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sign up', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Manjari',
                        fontSize: 25,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    Row(children:  [
                      const Text('Already have an account?', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Manjari',
                          fontSize: 14,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                      TextButton(onPressed: () {
                        super.widget.onTouched();
                  }, child: Text("Log in"))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center , children: [
                      TextButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(0.38 * width,0.03 * height)),
                          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  Color current = customer?buttonsColor2:buttonsColor1;
                              if (states.contains(MaterialState.hovered))
                                return current.withOpacity(0.7);
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed))
                                return current.withOpacity(0.6);
                              return current; // Defer to the widget's default.
                            },
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          setState((){
                            customer = true;
                          });
                        },
                        child: Text('Customer'),
                      ),SizedBox(width: width * 0.03),
                      TextButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(0.38 * width,0.03 * height)),
                          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  Color current = customer?buttonsColor1:buttonsColor2;
                                  if (states.contains(MaterialState.hovered))
                                    return current.withOpacity(0.7);
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed))
                                    return current.withOpacity(0.6);
                                  return current; // Defer to the widget's default.
                                },
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          setState((){
                            customer = false;
                          });
                        },
                        child: Text('Angel'),
                      )
                    ],),
                    SizedBox(height:20),
                    TextField(
                      obscureText: false,
                      onChanged: (String value) async{

                        setState((){
                          password = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),SizedBox(height:20),
                    TextField(
                      obscureText: false,
                      onChanged: (String value) async{

                        setState((){
                          password = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Email',

                      ),
                    ),SizedBox(height:20),
                    TextField(
                      obscureText:false,
                      onChanged: (String value) async{

                        setState((){
                          password = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                    ),SizedBox(height:20),
                    TextField(

                      obscureText: !showPassword,
                      onChanged: (String value) async{

                        setState((){
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: o,
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),SizedBox(height:20),
                    Row(children: [Checkbox(
                      checkColor: Colors.white,
                      value: checked,
                      onChanged: (bool? value) {
                        setState(() {
                          checked = value!;
                        });
                      },
                    ),
                      Text('I agree on the terms of use', textAlign: TextAlign.left, style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Manjari',
                          fontSize: 14,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                    ]
                    )
                    ,SizedBox(height:20),
                    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      TextButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(300,50)),
                          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  Color current = buttonsColor2;
                                  if (states.contains(MaterialState.hovered))
                                    return current.withOpacity(0.7);
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed))
                                    return current.withOpacity(0.6);
                                  return current; // Defer to the widget's default.
                                },
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () { },
                        child: Text('Sign up'),
                      )
                    ],)

                  ],


                )
                  ,)
                ,

    ]
          ))

    );
  }
}
