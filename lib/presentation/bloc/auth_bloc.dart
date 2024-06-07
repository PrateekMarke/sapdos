import 'package:bloc/bloc.dart';
import 'package:sapdos/presentation/bloc/auth_event.dart';
import 'package:sapdos/presentation/bloc/auth_state.dart';
import 'package:sapdos/presentation/validators/validation.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<AuthSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    final emailError = evalEmail(event.email);
    final isFormValid = _isFormValid(emailError: emailError, passwordError: state.passwordError, confirmPasswordError: state.confirmPasswordError);
    emit(state.copyWith(emailError: emailError, isFormValid: isFormValid));
  }

  void _onPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    final passwordError = evalPassword(event.password);
    final isFormValid = _isFormValid(emailError: state.emailError, passwordError: passwordError, confirmPasswordError: state.confirmPasswordError);
    emit(state.copyWith(passwordError: passwordError, isFormValid: isFormValid));
  }

  void _onConfirmPasswordChanged(AuthConfirmPasswordChanged event, Emitter<AuthState> emit) {
    final confirmPasswordError = evalPassword(event.confirmPassword);
    final isFormValid = _isFormValid(emailError: state.emailError, passwordError: state.passwordError, confirmPasswordError: confirmPasswordError);
    emit(state.copyWith(confirmPasswordError: confirmPasswordError, isFormValid: isFormValid));
  }

  void _onSubmitted(AuthSubmitted event, Emitter<AuthState> emit) {
    // Check if there are any errors
    if (state.isFormValid) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(isSuccess: false));
    }
  }

  bool _isFormValid({String? emailError, String? passwordError, String? confirmPasswordError}) {
    return emailError == null && passwordError == null && confirmPasswordError == null;
  }
}