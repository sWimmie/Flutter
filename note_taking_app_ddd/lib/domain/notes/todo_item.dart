import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_taking_app_ddd/domain/core/common_interfaces.dart';

import 'package:note_taking_app_ddd/domain/core/entity.dart';
import 'package:note_taking_app_ddd/domain/core/failures.dart';
import 'package:note_taking_app_ddd/domain/core/value_objects.dart';
import 'package:note_taking_app_ddd/domain/notes/value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem with _$TodoItem implements IEntity {
  const factory TodoItem({
    @required UniqueId id,
    @required TodoName name,
    @required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );
}

extension TodoItemX on TodoItem {
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold((f) => some(f), (_) => none());
  }
}
