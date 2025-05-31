// lib/screens/inicio.dart
import 'package:flutter/material.dart';
import 'package:full/widgets/social_post_card.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SocialPostCard(
            userName: 'Jefferson dos Santos',
            userDescription: 'Professor de História da Arte (UFPA)',
            userProfileImage: 'assets/jeff.png',
            postText:
                'Venha trocar ideias e se inspirar no mundo da arte! junte-se a Arte em Debate para discussões criativas e descontraídas.',
            postImage: 'assets/lego.jpg',
            likesCount: '956',
            commentsCount: '112',
            sharesCount: '57',
          ),
          Divider(height: 20, thickness: 8, color: Colors.grey),
          SocialPostCard(
            userName: 'Julia Mendes',
            userDescription: 'Artista Visual e Designer',
            userProfileImage: 'assets/jul.jpg',
            postText:
                'A matemática está em tudo ao nosso redor, ajudando a entender o mundo e a resolver problemas. Vamos explorar o poderdos números juntos!🚀',
            postImage: 'assets/papel.jpg',
            likesCount: '1.2K',
            commentsCount: '205',
            sharesCount: '88',
          ),
        ],
      ),
    );
  }
}
