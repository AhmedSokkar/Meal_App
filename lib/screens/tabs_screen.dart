import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widget/main_drawer.dart';

//init values for type of food Use to filteration
const kinitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegeterian: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //index & adderFunction to Navigate anouther page(Category and Favorite in BottomNavigatorBar)
  int selectedIndex = 0;

  void selectTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

//Favorite List to present it in Favorite Tab in BottomNavigationBarItem
//and his SnackBar to Know User the FOODITEM added in Favorite Section
  List<Meal> favoriteList = [];
  var addSnackBar = const SnackBar(content: Text("Added to favorite"));
  var removeSnackBar = const SnackBar(content: Text("removed to favorite"));

//Add favorite Food to Favorite Section to add and remove in favoriteList
  void addFavorite(Meal meal) {
    final bool isExist = favoriteList.contains(meal);

    if (isExist) {
      setState(
        () {
          favoriteList.remove(meal);
          ScaffoldMessenger.of(context).showSnackBar(removeSnackBar);
        },
      );
    } else {
      setState(
        () {
          favoriteList.add(meal);
          ScaffoldMessenger.of(context).showSnackBar(addSnackBar);
        },
      );
    }
  }
//all favorite section

  Map<Filter, bool> selectedFilter = kinitialFilter;

//Navigator code
//that code for Drawer to select sections (only Filter page available now)
//.then() code
//FilterScreen will show with push and after Done or Back or pop it may be return Map<Filter,bool>
//and we will put it in selectedFilter if return with valus or if it null will put Defult Value
//and it will be kinitialFilter
  void onSelectedScreenDrawer(String identifer) {
    Navigator.pop(context);
    if (identifer == 'Filters') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilterScreen(selectedFilter: selectedFilter),
        ),
      ).then(
        (value) => setState(
          () => selectedFilter = value ?? kinitialFilter,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //Filteration The Food contains gluten and more
    final List<Meal> availableMeals = dummyMeals.where((meal) {
      if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilter[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

//determine the current page that will presented in screen
//i can controll that with selectedIndex variable (define it in top)
    Widget currentPadge = CategoryScreen(
      addFavorite: addFavorite,
      availableMeals: availableMeals,
    );

    if (selectedIndex == 1) {
      currentPadge = MealScreen(
        title: "Favorite",
        meals: favoriteList,
        addFavorite: addFavorite,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meal App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(onSelectedScreenDrawer: onSelectedScreenDrawer),
      body: currentPadge,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: selectTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
        ],
      ),
    );
  }
}
