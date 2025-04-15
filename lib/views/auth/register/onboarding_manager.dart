import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingManager extends StatefulWidget {
  const OnboardingManager({super.key});

  @override
  State<OnboardingManager> createState() => _OnboardingManagerState();
}

class _OnboardingManagerState extends State<OnboardingManager> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "icon": "visibility",
      "title": "Boostez votre présence en ligne",
      "description":
          "Créez gratuitement la vitrine de votre restaurant. Soyez visible auprès des utilisateurs qui recherchent un établissement comme le vôtre, au bon endroit et au bon moment."
    },
    {
      "icon": "event_seat",
      "title": "Remplissez plus facilement votre salle",
      "description":
          "Augmentez votre taux de réservation grâce à une meilleure exposition locale. Attirez plus de clients, même en dehors des heures de pointe, avec une page dédiée à votre restaurant."
    },
    {
      "icon": "add_circle_outline",
      "title": "Mettez en avant vos offres et événements",
      "description":
          "Créez des stories pour promouvoir vos événements, menus du jour ou offres spéciales. Informez vos clients en temps réel et donnez-leur envie de revenir."
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, "/login/manager");
    }
  }

  Widget _buildPage(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAsset.getSvg(data["icon"]!),
          width: 64,
          height: 64,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          data["title"]!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data["description"]!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 12 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: _buildPage(_onboardingData[index])),
              ),
            ),
            const SizedBox(height: 16),
            _buildDots(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: SecondaryButton(
                  label: _currentPage == _onboardingData.length - 1
                      ? "Commencer"
                      : "Suivant",
                  onPressed: _nextPage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
