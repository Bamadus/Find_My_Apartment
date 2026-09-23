import 'package:find_my_apartment/Presentation/routes/main_app/home/cat_model.dart';
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
  final List<Category_Items> items = [
    Category_Items(id: '1', label: 'Houses', content: Cat_Model()),
    Category_Items(id: '2', label: 'Apartments', content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Text("Apartment",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              child: Text("\$0",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),),
    Category_Items(id: '3', label: 'Offices', content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Text("Offices",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              child: Text("\$0",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),),
    Category_Items(id: '4', label: 'Town Houses', content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Text("Town Houses",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              child: Text("\$0",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),),
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

            // ---------- Row of ElevatedButtons ----------
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: items.map((item) {
                  final isActive = item.id == activeId;

                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
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
            // ---------- Content that swaps ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Column(
                  key: ValueKey(activeId),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeItem.label,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    activeItem.content
                  ],
                ),
              ),
            ),
          ],
        );
  }
}