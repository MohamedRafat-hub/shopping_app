import 'package:cartzy_app/features/auth/presentation/views/login_and_signup_view.dart';
import 'package:cartzy_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: const [
                  BuildPage(
                    image: 'assets/images/onboarding1.png',
                    title: 'Discover Trends',
                    decribtion:
                        'Now we are here to provide variety of the best fashion',
                  ),
                  BuildPage(
                    image: 'assets/images/onboarding2.png',
                    title: 'Latest out fit',
                    decribtion:
                        'Express your self through the art of the fashionism',
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MaterialButton(
                height: 48,
                minWidth: double.infinity,
                color: Colors.black,
                onPressed: () {
                  if (currentPage < 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginAndSignup();
                      }),
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  currentPage == 1 ? 'Get Started' : 'Next',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.image,
    required this.title,
    required this.decribtion,
  });

  final String image;
  final String title;
  final String decribtion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1F1F1F),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            decribtion,
            style: const TextStyle(
              color: Color(0xFF5C5C5C),
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
