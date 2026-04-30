import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit(){
    print('Submit: $state');
  }
  void usernameChanged(String value) {
    emit(state.copywith(username: value));
  }

  void emailChanged(String value) {
    emit(state.copywith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copywith(password: value));
  }
}
