import 'package:flutter/material.dart';

class TopUp extends StatelessWidget {
  TopUp({Key? key}) : super(key: key);

  final List<String> buttons = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    ".",
    "0",
    "<",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC0028B),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        'MoneyApp',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.38,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 11,
                      child: IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 1)
                  ],
                ),
              ),
              const SizedBox(height: 93),
              const Text(
                "How much?",
                style: TextStyle(
                  fontSize: 25,
                  height: 0.88,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 80),
              RichText(
                text: const TextSpan(
                  text: '£',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                      text: '100',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '.00',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 300,
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return ButtonTheme(
                      minWidth: 110,
                      height: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          buttons[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 200,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 60),
                      primary: Color.fromARGB(255, 194, 60, 172)),
                  onPressed: () {},
                  child: Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
