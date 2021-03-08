import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app_ddd/application/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app_ddd/application/notes/note_actor/note_actor_bloc.dart';
import 'package:note_taking_app_ddd/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:note_taking_app_ddd/injection.dart';
import 'package:note_taking_app_ddd/presentation/pages/notes/notes_overview/widgets/notes_overview_body_widget.dart';
import 'package:note_taking_app_ddd/presentation/pages/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:note_taking_app_ddd/presentation/routes/router.gr.dart';

class NotesOverviewPage extends HookWidget implements AutoRouteWrapper {
  @override
  Widget get wrappedRoute => MultiBlocProvider(
        providers: [
          BlocProvider<NoteWatcherBloc>(
            create: (context) => getIt<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted()),
          ),
          BlocProvider<NoteActorBloc>(
            create: (context) => getIt<NoteActorBloc>(),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeMap(
              unauthenticated: (_) =>
                  AppRouter.navigator.pushReplacementNamed(AppRouter.signInPage),
              orElse: () {},
            );
          },
        ),
        BlocListener<NoteActorBloc, NoteActorState>(
          listener: (context, state) {
            state.maybeMap(
              deleteFailure: (state) {
                FlushbarHelper.createError(
                  duration: const Duration(seconds: 5),
                  message: state.noteFailure.map(
                      // Use localized strings here in your apps
                      insufficientPermissions: (_) =>
                          'Insufficient permissions ❌',
                      unableToUpdate: (_) => 'Impossible error',
                      unexpected: (_) =>
                          'Unexpected error occured while deleting, please contact support.'),
                ).show(context);
              },
              orElse: () {},
            );
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
            },
          ),
          actions: <Widget>[
            UncompletedSwitch(),
          ],
        ),
        body: NotesOverviewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppRouter.navigator.pushNamed(
              AppRouter.noteFormPage,
              arguments: NoteFormPageArguments(editedNote: null),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
