import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo/todos_event.dart';
import 'package:todo_task/bloc/todo/todos_state.dart';
import 'package:todo_task/data/local/local_database.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';

class TodosBloc extends Bloc<TodosEvent, TodoState> {
  TodosBloc()
      : super(
          const TodoState(
            status: FormStatus.pure,
            todos: [],
            eventName: "",
            eventTime: "",
            eventDescription: "",
            eventLocation: "",
            eventPriority: "",
            statusText: "",
          ),
        ) {
    on<AddTodo>(_addTodo);
    on<GetTodo>(_getTodos);
    on<UpdateTodo>(_updateTodo);
    on<DeleteTodo>(_deleteTodo);
  }

  _addTodo(AddTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Adding Todo...!"));
    LocalDatabase.getInstance;
    LocalDatabase.insertTodo(event.newTodo);
    // await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        status: FormStatus.success,
        statusText: "Added Todo!",
        todos: [...state.todos, event.newTodo]));
  }

  _getTodos(GetTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Getting Todos!"));
    // await Future.delayed(const Duration(seconds: 2));
    List<EventModel> todos = await LocalDatabase.getAllTodos();

    emit(state.copyWith(
        statusText: "Todos Fetched!",
        status: FormStatus.success,
        todos: todos));
  }

  _updateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Update Todo...!"));
    LocalDatabase.updateTodo(eventModel: event.updatedTodo);
    List<EventModel> todos = await LocalDatabase.getAllTodos();
    emit(state.copyWith(
        statusText: "Updated Todo!", status: FormStatus.success, todos: todos));
  }

  _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Deleting Todo...",
      ),
    );
    await Future.delayed(const Duration(seconds: 2));

    // List<UserModel> currentUsers = state.users;
    //
    // currentUsers.removeWhere((element) => element.userId == event.userId);
    LocalDatabase.deleteTodo(event.todoId);
    List<EventModel> todos = await LocalDatabase.getAllTodos();
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Todo deleted !!!",
        todos: todos,
      ),
    );
  }
}
