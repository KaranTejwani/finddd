import 'package:classico/categoriesscreen.dart';
import 'package:classico/profilescreen.dart';
import 'package:classico/cart.dart';
import 'package:classico/authentication/add_details_page.dart';
import 'package:classico/authentication/add_seller_details_page.dart';
import 'package:classico/authentication/change_password_page.dart';
import 'package:classico/authentication/forgot_password_page.dart';
import 'package:classico/authentication/login_page.dart';
import 'package:classico/authentication/register_page.dart';
import 'package:classico/checkout.dart';
import 'package:classico/homescreen.dart';
import 'package:classico/productsdetails.dart';
import 'package:classico/sellerscreen.dart';
import 'package:classico/sellersideui.dart';
import 'package:classico/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/forgotpassword": (context) => const ForgotPasswordPage(),
        "/changepassword": (context) => const ChangePasswordPage(),
        "/adddetails": (context) => const AddDetailsPage(),
        "/addsellerdetails": (context) => const AddSellerDetailsPage(),
        "/cart": (context) => const Card(),
        "/profile": (context) => const ProfileScreen(),
        "/checkout": (context) => const Checkout(),
      },
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const SellerScreen(),
    const CategoriesScreen(),
    const Cart(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Find IT!',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Theme.of(context).primaryColor,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shop,
                text: 'Shops',
              ),
              GButton(
                icon: Icons.category,
                text: 'Categories',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              _onTabTapped(index);
            },
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }
}
