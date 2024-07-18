import 'package:flutter/material.dart';
import 'package:super_home_member/screens/gaming_zone/chess/off_line/gameBoard.dart';
import 'package:super_home_member/screens/gaming_zone/chess/on_line/online.dart';
import 'package:super_home_member/screens/gaming_zone/ludo/select_category/game_palyer.dart';
import 'package:super_home_member/screens/gaming_zone/ludo/select_category/online_ludo.dart';

// import '../chess/screens/game_screen.dart';

class ChessInitialScreen extends StatefulWidget {
  @override
  State<ChessInitialScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChessInitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 25,),

          SizedBox(
            width:  MediaQuery.of(context).size.width / 1,
            height:  MediaQuery.of(context).size.height / 2.5,
            child: Image.asset(
              'assets/cs.jpg',
              fit: BoxFit.cover,
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
                        builder: (context) => const BoardGame()
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
                          // fontFamily: 'CeraProBol'
                        ),
                        )
                    )
                ),
              ),

              const SizedBox(height: 10,),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const OnlineChess()),
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
                          // fontFamily: 'CeraProBol'
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
