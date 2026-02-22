import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/common/social_icon_container_widget.dart';

class SocialLoginIcons extends StatelessWidget {
  const SocialLoginIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialIconContainerWidget(
          icon: AppAssets.googleIcon,
        ),
        SocialIconContainerWidget(
          icon: AppAssets.appleIcon,
        ),
        SocialIconContainerWidget(
          icon: AppAssets.facebookIcon,
        ),
      ],
    );
  }
}