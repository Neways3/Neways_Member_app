import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  late String s1='Test1';
  late String s2='Test2';
  late String s3=s1+s2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [

          const Text('data'),

          Container(
            decoration: const BoxDecoration(),
            child: Text(s1+s2+s3),
          ),

          CircleAvatar(
            child: Container(
              height: 100,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: const Text('',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,),
              ),
            ),
          ),

          Wrap(
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  ),

                  Container(
                    height: 100,
                    width: 120,
                    decoration: const BoxDecoration(color: Colors.green),
                    child: Text(s1,style: const TextStyle(fontSize: 15,
                        fontWeight: FontWeight.w900,color: Colors.indigo
                    ),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.grey,
                    ),
                    child: const Column(
                      children: [
                      ],
                    ),
                  ),

                  Positioned(
                      child: Image.asset('name')
                  ),

                  Center(
                    child: CircleAvatar(
                      child: Image.asset('name'),
                    ),
                  ),

                ],
              )
            ],
          ),

          const Row(
            children: [
              Text("",style: TextStyle(
                color: Colors.green,fontSize: 14,fontWeight: FontWeight.bold,
              ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
