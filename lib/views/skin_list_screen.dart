import 'package:flutter/material.dart';
import '../viewmodels/skin_viewmodel.dart';
import '../widgets/skin_card.dart';

class SkinListScreen extends StatefulWidget {
  @override
  _SkinListScreenState createState() => _SkinListScreenState();
}

class _SkinListScreenState extends State<SkinListScreen> {
  final SkinViewModel viewModel = SkinViewModel();
  List<dynamic> filteredSkins = []; // List to hold filtered skins
  String searchQuery = ''; // Variable to hold the search query

  @override
  void initState() {
    super.initState();
    // Initially, the filtered list is the same as the original list
    filteredSkins = viewModel.skins;
  }

  void _filterSkins(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredSkins = viewModel.skins; // Reset to original list if query is empty
      } else {
        filteredSkins = viewModel.skins
            .where((skin) => skin.name.toLowerCase().contains(query.toLowerCase()))
            .toList(); // Replace 'name' with the actual property of your skin model
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0,
        title: Text(
          "Skins List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[700]!,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                  ),
                  onChanged: _filterSkins, // Call the filter function on text change
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.builder(
                  itemCount: filteredSkins.length, // Use filtered list for item count
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return SkinCard(skin: filteredSkins[index]); // Use filtered list
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
