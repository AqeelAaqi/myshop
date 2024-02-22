import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:url_launcher/url_launcher_string.dart';
import '../providers/data_provider.dart';

class UserDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userData, child) {
        if (userData.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    'Support',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    // Make the URL tappable
                    onTap: () {
                      launchUrlString(userData.support!.url);
                    },
                    child: Text(
                      'URL: ${userData.support!.url}',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Text: ${userData.support!.text}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Users',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.users.length,
                  itemBuilder: (context, index) {
                    final user = userData.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),//_launchEmail(userData.support!.text),
                      // You can add more information as needed
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );

  }

}
