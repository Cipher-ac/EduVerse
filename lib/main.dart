import 'package:flutter/material.dart';
import 'package:full/screens/inicio.dart';
import 'package:full/screens/chat.dart';
import 'package:full/screens/grupo.dart';
import 'package:full/screens/perfil_page.dart';
import 'package:full/screens/notificacoes_page.dart';
import 'package:full/screens/configuracoes_page.dart';
import 'package:full/screens/video_aula_page.dart';
import 'package:full/widgets/custom_app_bar.dart';
import 'package:full/screens/login_page.dart';
import 'package:full/screens/register_page.dart';
import 'package:full/screens/forgot_password_page.dart';
import 'package:full/screens/create_post_page.dart';
import 'package:full/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        '/perfil': (context) => const PerfilPage(),
        '/notificacoes': (context) => const NotificacoesPage(),
        '/configuracoes': (context) => ConfiguracoesPage(),
        '/register': (_) => const RegisterPage(),
        '/forgot': (_) => const ForgotPasswordPage(),
        '/create': (_) => const CreatePostPage(),
        '/login': (_) => const LoginPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const InicioScreen(key: Key('screen-inicio-post')),
    const VideoAulaPage(),
    const Center(
        child: const CreatePostPage(), key: Key('screen-postar-placeholder')),
    const GrupoScreen(key: Key('screen-grupos')),
    const ChatListScreen(key: Key('screen-chat')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Video Aulas'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Postar'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Grupos'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}
