import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/widgets/ask_have_account.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_forget_password.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_form_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/main_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/sucial_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().loginWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }

  void _submitGoogle() => context.read<AuthCubit>().loginWithGoogle();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is AuthAuthenticated) {
          context.pushNamed(AppRouts.homeScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.horPadding_23,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppDimens.h_123.h),
                  Text(AppConstants.signin, style: AppTextStyle.largStyle),
                  Gap(AppDimens.h_32.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        LoginFormField(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        Gap(AppDimens.h_20.h),
                        MainButton(
                          state: state,
                          title: AppConstants.continueText,
                          onPressed: _submitForm,
                        ),
                      ],
                    ),
                  ),
                  CustomForgetPassword(),
                  Gap(AppDimens.h_56.h),
                  SocialButton(onPressed: _submitGoogle),
                  Gap(AppDimens.h_35.h),
                  AskHaveAccont(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
