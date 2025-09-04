import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Theophilus',
        'message': 'Do you have a different colour?',
        'time': '02:49',
        'avatar': 'https://i.pravatar.cc/150?img=1',
      },
      {
        'name': 'Martin',
        'message': 'Okay',
        'time': '03:42',
        'avatar': 'https://i.pravatar.cc/150?img=2',
      },
      {
        'name': 'Jane Cooper',
        'message': 'Can we negotiate on the price?',
        'time': '22:03',
        'avatar': 'https://i.pravatar.cc/150?img=3',
      },
      {
        'name': 'John Doe',
        'message': 'Can we negotiate on the price?',
        'time': 'Friday',
        'avatar': 'https://i.pravatar.cc/150?img=4',
      },
      {
        'name': 'Arlene McCoy',
        'message': 'Can we negotiate on the price?',
        'time': 'Thursday',
        'avatar': 'https://i.pravatar.cc/150?img=5',
      },
    ];

    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (_, __) => const Divider(indent: 72, endIndent: 16),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(chat['avatar']!),
                  ),
                  title: Text(chat['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    chat['message']!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    chat['time']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
