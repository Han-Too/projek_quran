import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../data/models/quotes.dart';
import '../controllers/quote_screen_controller.dart';

class QuoteScreenView extends StatefulWidget {
  const QuoteScreenView({Key? key}) : super(key: key);

  @override
  State<QuoteScreenView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<QuoteScreenView> {
  var size, height, width;
  Quotes? data;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlue,
        centerTitle: true,
        title: const Text(" Random Quotes"),
      ),
      body: RefreshIndicator(
        onRefresh: getQuotes,
        child: ListView(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(18.0),
            //   child: Text(
            //     "Pull to Refresh",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: width / 2,
              child: Card(
                margin: const EdgeInsets.only(top: 20),
                color: const Color(0XFFeeeeee),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data?.content ??
                            "Don't Look Back, Just Look At The Person Beside You And Move Forward",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data?.author ?? "Developer ❤️",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                          child: const Text("Generate New Quotes"),
                          onPressed: () {
                            print("icon refresh");
                            getQuotes();
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getQuotes() async {
    data = await QuoteScreenController.getQuotes();
    setState(() {});
  }
}
