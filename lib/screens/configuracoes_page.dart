import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  final Color primaryBlue = const Color(0xFF2196F3); 
  final Color accentBlue = const Color(0xFF64B5F6); 
  final Color textColor = Colors.white;
  final Color iconColor = Colors.white; 
  final double buttonRadius = 16.0; 
  final double buttonVerticalPadding = 18.0; 
  final double iconSize = 26.0; 
  final double textSize = 17.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Configurações",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: primaryBlue,
        iconTheme: const IconThemeData(color: Colors.white), 
        elevation: 4.0, 
        centerTitle: true, 
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildConfigButton(
            Icons.person,
            'Configurações da Conta',
            () {
              Navigator.pushNamed(context, '/conta');
            },
          ),
          _buildConfigButton(
            Icons.lock_outline,
            'Configurações de Segurança',
            () {
              Navigator.pushNamed(context, '/seguranca');
            },
          ),
          _buildConfigButton(
            Icons.visibility,
            'Configurações de Visibilidade',
            () {
              Navigator.pushNamed(context, '/visibilidade');
            },
          ),
          _buildConfigButton(
            Icons.privacy_tip,
            'Configurações de Privacidade',
            () {
              Navigator.pushNamed(context, '/privacidade');
            },
          ),
          _buildConfigButton(
            Icons.notifications,
            'Configurações de Notificações',
            () {
              Navigator.pushNamed(context, '/notificacoes');
            },
          ),
          _buildConfigButton(
            Icons.accessibility_new,
            'Configurações de Acessibilidade',
            () {
              Navigator.pushNamed(context, '/acessibilidade');
            },
          ),
          _buildConfigButton(
            Icons.help_outline,
            'Central de Ajuda',
            () {
              Navigator.pushNamed(context, '/ajuda');
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Saindo da conta...')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
              ),
              elevation: 2.0,
            ),
            child: Text(
              'Sair da Conta',
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigButton(
      IconData icon, String label, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: iconColor, size: iconSize),
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: accentBlue, 
          elevation: 2,
          padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding, horizontal: 16),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius), 
          ),
          splashFactory: InkRipple.splashFactory,
        ),
      ),
    );
  }
}
