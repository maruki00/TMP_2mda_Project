import 'package:flutter/material.dart';
import "package:ful_less_state/compenent/inputui.dart";
import "package:ful_less_state/compenent/bottonui.dart";
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      //appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            const Image(image: AssetImage("assets/main_lg.jpeg"),width:300,height: 300,),
            InputUI(
              hintText: "User Name", 
              ispassword: false,
              onChange : (value)=>print(value),
            ),
            InputUI(
              hintText: "Password",
              ispassword: true, 
              onChange: (value)=>print(value),
            ),
            BottonUI(
              text: "Login",
              onpress: ()=>{}, 
              color: Colors.blue.shade200,
            ),
            
            Container(
              width:          size.width*0.6,
              padding:        const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
              margin:         const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              child:          Row(
                                  children: const <Widget>[
                                    Text("You Don't Have Account ?",style: TextStyle( fontSize: 10,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.normal,
                                                                                    ),
                                    ),
                                    Text("  Sign Up",style: TextStyle(  fontSize: 14,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontStyle: FontStyle.normal,
                                                                    ),
                                    ),
                                  ],
                                ),
              decoration:     BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:        Colors.white10,
                border:       Border.all(
                  color:      Colors.grey,
                  width:      1,
                ),
              ), 
            ),

          ]
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(
      //  items: const <BottomNavigationBarItem>[
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",backgroundColor: Colors.amber),
      //  ],
      //  onTap: (index){
      //    print(index);
      //  },
      //),
    );
  }
}