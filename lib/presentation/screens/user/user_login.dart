import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/componands/componands.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_register.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        GlobalCubit cubit = BlocProvider.of(context);
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColor.primary,
          appBar: AppBar(
            backgroundColor: AppColor.primary,
            actions: [

            AdvancedSwitch(
              controller: cubit.switchController,
              activeColor: Colors.deepPurpleAccent,
              activeChild: const Text('en'),
              inactiveColor: Colors.indigo.shade400,
              inactiveChild: const Text('ar'),
              enabled: true,
            ),
              const SizedBox(width: 15 ,)
          ],),
          body: Container(
            alignment: Alignment.topCenter,
            child:
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.33,
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
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Spacer(),
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
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ConditionalBuilder(
                              condition: true,
                              builder: (context) => defaultButton(
                                color: AppColor.primary,
                                text: 'Login',
                                onPressed: () {
                                  cubit.userLogin(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                  );
                                  // if (cubit.formKey.currentState!.validate()) {
                                  //   cubit.userLogin(
                                  //     email: cubit.emailController.text,
                                  //     password: cubit.passwordController.text,
                                  //   );
                                  // }
                                },
                                isUpperCase: true,
                              ),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defaultButton(
                              width: MediaQuery.of(context).size.width *0.5,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              color: AppColor.primary,
                              text: 'Register',
                              onPressed: () {
                                NavigateTo(context, const RegisterScreen());
                              },
                              isUpperCase: true,
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
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
        );
      },
    );
  }
}
