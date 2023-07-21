import 'package:bloc/bloc.dart';

import '../event/nav_drawer_event.dart';
import '../state/nav_drawer_state.dart';

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc(super.initialState);

  @override
  NavDrawerState get initialState => NavDrawerState(NavItem.page_one);
  @override
  Stream<NavDrawerState> mapEventToState(NavDrawerEvent event) async* {
    if (event is NavigateTo) {
      if (event.destination != state.selectedItem) {
        yield NavDrawerState(event.destination);
      }
    }
  }
}
