class AuthException implements Exception {
  AuthException(this.key);

  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já cadastrado.',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Acesso bloqueado temporáriamente. Tente novamente mais tarde.',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado.',
    'INVALID_PASSWORD': 'Senha informada não confere.',
    'USER_DISABLED': 'A conta do usuário foi desabilitada.',
  };

  final String key;

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação.';
  }
}
