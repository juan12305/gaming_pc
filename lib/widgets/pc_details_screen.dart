import 'package:flutter/material.dart';
import '../models/pc_gamer.dart';

class PcDetailsScreen extends StatelessWidget {
  final PcGamer pcGamer;

  PcDetailsScreen({required this.pcGamer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pcGamer.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailCard('Motherboard', pcGamer.motherboard),
              _buildDetailCard('Processor', pcGamer.processor),
              _buildDetailCard('Graphics Card', pcGamer.graphicsCard),
              _buildDetailCard('RAM', pcGamer.ram),
              _buildDetailCard('Power Supply', pcGamer.powerSupply),
              _buildDetailCard('Case', pcGamer.casePc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String detail) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          detail,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

