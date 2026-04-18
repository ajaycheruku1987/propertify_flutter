import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/app_theme.dart';

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
                      const SizedBox(width: 6),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          tabs[index],
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
    String iconData;
    switch (index) {
      case 0:
        iconData = 'assets/icons/document.svg';
        break;
      case 1:
        iconData = 'assets/icons/agent.svg';
        break;
      case 2:
        iconData = 'assets/icons/document.svg';
        break;
      case 3:
        iconData = 'assets/icons/sales.svg';
        break;
      default:
        iconData = 'assets/icons/sales.svg';
    }

    return SvgPicture.asset(
      iconData,
      width: 24,
      colorFilter: ColorFilter.mode(
        isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).hintColor,
        BlendMode.srcIn,
      ),
    );
  }
}
