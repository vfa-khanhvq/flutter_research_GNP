part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class IsHidingBottomBarOnChange extends HomePageEvent {
  const IsHidingBottomBarOnChange({
    required this.isHiding,
  });
  final bool isHiding;

  @override
  List<Object> get props => [isHiding];
}
