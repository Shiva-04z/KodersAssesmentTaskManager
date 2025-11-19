import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/theme/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.palette_rounded),
      tooltip: 'Change Theme',
      onPressed: () {
        _showThemeBottomSheet(context);
      },
    );
  }

  void _showThemeBottomSheet(BuildContext context) {
    final currentThemeType = context.read<ThemeBloc>().state.themeType;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Choose Theme',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: AppThemeType.values.length,
                itemBuilder: (context, index) {
                  final themeType = AppThemeType.values[index];
                  return Builder(
                    builder: (context) {
                      final isSelected = themeType == currentThemeType;
                      return _buildThemeOption(
                        context,
                        themeType,
                        isSelected,
                        onTap: () async {
                          context.read<ThemeBloc>().add(ThemeChanged(themeType));
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setInt("SelectedTheme", index);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(
      BuildContext context,
      AppThemeType themeType,
      bool isSelected, {
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                gradient: _getThemeGradient(themeType),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getThemeShortName(themeType),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Gradient _getThemeGradient(AppThemeType themeType) {
    switch (themeType) {
      case AppThemeType.lightBlue:
        return const LinearGradient(colors: [Colors.blue, Colors.lightBlue]);
      case AppThemeType.darkBlue:
        return const LinearGradient(colors: [Colors.blue, Colors.blueAccent]);
      case AppThemeType.lightGreen:
        return const LinearGradient(colors: [Colors.green, Colors.lightGreen]);
      case AppThemeType.darkGreen:
        return const LinearGradient(colors: [Colors.green, Colors.greenAccent]);
      case AppThemeType.lightOrange:
        return const LinearGradient(colors: [Colors.orange, Colors.orangeAccent]);
      case AppThemeType.darkOrange:
        return const LinearGradient(colors: [Colors.deepOrange, Colors.orange]);
      case AppThemeType.lightPink:
        return const LinearGradient(colors: [Colors.pink, Colors.pinkAccent]);
      case AppThemeType.darkPink:
        return const LinearGradient(colors: [Colors.pink, Colors.deepPurple]);
    }
  }

  String _getThemeShortName(AppThemeType themeType) {
    final fullName = AppTheme.getThemeName(themeType);
    return fullName.split(' ').first;
  }
}