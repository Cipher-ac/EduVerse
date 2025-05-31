// lib/widgets/social_post_card.dart
import 'package:flutter/material.dart';

class SocialPostCard extends StatelessWidget {
  final String userName;
  final String userDescription;
  final String userProfileImage;
  final String postText;
  final String postImage;
  final String likesCount;
  final String commentsCount;
  final String sharesCount;

  const SocialPostCard({
    Key? key,
    required this.userName,
    required this.userDescription,
    required this.userProfileImage,
    required this.postText,
    required this.postImage,
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(userProfileImage),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(userDescription,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Seguir'),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            postText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Image.asset(
            postImage,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Image.asset('assets/like_emoji.png', width: 20, height: 20),
              const SizedBox(width: 4),
              Image.asset('assets/love_emoji.png', width: 20, height: 20),
              const SizedBox(width: 4),
              Text(likesCount),
              const SizedBox(width: 15),
              Text('$commentsCount comentários'),
              const SizedBox(width: 15),
              Text('$sharesCount compartilhamentos'),
            ],
          ),
        ),
        const Divider(height: 30, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionIcon(Icons.thumb_up_alt_outlined, 'Gostei'),
              _buildActionIcon(Icons.comment_outlined, 'Comentar'),
              _buildActionIcon(Icons.share_outlined, 'Compartilhar'),
              _buildActionIcon(Icons.send_outlined, 'Enviar'),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
      ],
    );
  }
}
