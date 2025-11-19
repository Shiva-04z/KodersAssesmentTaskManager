import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../core/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeChanged>(_onThemeChanged);
    on<ThemeLoaded>(_onThemeLoaded);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(themeType: event.themeType));
  }

  void _onThemeLoaded(ThemeLoaded event, Emitter<ThemeState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt("SelectedTheme")??0;
    AppThemeType themeType = AppThemeType.values[index];
    emit(state.copyWith(themeType: themeType));
  }
}