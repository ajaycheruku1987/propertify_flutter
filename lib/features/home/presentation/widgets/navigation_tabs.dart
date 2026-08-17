import 'package:propertify/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const NavigationTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        tabs.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 8.0,
              ),
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  gradient: selectedIndex == index
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor,
                            Colors.white,
                            Colors.white,
                          ],
                        )
                      : null,
                  border: Border.all(color: Colors.transparent),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getTabIcon(context, index, selectedIndex == index),
                      const SizedBox(height: 6),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          tabs[index].translate(context),
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).hintColor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTabIcon(BuildContext context, int index, bool isSelected) {
    final color = isSelected
        ? Theme.of(context).primaryColor
        : Theme.of(context).hintColor;

    switch (index) {
      case 0: // Feeds
        return SvgPicture.asset(
          'assets/icons/post.svg',
          width: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      case 1: // Requests
        return SvgPicture.asset(
          'assets/icons/request.svg',
          width: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      case 2: // Projects
        return Icon(
          Icons.apartment_outlined,
          size: 24,
          color: color,
        );
      case 3: // Services
        return SvgPicture.asset(
          'assets/icons/agent.svg',
          width: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      default:
        return Icon(
          Icons.more_horiz,
          size: 24,
          color: color,
        );
    }
  }
}
