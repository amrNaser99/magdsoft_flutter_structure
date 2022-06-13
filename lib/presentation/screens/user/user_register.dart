import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/componands/applocale.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_login.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../styles/colors.dart';
import '../shared/componands/componands.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (BuildContext context, Object? state) {
        if(state is RegisterSuccessState){
          NavigateTo(context, const UserProfile());
        }
      },
      builder: (BuildContext context, state) {
        GlobalCubit cubit = BlocProvider.of(context);

        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColor.primary,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(30),
                          topEnd: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [

                           Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              getLang(context, "Register"),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: defaultTextFormField(
                              controller: cubit.nameController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Name',
                              hintText: 'Full Name',
                              prefixIcon: Icons.person,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Full Name';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: defaultTextFormField(
                              controller: cubit.emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Email',
                              hintText: 'Email Address',
                              prefixIcon: Icons.email_outlined,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Email Address';
                                }
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: defaultTextFormField(
                              controller: cubit.phoneController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'phone',
                              hintText: '+010********',
                              prefixIcon: Icons.phone,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Email Address';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: defaultTextFormField(
                                controller: cubit.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: 'Password',
                                prefixIcon: Icons.lock_outline,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Must\'t Be Empty';
                                  }
                                },
                                isPassword: cubit.isPassword,
                                suffixIcon: cubit.isPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                suffixPressed: () {
                                  setState(() {
                                    cubit.isPassword = !cubit.isPassword;
                                  });
                                }),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: defaultTextFormField(
                                controller: cubit.confirmPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: 'Confirm Password',
                                prefixIcon: Icons.lock_outline,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Must\'t Be Empty';
                                  }
                                },
                                isPassword: cubit.isConfirmPassword,
                                suffixIcon: cubit.isConfirmPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                suffixPressed: () {
                                  setState(() {
                                    cubit.isConfirmPassword = !cubit.isConfirmPassword;
                                  });
                                }),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          ///////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultButton(
                                color: AppColor.primary,
                                text: getLang(context, "Register"),
                                onPressed: () {
                                  cubit.userRegister(
                                    name: cubit.nameController.text,
                                    email: cubit.emailController.text,
                                    phone: cubit.phoneController.text,
                                    password: cubit.passwordController.text,
                                  );
                                  NavigateTo(context, const UserProfile());
                                },
                                isUpperCase: true,
                              ),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultButton(
                                width: MediaQuery.of(context).size.width * 0.5,
                                color: AppColor.primary,
                                text: getLang(context, "Login"),
                                onPressed: () {
                                  NavigateTo(context, const LoginScreen());
                                },
                                isUpperCase: true,
                              ),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
