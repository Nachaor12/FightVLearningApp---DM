import 'dart:io';
import 'package:fightvlearning_app/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fightvlearning_app/screen/preferences.dart';
import 'package:fightvlearning_app/entity/question.dart';
import 'package:fightvlearning_app/provider/appdata.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:convert';


class FeedbackSection extends StatefulWidget {
  const FeedbackSection({super.key});

  @override
  State<FeedbackSection> createState() => _FeedbackSectionState();
}

class _FeedbackSectionState extends State<FeedbackSection> {
  Map<String, List<Question>> preguntasPorCategoria = {};
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarPreguntas();
  }

  Future<void> cargarPreguntas() async {
    final jsonStr = await rootBundle.loadString('assets/text/feeback_questions.json');
    final Map<String, dynamic> data = json.decode(jsonStr);
    setState(() {
      preguntasPorCategoria = data.map((categoria, listaPreguntas) {
        final preguntas = (listaPreguntas as List)
            .map((item) => Question.fromJson(item))
            .toList();
        return MapEntry(categoria, preguntas); 
      });
    });
  }

  Future<String> generarCuerpoFeedback(String nombre) async {
    String cuerpo = "Identificación: $nombre\n\n";

    preguntasPorCategoria.forEach((categoria, preguntas) {
      cuerpo += "=== $categoria ===\n";
      for (var p in preguntas) {
        cuerpo += "${p.titulo}\nValor: ${p.valor}/5\n\n";
      }
    });

    return cuerpo;
  }

  Future<void> abrirGmailConTexto(String cuerpo) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'nachoar.12.73.19@gmail.com',
      query: Uri.encodeFull('subject=Feedback usuario FVLA&body=$cuerpo'),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir el cliente de correo.')),
      );
    }
  }
  

  void _compartirFeedback() async {
    final nombre = nameController.text.trim();
    final cuerpo = await generarCuerpoFeedback(nombre);

    final directory = (await getApplicationDocumentsDirectory()).path;
    final filePath = '$directory/feedback_usuario.txt';
    final file = File(filePath);
    await file.writeAsString(cuerpo);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        text: 'Destinatario: nachoar.12.73.19@gmail.com\n\nHola, adjunto el archivo de retroalimentación generado por la app.\n\nAquí añada algún comentario o sugerencia para la app: ',
        subject: 'Feedback usuario FVLA',
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (preguntasPorCategoria.isEmpty) {
      return Scaffold(
        body: const Center(child: CircularProgressIndicator()),
      );
      
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu opinión', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ...preguntasPorCategoria.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(entry.key.toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...entry.value.map((p) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 15,),
                            Expanded(child: Text(p.titulo),)
                          ],
                        ),
                        Slider(
                          value: p.valor.toDouble(),
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: '  ${p.valor} estrellas  ',
                          onChanged: (value) {
                            setState(() {
                              p.valor = value.toInt();
                            });
                          },
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(child: Column(children: [Text('De: ${p.min}'),Text('A: ${p.max}')],),),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }),
                  const Divider(),
                ],
              );
            }),//.toList(),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: _compartirFeedback,
          child: const Text('Enviar retroalimentación'),
        ),
      ],
    );
  }
}


class AboutPage extends StatelessWidget{
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
        backgroundColor: const Color.fromARGB(255, 36, 131, 186),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 30,),
              Expanded(child: Text('Esta aplicación fue creada y desarrollada \ncon el fin de proporcionar al publico\n'
                    'la opcion de aprender de una mejor \nmanera las tecnicas y practicas necesarias\n'
                    'para aprender más facilmente los diferentes\nvideojuegos de pelea con los que\n'
                    'cuenta la aplicacion.', style: TextStyle(fontSize: 18),),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 30,),
              Text('Esta aplicacion fue diseña y desarrollada \npor Ignacio Alfaro Rojas.', style: TextStyle(fontSize: 18),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 30,),
              Text('Para enviar sugerencias, quejas, \nreclamos, solicitudes y demás, favor \nde hablar con el siguiente contacto.', style: TextStyle(fontSize: 18),),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            children: [
              SizedBox(width: 30,),
              Text('Email: nachoar.12.73.19@gmail.com\n\nNúmero: 945454918', style: TextStyle(fontSize: 18),),
            ],
          )
        ],
      ),
      drawer: Consumer<AppData>(
        builder: (context, appData, _) => Drawer(
          child: Builder(
            builder: (context) => ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(context.watch<AppData>().newNameUser), 
                  accountEmail: Text(context.watch<AppData>().newEmailUser),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: context.watch<AppData>().userEmptyImage
                  ),
                  
                ),
                const Divider(height: 0.1,),
                ListTile(title: const Text('Inicio'), leading: Icon(Icons.home), onTap: () { Navigator.pop(context); 
                    context.read<AppData>().tabIndex = 0;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio',)));
                  },
                ),
                const Divider(height: 0.1,),
                ListTile(title: const Text('Mis juegos'), leading: Icon(Icons.sports_esports), onTap: () { Navigator.pop(context); 
                    context.read<AppData>().tabIndex = 1;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio',)));
                  },
                ),
                const Divider(height: 0.1,),
                ListTile(title: const Text('Perfil'), leading: Icon(Icons.person), onTap: () { Navigator.pop(context);
                    context.read<AppData>().tabIndex = 2;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio',)));
                  },
                ),
                const Divider(height: 0.1,),
                ListTile(title: const Text('Preferencias'), leading: Icon(Icons.settings), onTap: () { Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PreferencesPage()));
                  },
                ),
                const Divider(height: 0.1,),
                ListTile(title: const Text('Acerca de'), leading: Icon(Icons.info), onTap: () { Navigator.pop(context);
                  },
                ),
                const Divider(height: 0.1,),
              ],
            ),
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackSection()));
        }, child: Text('Realizar encuesta')),
      ],
    );
  }
}