abstract class EmailErrorEvent {}

class EmailErrorChange extends EmailErrorEvent {
  String message;
  EmailErrorChange({required this.message});
}

abstract class PasswordErrorEvent {}

class PasswordErrorChange extends PasswordErrorEvent {
  String message;
  PasswordErrorChange({required this.message});
}
