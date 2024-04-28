import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Candidate {
  final String name;
  final String description;
  final String party;
  final String imageUrl;

  Candidate({
    required this.name,
    required this.description,
    required this.party,
    required this.imageUrl,
  });
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Candidate> candidates = [
    Candidate(
      name:'YERIMA ZIME Talata',
      description: 'Après des études en maths et sciences physique,décide de se lancer.',
      party: 'Union Progressiste',
      imageUrl:
          'https://talontalata.bj/upload/images/972300273440001617007285.jpg',
    ),
     Candidate(
      name:'YERIMA ZIME Talata',
      description: 'Après des études en maths et sciences physique,décide de se lancer.',
      party: 'Union Progressiste',
      imageUrl:
          'https://talontalata.bj/upload/images/972300273440001617007285.jpg',
    ),
     Candidate(
      name:'YERIMA ZIME Talata',
      description: 'Après des études en maths et sciences physique,décide de se lancer.',
      party: 'Union Progressiste',
      imageUrl:
          'https://talontalata.bj/upload/images/972300273440001617007285.jpg',
    ),
     Candidate(
      name:'YERIMA ZIME Talata',
      description: 'Après des études en maths et sciences physique,décide de se lancer.',
      party: 'Union Progressiste',
      imageUrl:
          'https://talontalata.bj/upload/images/972300273440001617007285.jpg',
    ),
   
   
  ];

  void addCandidate(Candidate candidate) {
    setState(() {
      candidates.add(candidate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elections '),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 202, 74),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FriendsPage(
                onCandidateAdded: addCandidate,
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 33, 187, 56),
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CandidateDetailsPage(candidate: candidates[index]),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      candidates[index].imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    candidates[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(candidates[index].description),
                      Text('Parti: ${candidates[index].party}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            Text(
              'Vote',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CandidateDetailsPage extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsPage({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Candidat'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              candidate.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                candidate.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(candidate.description),
            SizedBox(height: 10),
            Text(
              'Parti politique:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(candidate.party),
          ],
        ),
      ),
    );
  }
}

class FriendsPage extends StatelessWidget {
  final Function(Candidate) onCandidateAdded;

  FriendsPage({
    required this.onCandidateAdded,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController partyController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: partyController,
                decoration: InputDecoration(labelText: 'Parti politique'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un parti politique';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'URL de la photo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une URL de photo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Candidate candidate = Candidate(
                      name: nameController.text,
                      description: descriptionController.text,
                      party: partyController.text,
                      imageUrl: imageUrlController.text,
                    );
                    onCandidateAdded(candidate);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
