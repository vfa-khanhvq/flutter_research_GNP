import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<IsHidingBottomBarToggle>(_isHidingBottomBarToggle);
  }

  Future<void> _isHidingBottomBarToggle(
    IsHidingBottomBarToggle event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(isHidingBottomBar: !state.isHidingBottomBar));
  }
}
