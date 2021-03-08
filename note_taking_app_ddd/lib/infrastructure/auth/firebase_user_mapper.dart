import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:note_taking_app_ddd/domain/auth/user.dart';
import 'package:note_taking_app_ddd/domain/auth/value_objects.dart';
import 'package:note_taking_app_ddd/domain/core/value_objects.dart';

@lazySingleton
class FirebaseUserMapper {
  User toDomain(FirebaseUser _) {
    return _ == null
        ? null
        : User(
            id: UniqueId.fromUniqueString(_.uid),
            name: StringSingleLine(_.displayName ?? _.email.split('@').first),
            emailAddress: EmailAddress(_.email),
          );
  }
}
