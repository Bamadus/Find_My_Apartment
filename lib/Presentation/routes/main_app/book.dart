import 'package:find_my_apartment/Presentation/routes/main_app/messages.dart';
import 'package:flutter/material.dart';

class Book_Inspect extends StatefulWidget {
  const Book_Inspect({super.key});

  @override
  State<Book_Inspect> createState() =>
      _Book_InspectState();
}

class _Book_InspectState
    extends State<Book_Inspect> {

  DateTime? selectedDate;

  Future<void> pickDate() async {
    final pickedDate = await showDatePicker(
      barrierColor: const Color(0xffF8F7F4),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2090),
      helpText: 'Choose Inspection Date',
    );

    if (!mounted) return;

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      appBar: AppBar(
      backgroundColor: const Color(0xffF8F7F4),
        title: const Text('Book Inspection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'When would you like to inspect this property?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextFormField(
              readOnly: true,
              onTap: pickDate,
              decoration: InputDecoration(
                hintText: selectedDate == null
                    ? 'Choose a date'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                prefixIcon: const Icon(
                  Icons.calendar_month,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xff002855)
                      )
                      )
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: selectedDate == null
                  ? null
                  : () {
                      Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: 
                       (context) => const Messages(
                        inspectionDate: selectedDate, propertyId: '',
                        ) )
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left:30, right: 30, top: 15,bottom: 15),
                      backgroundColor: Color(0xff212529),
                      foregroundColor: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        )
                      )
                    ),
              child: const Text('Continue',
              style: TextStyle(
                fontSize: 18,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}