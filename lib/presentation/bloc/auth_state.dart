
import 'package:equatable/equatable.dart';

// Define your states
class AuthState extends Equatable {
  final bool isSuccess;
  final bool isFormValid;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  const AuthState({
    this.isSuccess = false,
    this.isFormValid = false,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  AuthState copyWith({
    bool? isSuccess,
    bool? isFormValid,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return AuthState(
      isSuccess: isSuccess ?? this.isSuccess,
      isFormValid: isFormValid ?? this.isFormValid,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }

  @override
  List<Object?> get props => [isSuccess, isFormValid, emailError, passwordError, confirmPasswordError];
}