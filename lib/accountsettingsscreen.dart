import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle(context, "Profile Information"),
            _buildProfileInfo(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Change Password"),
            _buildChangePassword(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Notifications"),
            _buildNotifications(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Payment Methods"),
            _buildPaymentMethods(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Order History"),
            _buildOrderHistory(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Shipping Addresses"),
            _buildShippingAddresses(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Wishlist"),
            _buildWishlist(context),
            SizedBox(height: 20),
            _buildSectionTitle(context, "Language and Region"),
            _buildLanguageAndRegion(context),
            SizedBox(height: 20),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.left,
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    // Implement profile information editing widget
    return ListTile(
      title: Text("Name: John Doe"),
      subtitle: Text("Email: johndoe@example.com\nPhone: +1234567890"),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          // Navigate to profile editing screen
        },
      ),
    );
  }

  Widget _buildChangePassword(BuildContext context) {
    // Implement change password widget
    return ListTile(
      title: Text("Change Password"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to change password screen
        },
      ),
    );
  }

  Widget _buildNotifications(BuildContext context) {
    // Implement notification preferences widget
    return ListTile(
      title: Text("Notification Preferences"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to notification settings screen
        },
      ),
    );
  }

  Widget _buildPaymentMethods(BuildContext context) {
    // Implement payment methods management widget
    return ListTile(
      title: Text("Payment Methods"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to payment methods management screen
        },
      ),
    );
  }

  Widget _buildOrderHistory(BuildContext context) {
    // Implement order history display widget
    return ListTile(
      title: Text("Order History"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to order history screen
        },
      ),
    );
  }

  Widget _buildShippingAddresses(BuildContext context) {
    // Implement shipping addresses management widget
    return ListTile(
      title: Text("Shipping Addresses"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to shipping addresses management screen
        },
      ),
    );
  }

  Widget _buildWishlist(BuildContext context) {
    // Implement wishlist display widget
    return ListTile(
      title: Text("Wishlist"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to wishlist screen
        },
      ),
    );
  }

  Widget _buildLanguageAndRegion(BuildContext context) {
    // Implement language and region selection widget
    return ListTile(
      title: Text("Language and Region"),
      trailing: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: () {
          // Navigate to language and region selection screen
        },
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement logout functionality
      },
      child: Text("Logout"),
    );
  }
}
