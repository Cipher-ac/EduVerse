import 'package:flutter/material.dart';
import 'package:full/models/group_model.dart';
import 'package:full/widgets/group_card.dart';

class GrupoScreen extends StatefulWidget {
  const GrupoScreen({super.key});

  @override
  State<GrupoScreen> createState() => _GrupoScreenState();
}

class _GrupoScreenState extends State<GrupoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabTitles = ['Abertos', 'Meus Grupos', 'Criar'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], 
      
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [ 
                  BoxShadow(
                    color: Colors.blue.shade50.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), 
                  ),
                ],
              ),
              child: Row(
                children: List.generate(_tabTitles.length, (index) {
                  final isSelected = _tabController.index == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _tabController.animateTo(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blueAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            _tabTitles[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 20), 
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                OpenGroupsScreen(),
                MyGroupsScreen(),
                CreateGroupScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const List<Group> openGroups = [
  Group(
    imageUrl: 'assets/russia.jpg',
    title: 'Revolução Russa',
    description: 'Grupo de estudos de História para estudar o período, o contexto e as consequências da revolução russa.',
    participants: 14,
    isOnline: true,
  ),
  Group(
    imageUrl: 'assets/pintura.jpg',
    title: 'Artes - 8º Ano',
    description: 'Grupo de estudantes do 8º ano que procuram revisar os assuntos de arte de suas escolas...',
    participants: 0,
    isOnline: false,
  ),
  Group(
    imageUrl: 'assets/linguagem.jpg',
    title: 'Programadores C#',
    description: 'Estudo, desenvolvimento e correção de erros na linguagem C#, nossa comunidade busca ajudar os amantes de C#',
    participants: 23,
    isOnline: true,
  ),
  Group(
    imageUrl: 'assets/ingles.jpg',
    title: 'Inglês - Belém',
    description: 'Pessoas de todas as idades tentando aprender inglês. Grupo exclussivo para Belenenses.',
    participants: 0,
    isOnline: false,
  ),
];

class OpenGroupsScreen extends StatelessWidget {
  const OpenGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: openGroups.length,
      itemBuilder: (context, index) {
        return GroupCard(group: openGroups[index]);
      },
    );
  }
}

class MyGroupsScreen extends StatelessWidget {
  const MyGroupsScreen({super.key});

  static const List<Group> myGroups = [
    Group(
      imageUrl: 'assets/historia.jpg',
      title: 'Revolução Francesa - Hi...',
      description: 'Grupo dedicado ao estudo e debates sobre a Revolução Francesa, esplorando seus impactos sociais, políticos e culturais.',
      participants: 18,
      isOnline: true,
    ),
    Group(
      imageUrl: 'assets/lego.jpg',
      title: 'Arte em Debate',
      description: 'O "Arte em depate" é decontraido e cheio de energia, onde trocamos ideias sobre tudo o que envolve o mundo da arte!o mundo da arte.',
      participants: 0,
      isOnline: false,
    ),
    Group(
      imageUrl: 'assets/matematica.jpg',
      title: 'Geometria - Matemática',
      description: 'Grupo dedicado a explorar o universo da geometria de forma divertida e acessivel.',
      participants: 0,
      isOnline: false,
    ),
    Group(
      imageUrl: 'assets/arte.jpg',
      title: 'Arte Contemporânea',
      description: 'Grupo focado na arte contemporânea e experimental, onde exploramos novas linguagens e técnicas inovadoras.',
      participants: 12,
      isOnline: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myGroups.length,
      itemBuilder: (context, index) {
        return GroupCard(group: myGroups[index]);
      },
    );
  }
}

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<bool> _isPublic = [true, false];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createGroup() {
    final groupName = _nameController.text;
    final groupDescription = _descriptionController.text;
    final visibility = _isPublic[0] ? 'Público' : 'Privado';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Grupo "$groupName" criado como $visibility!')),
    );

    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _isPublic = [true, false];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, size: 60, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nome do grupo',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Descrição do grupo',
              alignLabelWithHint: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ToggleButtons(
              isSelected: _isPublic,
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < _isPublic.length; i++) {
                    _isPublic[i] = i == index;
                  }
                });
              },
              borderRadius: BorderRadius.circular(8),
              selectedColor: Colors.white,
              color: Colors.blueGrey,
              fillColor: Colors.blue,
              splashColor: Colors.lightBlueAccent,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Público', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Privado', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _createGroup,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Criar', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}