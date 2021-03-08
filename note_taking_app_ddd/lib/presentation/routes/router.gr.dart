// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:note_taking_app_ddd/presentation/pages/splash/splash_page.dart';
import 'package:note_taking_app_ddd/presentation/pages/sign_in/sign_in_page.dart';
import 'package:note_taking_app_ddd/presentation/pages/notes/notes_overview/notes_overview_page.dart';
import 'package:note_taking_app_ddd/presentation/pages/notes/note_form/note_form_page.dart';
import 'package:note_taking_app_ddd/domain/notes/note.dart';

class AppRouter {
  static const splashPage = '/';
  static const signInPage = '/sign-in-page';
  static const notesOverviewPage = '/notes-overview-page';
  static const noteFormPage = '/note-form-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRouter.splashPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SplashPage(),
          settings: settings,
        );
      case AppRouter.signInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInPage(),
          settings: settings,
        );
      case AppRouter.notesOverviewPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => NotesOverviewPage().wrappedRoute,
          settings: settings,
        );
      case AppRouter.noteFormPage:
        if (hasInvalidArgs<NoteFormPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<NoteFormPageArguments>(args);
        }
        final typedArgs = args as NoteFormPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => NoteFormPage(
              key: typedArgs.key, editedNote: typedArgs.editedNote),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//NoteFormPage arguments holder class
class NoteFormPageArguments {
  final Key key;
  final Note editedNote;
  NoteFormPageArguments({this.key, @required this.editedNote});
}
