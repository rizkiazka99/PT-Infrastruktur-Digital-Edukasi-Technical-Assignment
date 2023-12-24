import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/login/login_bloc.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/login/login_events.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/login/login_states.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/password/password_bloc.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/password/password_events.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/password/password_states.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/view/auth/background_decoration.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/widgets/custom_button.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/widgets/custom_card.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/widgets/custom_form.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/routes/app_routes.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  var autoValidateEmail = AutovalidateMode.disabled;
  var autoValidatePassword = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget errorMessage() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is ErrorLoginState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 8.w, 
              vertical: 16.h
            ),
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: Colors.red.withOpacity(0.2)
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }
    );
  }

  Widget loginForm() {
    return Column(
      children: [
        CustomCard(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.contextGrey.withOpacity(0.1)
                    )
                  )
                ),
                child: CustomForm(
                  formKey: emailFormKey, 
                  autovalidateMode: autoValidateEmail, 
                  controller: emailController, 
                  hintText: 'E-mail', 
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'E-mail field cannot be left empty';
                    }
                  }
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h
                ),
                child: BlocBuilder<PasswordBloc, PasswordState>(
                  builder: (context, state) {
                    bool isObscured = (state as PasswordVisibilityState).isObscured;

                    return CustomForm(
                      formKey: passwordFormKey, 
                      autovalidateMode: autoValidatePassword, 
                      controller: passwordController, 
                      hintText: 'Password',
                      obscureText: isObscured,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isObscured
                              ? BlocProvider.of<PasswordBloc>(context)
                                    .add(VisiblePasswordEvent())
                              : BlocProvider.of<PasswordBloc>(context)
                                    .add(ObscuredPasswordEvent());
                        },
                        child: Icon(
                          isObscured
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.primaryColor,
                        )
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password field cannot be left empty';
                        }
                      }
                    );
                  }
                )
              )
            ]
          )
        ),
        SizedBox(height: 16.h)          
      ]
    );
  }

  Widget loginButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.HOME, 
            (route) => false
          );
        }
      },
      builder: (context, state) {
        if (state is InitialLoginState || state is ErrorLoginState) {
          return CustomButton(
            onPressed: () {
              final isEmailValid = emailFormKey.currentState!.validate();
              final isPasswordValid = passwordFormKey.currentState!.validate();

              FocusManager.instance.primaryFocus!.unfocus();
              if (isEmailValid && isPasswordValid) {
                BlocProvider.of<LoginBloc>(context)
                    .add(InitiateLoginEvent(
                      email: emailController.text, 
                      password: passwordController.text
                    ));
              } else {
                if (!isEmailValid && !isPasswordValid) {
                  autoValidateEmail = AutovalidateMode.always;
                  autoValidatePassword = AutovalidateMode.always;
                } else if (!isEmailValid) {
                  autoValidateEmail = AutovalidateMode.always;
                } else if (!isPasswordValid) {
                  autoValidatePassword = AutovalidateMode.always;
                }
              }
            }, 
            content: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )
            )
          );
        }

        if (state is LoadingLoginState) {
          return CustomButton(
            onPressed: () {},
            content: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const SpinKitRing(
                color: Colors.white,
              ),
            )
          );
        }

        if (state is SuccessLoginState) {
          return CustomButton(
            onPressed: () {}, 
            content: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )
            )
          );
        }

        return const SizedBox.shrink();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) {
            return LoginBloc();
          }
        ),
        BlocProvider<PasswordBloc>(
          create: (context) {
            return PasswordBloc();
          }
        )
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              backgroundDecoration(),
              FadeInUp(
                duration: const Duration(milliseconds: 1800),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16.w)
                      .copyWith(bottom: 16.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h
                  ),
                  child: Column(
                    children: [
                      errorMessage(),
                      loginForm(),
                      loginButton(),
                    ]
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}