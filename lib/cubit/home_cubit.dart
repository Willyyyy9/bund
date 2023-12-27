import 'package:bloc/bloc.dart';
import 'package:bund/data/models/perk.dart';
import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/string_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(selectedIndex: 0));

  changeIndex(int index) {
    state.selectedIndex = index;
    emit(HomeState(selectedIndex: index));
  }
}
