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
              const SizedBox(
                width: 15,
              )
            ],
          ),
          body: Container(
            alignment: Alignment.topCenter,
            child: Column(
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
                            'User Data',
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
                        Text(
                          'Email :${cubit.emailController.text}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Phone :${cubit.phoneController.text}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Password :${cubit.passwordController.text}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
