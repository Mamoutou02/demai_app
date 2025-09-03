import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:demai_app/data/data.dart'; // Assure-toi que contentsList est défini ici

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController? _controller;
  int currentIndex = 0;
  double percentage = 0.25;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentsList[currentIndex].backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Contenu des pages
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _controller,
                itemCount: contentsList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    percentage = (index + 1) / contentsList.length;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contentsList[index].title,
                              style: const TextStyle(
                                fontFamily: "SF-Pro",
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              contentsList[index].discription,
                              style: const TextStyle(
                                fontFamily: "SF-Pro",
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(contentsList[index].image),
                    ],
                  );
                },
              ),
            ),

            // Indicateurs + boutons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dots + Skip
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(
                            contentsList.length,
                            (index) => buildDot(index),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CupertinoButton(
                          onPressed: () {
                            _controller!.animateToPage(
                              contentsList.length - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              currentIndex = contentsList.length - 1;
                              percentage = 1.0;
                            });
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.white70),

                          ),
                        ),
                      ],
                    ),

                    // Next / Check
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (currentIndex == contentsList.length - 1) {
                          Navigator.pushReplacementNamed(context, "/connexion");
                        } else {
                          _controller!.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: CircularProgressIndicator(
                              value: percentage,
                              backgroundColor: Colors.white38,
                              valueColor:
                                  const AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              currentIndex == contentsList.length - 1
                                  ? Icons.check
                                  : Icons.arrow_forward_ios_outlined,
                              color: contentsList[currentIndex].backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 8,
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Colors.white38,
      ),
    );
  }
}
