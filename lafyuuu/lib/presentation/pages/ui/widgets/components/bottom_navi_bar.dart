import 'package:flutter/material.dart';
import '../../../../../utils/helpers/navigate.dart';
import '../../../../../utils/constants/app_colors.dart';

import '../../cart_page/cart_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      iconSize: 18,
      elevation: 0,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigate.replace(context, const CartPage());
                },
                icon: const Icon(Icons.home)),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {}, icon:const Icon(Icons.local_offer_outlined)),
            label: 'Offer'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {}, icon: const
                Icon(Icons.person_2_outlined)),
            label: 'Account'),
            
      ],
    );
    
  }
}
