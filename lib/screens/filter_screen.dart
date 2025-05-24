import 'package:flutter/material.dart';
//import 'package:meal_app/screens/tabs_screen.dart';
//import 'package:meal_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.selectedFilter});

  final Map<Filter, bool> selectedFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegeterian,
}

class _FilterScreenState extends State<FilterScreen> {
  bool initValueGluten = false;
  bool initValueLactose = false;
  bool initValueVegan = false;
  bool initValueVegeterian = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initValueGluten = widget.selectedFilter[Filter.glutenFree]!;
    initValueLactose = widget.selectedFilter[Filter.lactoseFree]!;
    initValueVegan = widget.selectedFilter[Filter.vegan]!;
    initValueVegeterian = widget.selectedFilter[Filter.vegeterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      /*
      drawer: MainDrawer(
        onSelectedScreenDrawer: (identifer) {
          Navigator.pop(context);
          if (identifer == 'Meal') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TabScreen(),
              ),
            );
          }
        },
      ),
      */
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: initValueGluten,
            Filter.lactoseFree: initValueLactose,
            Filter.vegan: initValueVegan,
            Filter.vegeterian: initValueVegeterian,
          });
          return false;
        },
        child: Column(
          children: [
            customSwitch(
              title: "Gluten-free ",
              subTitle: 'Only include Gluten-free meals',
              initValue: initValueGluten,
              onChange: (value) {
                setState(
                  () {
                    initValueGluten = value;
                  },
                );
              },
            ),
            customSwitch(
              title: "Lactose-free ",
              subTitle: 'Only include Lactose-free meals',
              initValue: initValueLactose,
              onChange: (value) {
                setState(
                  () {
                    initValueLactose = value;
                  },
                );
              },
            ),
            customSwitch(
              title: "Vegan ",
              subTitle: 'Only include Vegan meals',
              initValue: initValueVegan,
              onChange: (value) {
                setState(
                  () {
                    initValueVegan = value;
                  },
                );
              },
            ),
            customSwitch(
              title: "Vegeterian ",
              subTitle: 'Only include Vegeterian meals',
              initValue: initValueVegeterian,
              onChange: (value) {
                setState(
                  () {
                    initValueVegeterian = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch({
    required String title,
    required String subTitle,
    required bool initValue,
    required Function(bool newValue) onChange,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      value: initValue,
      onChanged: onChange,
    );
  }
}
