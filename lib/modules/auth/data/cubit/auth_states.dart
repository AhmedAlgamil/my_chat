abstract class AuthStates{}

class IntialAuthState extends AuthStates{}

class LoginState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class LoginFailedState extends AuthStates{}

class RegisterState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterFailedState extends AuthStates{}