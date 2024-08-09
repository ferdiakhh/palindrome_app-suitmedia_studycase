import 'package:flutter/material.dart';
import 'package:palindrome_app/models/user_model.dart';

// Widget untuk menampilkan setiap pengguna dalam daftar
class UserListTile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: onTap,
    );
  }
}
