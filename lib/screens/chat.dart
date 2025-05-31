import 'package:flutter/material.dart';
import 'package:full/models/chat_model.dart';
import 'package:full/widgets/chat_card.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Chat> chats = [
      Chat(
        title: 'Revolução Francesa',
        lastMessage: 'Pessoal, hoje iniciaremos os estudos...',
        membersCount: 2,
        timeAgo: '2h atrás',
        avatarImage: 'assets/historia.jpg',
      ),
      Chat(
        title: 'Geometria',
        lastMessage: 'Alguém tem mais alguma dúvida?',
        membersCount: 4,
        timeAgo: '1h atrás',
        avatarImage: 'assets/matematica.jpg',
      ),
      Chat(
        title: 'Arte em Debate',
        lastMessage: 'Galera, qual a opinião de vocês sob...',
        membersCount: 1,
        timeAgo: '10min atrás',
        avatarImage: 'assets/lego.jpg',
      ),
      Chat(
        title: 'Arte Contemporânea',
        lastMessage: 'Venha viver a inovação! Obras que...',
        membersCount: 9,
        timeAgo: '8min atrás',
        avatarImage: 'assets/arte.jpg',
      ),
      Chat(
        title: 'Introdução a Natureza Morta',
        lastMessage: 'No conteúdo de hoje estudaremos...',
        membersCount: 1,
        timeAgo: '2min atrás',
        avatarImage: 'assets/fruta.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatCard(chat: chats[index]);
        },
      ),
    );
  }
}
