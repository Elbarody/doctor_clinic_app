import 'package:doctor_opportunity/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_opportunity/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctor_opportunity/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void emitSignUpStates() async {
    emit(const SignUpState.signUpLoading());

    final response = await _signUpRepo.signUp(SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        name: nameController.text,
        phone: phoneController.text,
        gender: 0));

    response.when(success: (signUpResponse) {
      emit(SignUpState.signUpSuccess(signUpResponse));
    }, failure: (error) {
      emit(SignUpState.signUpError(
          errorMessage: error.apiErrorModel.message ?? 'An error occurred'));
    });
  }
}
