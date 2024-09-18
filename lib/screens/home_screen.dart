import 'package:flutter/material.dart';
import 'package:pc_gamer/widgets/pc_details_screen.dart';
import '../models/pc_gamer.dart';
import 'create_pc_screen.dart';
import '../widgets/pc_list_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PcGamer> pcList = [];

  void _addPc(PcGamer pcGamer) {
    setState(() {
      pcList.add(pcGamer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PC Gamer Builder',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.teal,
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality if needed
            },
          ),
        ],
      ),
      body: pcList.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.computer, size: 80, color: Colors.teal),
                    SizedBox(height: 20),
                    Text(
                      'No PCs created yet!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: pcList.length,
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      pcList[index].name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Tap to view details',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.computer, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PcDetailsScreen(
                            pcGamer: pcList[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPc = await Navigator.push<PcGamer>(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePcScreen(),
            ),
          );
          if (newPc != null) {
            _addPc(newPc);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        tooltip: 'Add New PC',
      ),
    );
  }
}
