import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/common/common_text_form_field_widget.dart';

class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key, required this.hintText, this.prefixIcon, this.suffixIcon, this.controller, this.keyboardType = TextInputType.text,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return CommonTextFormFieldWidget(
      keyboardType: keyboardType,
      controller: controller,
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