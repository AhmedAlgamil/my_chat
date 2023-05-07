abstract class AuthStates{}

class IntialAuthState extends AuthStates{}

class LoginState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class LoginLoadedSuccessState extends AuthStates{}
class LoginFailedState extends AuthStates{}

class RegisterState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterFailedState extends AuthStates{}

class InitialUploadImage extends AuthStates{}
class UploadSuccess extends AuthStates{}
class UploadFaild extends AuthStates{}

class InitialSelectImage extends AuthStates{}
class ImageSelectedState extends AuthStates{}
class PickTime extends AuthStates{}