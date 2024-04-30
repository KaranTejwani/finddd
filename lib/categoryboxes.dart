import 'package:classico/categoriesscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryBoxes extends StatelessWidget {
  const CategoryBoxes({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: WrapAlignment.center,
        children: choices.map((choice) {
          return ChoiceCard(choice: choice);
        }).toList(),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key? key, required this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(category: choice.title),
          ),
        );
      },
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          color: choice.color,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon, size: 35.0, color: Colors.white),
                SizedBox(height: 4.0),
                Center(
                  child: Text(
                    choice.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon, required this.color});

  final String title;
  final IconData icon;
  final Color color;
}

const List<Choice> choices = <Choice>[
  Choice(
    title: 'Clothing',
    icon: FontAwesomeIcons.tshirt,
    color: Colors.orange,
  ),
  Choice(
    title: 'Perfumes',
    icon: FontAwesomeIcons.sprayCan,
    color: Colors.purple,
  ),
  Choice(
    title: 'Bikes',
    icon: FontAwesomeIcons.bicycle,
    color: Colors.blue,
  ),
  Choice(
    title: 'Currencies',
    icon: FontAwesomeIcons.bitcoin,
    color: Colors.yellow,
  ),
  Choice(
    title: 'Laptops',
    icon: FontAwesomeIcons.laptop,
    color: Colors.teal,
  ),
  Choice(
    title: 'Mobiles',
    icon: FontAwesomeIcons.mobile,
    color: Colors.pinkAccent,
  ),
  Choice(
    title: 'Calculators',
    icon: FontAwesomeIcons.calculator,
    color: Colors.cyan,
  ),
  Choice(
    title: 'Drums',
    icon: FontAwesomeIcons.drum,
    color: Colors.greenAccent,
  ),
  Choice(
    title: 'Clocks',
    icon: FontAwesomeIcons.clock,
    color: Colors.brown,
  ),
  Choice(
    title: 'Diamonds',
    icon: FontAwesomeIcons.gem,
    color: Colors.blueGrey,
  ),
  Choice(
    title: 'Headphones',
    icon: FontAwesomeIcons.headphones,
    color: Colors.redAccent,
  ),
  Choice(
    title: 'Books',
    icon: FontAwesomeIcons.bookOpen,
    color: Colors.indigo,
  ),
  Choice(
    title: 'Furniture',
    icon: FontAwesomeIcons.couch,
    color: Colors.brown,
  ),
  Choice(
    title: 'Jewelry',
    icon: FontAwesomeIcons.gem,
    color: Colors.amber,
  ),
  Choice(
    title: 'Toys',
    icon: FontAwesomeIcons.robot,
    color: Colors.green,
  ),
  Choice(
    title: 'Electronics',
    icon: FontAwesomeIcons.tv,
    color: Colors.blue,
  ),
  Choice(
    title: 'Sports',
    icon: FontAwesomeIcons.footballBall,
    color: Colors.red,
  ),
  Choice(
    title: 'Beauty',
    icon: FontAwesomeIcons.eyeSlash,
    color: Colors.pink,
  ),
  Choice(
    title: 'Home Decor',
    icon: FontAwesomeIcons.home,
    color: Colors.deepPurple,
  ),
  Choice(
    title: 'Tools',
    icon: FontAwesomeIcons.tools,
    color: Colors.orangeAccent,
  ),
  Choice(
    title: 'Health',
    icon: FontAwesomeIcons.medkit,
    color: Colors.greenAccent,
  ),
  Choice(
    title: 'Pets',
    icon: FontAwesomeIcons.paw,
    color: Colors.orange,
  ),
  Choice(
    title: 'Food',
    icon: FontAwesomeIcons.hamburger,
    color: Colors.amber,
  ),
  Choice(
    title: 'Music',
    icon: FontAwesomeIcons.music,
    color: Colors.blueGrey,
  ),
  Choice(
    title: 'Art',
    icon: FontAwesomeIcons.palette,
    color: Colors.teal,
  ),
  Choice(
    title: 'Gaming',
    icon: FontAwesomeIcons.gamepad,
    color: Colors.indigoAccent,
  ),
  Choice(
    title: 'Movies',
    icon: FontAwesomeIcons.film,
    color: Colors.deepOrange,
  ),
  Choice(
    title: 'Travel',
    icon: FontAwesomeIcons.plane,
    color: Colors.blue,
  ),
  Choice(
    title: 'Vintage',
    icon: FontAwesomeIcons.shoppingBag,
    color: Colors.brown,
  ),
  Choice(
    title: 'Fashion',
    icon: FontAwesomeIcons.shoePrints,
    color: Colors.pinkAccent,
  ),
];
