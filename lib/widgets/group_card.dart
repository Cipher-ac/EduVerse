import 'package:flutter/material.dart';
import 'package:full/models/group_model.dart';

class GroupCard extends StatelessWidget {
  final Group group;

  const GroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), 
                  child: Image.asset(
                    group.imageUrl,
                    width: 90, 
                    height: 90, 
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 90,
                      height: 90,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error_outline, color: Colors.red, size: 40),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0, 
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6.0), 
                      Text(
                        group.description,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: group.isOnline ? Colors.green : Colors.grey,
                      size: 14, 
                    ),
                    const SizedBox(width: 6), 
                    Text(
                      group.isOnline ? "Online" : "Offline",
                      style: TextStyle(
                        fontSize: 13,
                        color: group.isOnline ? Colors.green[700] : Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12), 
                    Icon(Icons.people, color: Colors.blueGrey[400], size: 18),
                    const SizedBox(width: 6),
                    Text(
                      '${group.participants} pessoas',
                      style: TextStyle(fontSize: 13, color: Colors.blueGrey[700]),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.login, color: Colors.blue, size: 20),
                  label: const Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}