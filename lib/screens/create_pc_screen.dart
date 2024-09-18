import 'package:flutter/material.dart';
import '../models/pc_gamer.dart';

class CreatePcScreen extends StatefulWidget {
  @override
  _CreatePcScreenState createState() => _CreatePcScreenState();
}

class _CreatePcScreenState extends State<CreatePcScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _pcData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a New PC Gamer'),
        backgroundColor: Colors.blueAccent,
        elevation: 10, // Sombra para darle profundidad al AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter Your PC Specs 💻',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Campos del formulario con más estilo
                _buildStyledTextField('PC Name', 'name'),
                _buildStyledTextField('Motherboard', 'motherboard'),
                _buildStyledTextField('Processor', 'processor'),
                _buildStyledTextField('Graphics Card', 'graphicsCard'),
                _buildStyledTextField('RAM', 'ram'),
                _buildStyledTextField('Power Supply', 'powerSupply'),
                _buildStyledTextField('Case', 'casePc'),
                SizedBox(height: 30),
                // Botón con diseño atractivo
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newPc = PcGamer(
                        name: _pcData['name']!,
                        motherboard: _pcData['motherboard']!,
                        processor: _pcData['processor']!,
                        graphicsCard: _pcData['graphicsCard']!,
                        ram: _pcData['ram']!,
                        powerSupply: _pcData['powerSupply']!,
                        casePc: _pcData['casePc']!,
                      );
                      Navigator.pop(context, newPc);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shadowColor: Colors.black.withOpacity(0.5),
                    elevation: 10, // Sombra para el botón
                  ),
                  child: Text('Create PC 🖥️'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget con más estilo para los TextFormField
  Widget _buildStyledTextField(String label, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.blueAccent, // Color del label
          ),
          filled: true,
          fillColor: Colors.blue[50], // Fondo suave en los campos
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blueAccent, width: 3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        onSaved: (value) {
          _pcData[key] = value!;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
