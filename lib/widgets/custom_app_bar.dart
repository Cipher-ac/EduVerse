import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/perfil');
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/jeff.png'),
            radius: 20,
          ),
        ),
      ),
      title: SizedBox(
        height: 40,
        child: TextField(
          style: const TextStyle(color: Colors.blue),
          cursorColor: Colors.blue, 
          decoration: InputDecoration(
            hintText: 'Pesquisar...',
            hintStyle: const TextStyle(color: Colors.blue), 
            prefixIcon: const Icon(Icons.search, color: Colors.blue),
            filled: true,
            fillColor: Colors.white, 
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),  
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/notificacoes');
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/configuracoes');
          },
        ),
      ],
    );
  }
}
