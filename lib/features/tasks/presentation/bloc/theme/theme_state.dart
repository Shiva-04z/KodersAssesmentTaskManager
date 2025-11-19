part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppThemeType themeType;

  const ThemeState({this.themeType = AppThemeType.lightBlue});

  ThemeState copyWith({AppThemeType? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }

  @override
  List<Object> get props => [themeType];
}