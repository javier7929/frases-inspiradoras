import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(const FrasesInspiradorasApp());
}

class FrasesInspiradorasApp extends StatelessWidget {
  const FrasesInspiradorasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases Inspiradoras',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const FrasesScreen(),
    );
  }
}

class FrasesScreen extends StatefulWidget {
  const FrasesScreen({super.key});

  @override
  _FrasesScreenState createState() => _FrasesScreenState();
}

class _FrasesScreenState extends State<FrasesScreen> {
  final List<String> _frases = [
    "La vida es un 10% lo que te sucede y un 90% cómo reaccionas a ello.",
    "El éxito no es la clave de la felicidad. La felicidad es la clave del éxito.",
    "Nunca es demasiado tarde para ser quien podrías haber sido.",
    "Cree en ti mismo y en todo lo que eres.",
    "El único límite para nuestros logros de mañana son nuestras dudas de hoy.",
    "No sueñes tu vida, vive tus sueños.",
    "Haz de cada día tu obra maestra.",
    "La adversidad es la oportunidad de crecer.",
    "Cada pequeño paso cuenta hacia el éxito.",
    "No temas fallar, teme no intentarlo.",
    "La vida comienza al final de tu zona de confort.",
    "El éxito es la suma de pequeños esfuerzos repetidos día tras día.",
    "Sé el cambio que quieres ver en el mundo.",
    "Si puedes soñarlo, puedes lograrlo.",
    "El poder está en creer que puedes.",
  ];

  String _fraseActual = "Presiona el botón para obtener una frase inspiradora";
  int _contador = 0;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _reproducirMusicaDeFondo();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _reproducirMusicaDeFondo() async {
    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.play(AssetSource('audio/background_music.mp3'));
    } catch (e) {
      debugPrint('Error al reproducir música de fondo: $e');
    }
  }

  void _generarNuevaFrase() {
    final random = Random();
    setState(() {
      _fraseActual = _frases[random.nextInt(_frases.length)];
      _contador++;
    });
  }

  void _compartirFrase() {
    Share.share(_fraseActual, subject: "Frase Inspiradora del Día");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 10),
            const Text("Frases Inspiradoras"),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'), // Imagen de fondo
            fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Frase Inspiradora del Día",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Text(
                    _fraseActual,
                    key: ValueKey<String>(_fraseActual),
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Frases generadas: $_contador",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _generarNuevaFrase,
        label: const Text("Nueva Frase"),
        icon: const Icon(Icons.refresh),
        backgroundColor: const Color.fromARGB(255, 246, 181, 0),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 246, 181, 0),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                tooltip: 'Compartir',
                icon: const Icon(Icons.share),
                onPressed: _compartirFrase,
              ),
              IconButton(
                tooltip: 'Estadísticas',
                icon: const Icon(Icons.bar_chart),
                onPressed: () {}, // Funcionalidad futura
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
