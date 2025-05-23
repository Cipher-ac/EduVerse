import 'dart:ui';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _senha = '';

  void _efetuarLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: implementar chamada de API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logando como $_email...')),
      );
    }
  }

  void _loginGoogle() {
    // implementar login Google dps
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Filtro de blur escuro
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.black.withOpacity(0.4),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Tela de Login',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  // Logo
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 32),

                  // Card de formulário
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // E-mail
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'E-mail',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.isEmpty || !v.contains('@')) {
                                return 'Informe um e-mail válido';
                              }
                              return null;
                            },
                            onSaved: (v) => _email = v!.trim(),
                          ),
                          const SizedBox(height: 16),

                          // Senha
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Senha',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            obscureText: true,
                            validator: (v) {
                              if (v == null || v.length < 6) {
                                return 'Senha deve ter ao menos 6 caracteres';
                              }
                              return null;
                            },
                            onSaved: (v) => _senha = v!,
                          ),
                          const SizedBox(height: 24),

                          // Botão Google
                          ElevatedButton.icon(
                            icon: Image.asset(
                              'assets/images/google_logo.png',
                              height: 24,
                            ),
                            label: const Text('Entrar com o Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              side: BorderSide(color: Colors.black),
                              elevation: 1,
                            ),
                            onPressed: _loginGoogle,
                          ),
                          const SizedBox(height: 16),

                          // Botão Acessar
                          ElevatedButton(
                            child: const Text('Acessar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5AC8FA),
                              foregroundColor: const Color(0xffffffff),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            onPressed: _efetuarLogin,
                          ),
                          const SizedBox(height: 12),

                          // Botão Cadastre-se
                          ElevatedButton(
                            child: const Text('Cadastre-se'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF007AFF),
                              foregroundColor: const Color(0xffffffff),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/register'),
                          ),
                          const SizedBox(height: 16),

                          // Link Esqueci senha
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/forgot'),
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                color: Color(0xFF5AC8FA),
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF5AC8FA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
