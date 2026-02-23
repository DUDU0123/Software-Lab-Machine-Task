import 'package:machine_task_app/controller/onboarding_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/onboarding/onbarding_page_data_container.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: AppCommonMethods.onboardingData.length,
        onPageChanged: (index) {
          Get.find<OnboardingController>().updateIndex(index: index);
        },
        itemBuilder: (context, index) {
          final data = AppCommonMethods.onboardingData[index];

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  color: data['color'],
                ),
                /// Top Image
                Positioned(
                  top: 32.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        data['image']!,
                        fit: BoxFit.cover,
                      ),
                      AppConstraints.kHeight19,
                    ],
                  ),
                ),
            
                /// Bottom Card
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: OnboardingPageDataContainer(data: data),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

