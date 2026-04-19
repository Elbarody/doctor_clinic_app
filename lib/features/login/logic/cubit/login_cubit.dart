import 'package:doctor_opportunity/features/login/data/models/login_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_opportunity/features/login/data/repos/login_repo.dart';
import 'package:doctor_opportunity/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates(LoginRequestBody requestBody) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(requestBody);
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(
          errorMessage: error.apiErrorModel.message ?? 'An error occurred'));
    });
  }
}
