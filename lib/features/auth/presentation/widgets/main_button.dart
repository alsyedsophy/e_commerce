import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  const MainButton({
    super.key,
    required this.state,
    required this.onPressed,
    required this.title,
  });

  final AuthState state;
  final String title;
  final void Function()? onPressed;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.state is AuthLoading ? null : widget.onPressed,
      child: widget.state is AuthLoading
          ? CircularProgressIndicator()
          : Text(widget.title, style: AppTextStyle.textMainButtomStyle),
    );
  }
}
