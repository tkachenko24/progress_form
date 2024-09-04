import 'package:foundation/export.dart';

class Validate<W> {
  final W Function()? email;
  final W Function()? password;
  final W Function()? number;
  final W Function()? phone;
  final W Function()? date;
  final W Function()? min;
  final W Function()? empty;
  final W Function() other;

  const Validate({
    this.email,
    this.password,
    this.phone,
    this.date,
    this.number,
    this.empty,
    this.min,
    required this.other,
  });
}

abstract class ValidateFailure extends Failure {
  const ValidateFailure();

  W check<W>(Validate actions);
}

class EmailFailure extends ValidateFailure {
  const EmailFailure();

  @override
  W check<W>(Validate actions) {
    final email = actions.email;

    if (email != null) {
      return email.call();
    }

    return actions.other();
  }
}

class PasswordFailure extends ValidateFailure {
  const PasswordFailure();

  @override
  W check<W>(Validate actions) {
    final password = actions.password;

    if (password != null) {
      return password.call();
    }

    return actions.other();
  }
}

class PhoneFailure extends ValidateFailure {
  const PhoneFailure();

  @override
  W check<W>(Validate actions) {
    final phone = actions.phone;

    if (phone != null) {
      return phone.call();
    }

    return actions.other();
  }
}

class NumbersFailure extends ValidateFailure {
  const NumbersFailure();

  @override
  W check<W>(Validate actions) {
    final number = actions.number;

    if (number != null) {
      return number.call();
    }

    return actions.other();
  }
}

class DateFailure extends ValidateFailure {
  const DateFailure();

  @override
  W check<W>(Validate actions) {
    final date = actions.date;

    if (date != null) {
      return date.call();
    }

    return actions.other();
  }
}

class EmptyFailure extends ValidateFailure {
  const EmptyFailure();

  @override
  W check<W>(Validate actions) {
    final empty = actions.empty;

    if (empty != null) {
      return empty.call();
    }

    return actions.other();
  }
}

class MinFailure extends ValidateFailure {
  const MinFailure();

  @override
  W check<W>(Validate actions) {
    final min = actions.min;

    if (min != null) {
      return min.call();
    }

    return actions.other();
  }
}
