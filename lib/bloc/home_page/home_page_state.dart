part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  const HomePageState({
    this.isHidingBottomBar = false,
  });
  final bool isHidingBottomBar;

  @override
  List<Object> get props => [isHidingBottomBar];

  HomePageState copyWith({
    bool? isHidingBottomBar,
  }) {
    return HomePageState(
      isHidingBottomBar: isHidingBottomBar ?? this.isHidingBottomBar,
    );
  }
}
