import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final data = onboardingData[index];

          return Stack(
            children: [
              /// Top Image
              SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  data['image']!,
                  fit: BoxFit.cover,
                ),
              ),

              /// Bottom Card
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.38,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            data['title']!,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            data['description']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),

                      /// Dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (dotIndex) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: currentIndex == dotIndex ? 20 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: currentIndex == dotIndex
                                    ? Colors.black
                                    : Colors.black26,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),

                      /// Buttons
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to Register
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6AA84F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Join the movement!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              // Navigate to Login
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
List<Map<String, String>> onboardingData = [
  {
    'title': 'Quality',
    'description': "Sell your farm fresh products directly to\nconsumers, cutting out the middleman and\nreducing emissions of the global supply chain.",
    'image': 'assets/images/onboarding1.png',
  },
  {
    'title': 'Convenient',
    'description': "Our team of delivery drivers will make sure\nyour orders are picked up on time and\npromptly delivered to your customers.",
    'image': 'assets/images/onboarding2.png',
  },
  {
    'title': 'Local',
    'description': "We love the earth and know you do too! Join us\nin reducing our local carbon footprint one order\nat a time. ",
    'image': 'assets/images/onboarding3.png',
  },
];