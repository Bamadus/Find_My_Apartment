import 'package:find_my_apartment/Data/pictures.dart';
import 'package:find_my_apartment/Domain/model/picture_model.dart';
import 'package:find_my_apartment/Presentation/routes/main_app/property_detail.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';

List<Picture> filteredProperties = [];

void searchQuery(String query) {
  setState(() {
    searchText = query;

    filteredProperties = demo_pic_list.where((property) {
      final title = property.title.toLowerCase();
      final location = property.location.toLowerCase();
      final search = query.trim().toLowerCase();

      return title.contains(search) ||
          location.contains(search);
    }).toList();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      appBar: AppBar(
      backgroundColor: const Color(0xffF8F7F4),
        title: const Text('Search Properties'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: 'searchBar', // Same tag as Home screen
              child: Material(
                color: Colors.transparent,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'search by categories(House, apart, etc)',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xff002855)
                      )
                    ),
                  ),
                  onChanged: searchQuery,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProperties.length,
                itemBuilder: (context, index) {
                final property = filteredProperties[index];
                return ListTile(
                leading: GestureDetector(
                  onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => PropertyDetail(
                          image_path: property.path,
                          prop_id: property.id,
                          title: property.title,
                          location: property.location,
                          price: property.price,
                         ),
                       ),
                       );
                       },
                  child: Hero(
                      tag: 'property_${property.id}',
                    child: Image.asset(
                    property.path,
                    width: 60,
                    fit: BoxFit.cover,
                                 ),
                  ),
                ),
                  title: Text(property.title),
                  subtitle: Text(property.location),
             );
          },
          ),
        )
          ],
        ),
      ),
    );
  }
}