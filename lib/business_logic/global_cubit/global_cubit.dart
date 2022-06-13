import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/componands/componands.dart';

import '../../constants/end_points.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;

  bool checked = false;
  final switchController = ValueNotifier<bool>(false);

  void userLogin({required email, required password}) {
    emit(LoginLoadingState());
    print('in userLogin');

    DioHelper.postData(
      url: login,
      body: {'email': email, 'password': password},
    ).then((value) {
      emit(LoginSuccessState());
      print(value.data);
      showToast(message: value.data);
    }).catchError((error) {
      showToast( message: error.toString());
    });
  }

  void toggleLang() {
    if (switchController.value) {
      checked = true;
    } else {
      checked = false;
    }
    emit(ToggleLanguage());
  }

  void userRegister(
      {required String name,
      required String email,
      required String phone,
      required String password}) {
    DioHelper.postData(url: register, body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password
    }).then((value) {
      emit(RegisterSuccessState());
      print(value.data);
      showToast( message: value.data);
    }).catchError((error) {
      showToast(  message:error.toString());
    });
  }
}
