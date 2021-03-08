import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app_ddd/domain/auth/auth_failure.dart';
import 'package:note_taking_app_ddd/domain/auth/user.dart';
import 'package:note_taking_app_ddd/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
