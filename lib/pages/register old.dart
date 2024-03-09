
import 'package:ex_yt_login/pages/home old.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "REGISTRATION FORM",
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    debugShowCheckedModeBanner: false,
    home: regi(),
  ));
}
class regi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return regiState();
  }

}
class regiState extends State<regi>{
  var _myregikey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _myregikey,
            child:Column(
              children:<Widget>[
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      validator:(String? msg){
                        if(msg!.isEmpty){
                          return "Please enter name";
                        }
                        if(msg!.length<3){
                          return "name should contain more than 3 characters";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "NAME",
                          hintText: "Enter Name",
                          prefixIcon: Icon(Icons.abc),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      validator:(String? msg){
                        if(msg!.isEmpty){
                          return "Enter your gender";
                        }
                        if(msg!.length<3){
                          return "Gender cant be less then 3 characters ";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "GENDER",
                          hintText: "Enter Gender",
                          prefixIcon: Icon(Icons.transgender_outlined),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      validator:(String? msg){
                        if(msg!.isEmpty){
                          return "Please enter city";
                        }
                        if(msg!.contains(r'^[_\-=@,\.;*!%]+$')){
                          return "city should contain text only";}
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "CITY",
                          hintText: "Enter City Name",
                          prefixIcon: Icon(Icons.location_city),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      validator:(String? msg){
                        if(msg!.isEmpty){
                          return "Please enter Contact No";
                        }
                        if(msg!.length<10){
                          return "Contact number must be of 10 digits";}
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "CONTACT",
                          hintText: "Enter Contact Number",
                          prefixIcon: Icon(Icons.phone),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.number,
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      validator:(String? msg){
                        String pattern=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp yoo=RegExp(pattern);
                        if(msg!.isEmpty){
                          return "Please enter city";
                        }
                        if(!yoo.hasMatch(msg!)){
                          return "Enter valid Email id";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "EMAIL",
                          hintText: "Enter Email ID",
                          prefixIcon: Icon(Icons.email),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.emailAddress,
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      validator:(String? msg){
                        if(msg!.isEmpty){
                          return "Create user id";
                        }
                        if(msg!.length<3){
                          return "user id should contain more than 3 characters";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "USER ID",
                          hintText: "Create User ID",
                          prefixIcon: Icon(Icons.person),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child:TextFormField(
                      obscureText: true,
                      validator:(String? msg){
                        if(msg!.isEmpty){
                          return "Create Password";
                        }
                        if(msg!.length<3){
                          return " Password should contain more than 3 characters";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                          labelText: "PASSWORD",
                          hintText: "Create Password",
                          prefixIcon: Icon(Icons.lock),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    )
                ),
                Padding(
                  padding:EdgeInsets.all(10.0),
                  child:Container(
                    height:50,
                    width: 550,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius:BorderRadius.circular(5.0)
                    ),
                    child:TextButton(onPressed:(){
                      if(_myregikey.currentState!.validate()){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context)=>home()
                            )
                        );
                      }
                    },
                      child: Center(
                        child: Text("REGISTER ME",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}