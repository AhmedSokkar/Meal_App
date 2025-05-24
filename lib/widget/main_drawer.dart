import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreenDrawer});
  final void Function(String identifer) onSelectedScreenDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onBackground,
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 48,
                ),
                const SizedBox(width: 20),
                Text(
                  "Coocking up...",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectedScreenDrawer("Meal");
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meal",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectedScreenDrawer("Filters");
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
