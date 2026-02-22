import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/common/common_text_form_field_widget.dart';

class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key, required this.hintText, required this.prefixIcon, this.suffixIcon,
  });
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.kTransparent),
      ),
      filled: true,
      fillColor: AppColors.kGrey.withAlpha(60),
      prefixWidget: prefixIcon,
      hintText: hintText,
      suffixIcon: suffixIcon
    );
  }
}