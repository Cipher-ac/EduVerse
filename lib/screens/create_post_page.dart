import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  File? _mediaFile;
  final TextEditingController _descController = TextEditingController();

  /// Retorna true se o arquivo tiver extensão de vídeo
  bool _isVideo(String path) {
    final ext = path.toLowerCase();
    return ext.endsWith('.mp4') ||
        ext.endsWith('.mov') ||
        ext.endsWith('.avi') ||
        ext.endsWith('.mkv');
  }

  /// Pergunta ao usuário se quer foto ou vídeo
  Future<void> _pickMedia() async {
    final picker = ImagePicker();

    final escolha = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Foto'),
              onTap: () => Navigator.pop(context, 'image'),
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Vídeo'),
              onTap: () => Navigator.pop(context, 'video'),
            ),
          ],
        ),
      ),
    );

    if (escolha == null) return;

    XFile? picked;
    if (escolha == 'image') {
      picked = await picker.pickImage(source: ImageSource.gallery);
    } else {
      picked = await picker.pickVideo(source: ImageSource.gallery);
    }

    if (picked != null) {
      final path = picked.path;
      setState(() {
        _mediaFile = File(path);
      });
    }
  }

  void _postar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Seu post foi enviado!')),
    );
    // falta upload para seu backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AC8FA),
      body: Container(
        color: const Color(0xFFE8F8FF),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // área de seleção e preview
          GestureDetector(
            onTap: _pickMedia,
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFBDBDBD)),
              ),
              child: _mediaFile == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.image_outlined,
                            size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Adicione um vídeo ou uma foto',
                            style: TextStyle(color: Colors.black54)),
                      ],
                    )
                  : _isVideo(_mediaFile!.path)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.videocam, size: 48, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('Vídeo selecionado',
                                style: TextStyle(color: Colors.black54)),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            _mediaFile!,
                            width: double.infinity,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
            ),
          ),
          const SizedBox(height: 16),
          // campo de descrição
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _descController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Corpo do post ou título do vídeo',
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _postar,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5AC8FA),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text('Postar', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
