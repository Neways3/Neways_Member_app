import 'package:flutter/material.dart';
import 'package:super_home_member/screens/gaming_zone/ludo/select_category/game_palyer.dart';
import 'package:super_home_member/screens/gaming_zone/ludo/select_category/online_ludo.dart';

class InitialScreen extends StatefulWidget {
  @override
  State<InitialScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 40,),

          SizedBox(
            width:  MediaQuery.of(context).size.width / 1,
            height:  MediaQuery.of(context).size.height / 2.9,
            child: Image.asset(
              'assets/sn.png',
              // fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 45,),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) =>  ComplainListScreen()
                        builder: (context) => const SelectPlayer()
                    ),
                  );
                },
                child: Container(
                    height: 50,
                    width:  MediaQuery.of(context).size.width / 2,
                    // margin: defaultPaddingEdge,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),

                      ),
                    ),
                    child: Center(
                        child: Text('Off Line'.toUpperCase(),style: const TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold,color: Colors.white,
                            fontFamily: 'CeraProBol'
                        ),
                      )
                    )
                 ),
              ),

              const SizedBox(height: 10,),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) =>  ComplainListScreen()
                        builder: (context) => const OnlineLudo()
                    ),
                  );
                },
                child: Container(
                    height: 50,
                    width:  MediaQuery.of(context).size.width / 2,
                    // margin: defaultPaddingEdge,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: Text('On Line'.toUpperCase(),style: const TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold,color: Colors.white,
                            fontFamily: 'CeraProBol'
                      ),
                    )
                  )
                ),
              ),
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
