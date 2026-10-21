import 'package:find_my_apartment/Presentation/widgets/home/apart_cat_model.dart';
import 'package:find_my_apartment/Presentation/widgets/home/cat_model.dart';
import 'package:find_my_apartment/Presentation/widgets/home/office_cat_model.dart';
import 'package:find_my_apartment/Presentation/widgets/home/town_cat_model.dart';
import 'package:flutter/material.dart';

class Category_Items {
  final String id;
  final String label;
  final Widget content;

  Category_Items({required this.id, required this.label, required this.content});
}

class CategoryButton extends StatefulWidget {
  const CategoryButton({super.key});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  
  List<Category_Items> get items => [
    Category_Items(id: '1', label:"Houses",content: Cat_Model()), // Replace with your actual content widget, e.g., Cat_Model()
    Category_Items(id: '2', label:"Apartments", content: Apart_Cat_Model()), // Replace with your actual content widget, e.g., Apart_Cat_Model()
    Category_Items(id: '3', label:"Offices", content: Off_Cat_Model()), // Replace with your actual content widget, e.g., Cat_Model()
    Category_Items(id: '4', label:"Condos", content: Condo_Cat_Model()), // Replace with your actual content widget, e.g., Town_Cat_Model()
  ];

  // First item active by default
  late String activeId = items.first.id;

  Category_Items get activeItem => items.firstWhere((e) => e.id == activeId);

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: items.map((item) {
                  final isActive = item.id == activeId;
    
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child:
                     ElevatedButton(
                      onPressed: () => setState(() => activeId = item.id),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isActive ? Color(0xff212529) : Color(0xffF8F7F4),
                        foregroundColor:
                            isActive ? Colors.white : Colors.black87,
                        elevation: isActive ? 10 : 4,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(item.label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20,),
            activeItem.content,
          ],
        );
  }
}