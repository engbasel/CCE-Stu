import 'package:cce_app/Futures/Home/view/homeviwe.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const routeName = 'OnBoardingView';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome to CCE App',
      'subtitle': 'Stay Informed with the Latest Department News and Events',
      'image':
          'assets/images/onboarding1.png', // replace with actual image path
    },
    {
      'title': 'Track Your Courses',
      'subtitle': 'View your courses and academic progress',
      'image': 'assets/images/onboarding2.png',
    },
    {
      'title': 'Check Your GPA',
      'subtitle': 'Calculate and track your GPA easily',
      'image': 'assets/images/onboarding3.png',
    },
    {
      'title': 'Get Resources',
      'subtitle': 'Access study materials and resources quickly',
      'image': 'assets/images/onboarding4.png',
    },
    {
      'title': 'Let’s Get Started!',
      'subtitle': 'Log in to explore more features!',
      'image': 'assets/images/onboarding5.png',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacementNamed(context, HomeView.routeName);

      // Change to your login route
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnBoardingContent(
                  title: _onboardingData[index]['title']!,
                  subtitle: _onboardingData[index]['subtitle']!,
                  image: _onboardingData[index]['image']!,
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage < _onboardingData.length - 1)
                  TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    child: Text("Skip"),
                  ),
                Row(
                  children: List.generate(
                    _onboardingData.length,
                    (index) => _buildDot(index: index),
                  ),
                ),
                IconButton(
                  onPressed: _nextPage,
                  icon: Icon(
                    _currentPage == _onboardingData.length - 1
                        ? Icons.check
                        : Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnBoardingContent({
    required this.title,
    required this.subtitle,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
