import 'package:equatable/equatable.dart';
import 'package:todo_task/data/model/event_model.dart';

abstract class TodosEvent extends Equatable {}

class AddTodo extends TodosEvent {
  final EventModel newTodo;

  AddTodo({required this.newTodo});

  @override
  List<Object?> get props => [newTodo];
}

class UpdateTodo extends TodosEvent {
  final EventModel updatedTodo;

  UpdateTodo({required this.updatedTodo});

  @override
  List<Object?> get props => [updatedTodo];
}

class DeleteTodo extends TodosEvent {
  final int todoId;

  DeleteTodo({required this.todoId});

  @override
  List<Object?> get props => [todoId];
}

class GetTodo extends TodosEvent {
  @override
  List<Object?> get props => [];
}
