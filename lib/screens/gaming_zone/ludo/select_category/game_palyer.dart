import 'package:flutter/material.dart';

import '../players/four_player.dart';
import '../players/two_player.dart';

class SelectPlayer extends StatelessWidget {
  const SelectPlayer({Key? key}) : super(key: key);

  // const SelectPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          const SizedBox(height: 40,),

          SizedBox(
            width:  MediaQuery.of(context).size.width / 1.2,
            height:  MediaQuery.of(context).size.height / 3,
            child: Image.asset(
              'assets/sn.png',
              // fit: BoxFit.cover,
            ),
          ),


          const SizedBox(height: 65,),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) =>  ComplainListScreen()
                          builder: (context) => FludoGame2()
                      ),
                    );
                  },
                  child: Container(
                      height: 50,
                      width:  MediaQuery.of(context).size.width / 2.3,
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
                          child: Text('Two Player'.toUpperCase(),style: const TextStyle(fontSize: 15,
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
                          builder: (context) => FludoGame4()
                      ),
                    );
                  },
                  child: Container(
                      height: 50,
                      width:  MediaQuery.of(context).size.width / 2.3,
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
                          child: Text('Four Player'.toUpperCase(),style: const TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,color: Colors.white,
                              fontFamily: 'CeraProBol'
                          ),
                          )
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
