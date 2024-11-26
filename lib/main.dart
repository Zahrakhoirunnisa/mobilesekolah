import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tab_screen.dart';
import 'dart:convert';

void main() {
runApp(
MaterialApp(
home: TabScreen(),
),
);
}


class MyApp extends StatelessWidget {
  Future<List<Info>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://ujikom2024pplg.smkn4bogor.sch.id/0072372411/informasi.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((user) => Info.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Sekolah'),
      ),
      body: FutureBuilder<List<Info>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final info = users[index];
              return ListTile(
                title: Text(info.idInfo),
                subtitle: Text(info.judulInfo),
              );
            },
          );
        },
      ),
    );
  }
}

class Info {
  final String idInfo;
  final String judulInfo;

  Info({required this.idInfo, required this.judulInfo});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      idInfo: json['id_info'],
      judulInfo: json['judul_info'],
    );
  }
}

class Gallery {
  final String url;

  Gallery({required this.url});

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      url: json['url'].toString(),  // Convert id to string if necessary
    );
  }
}

