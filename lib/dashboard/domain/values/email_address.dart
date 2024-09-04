import 'package:foundation/export.dart';
import 'package:progress_form/common/helpers/export.dart';

class EmailAddress extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory EmailAddress(String input) {
    return EmailAddress.create(
      validateEmailAddress(input),
    );
  }

  const EmailAddress.create(this.value);
}
