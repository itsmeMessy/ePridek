import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownStrand extends StatefulWidget {
  final Function(String) onStrandSelected; // Callback to return selected value

  const DropdownStrand({Key? key, required this.onStrandSelected}) : super(key: key);

  @override
  State<DropdownStrand> createState() => _DropdownStrand();
}

class _DropdownStrand extends State<DropdownStrand> {
  final jobRoleCtrl = TextEditingController();
  String? selectedStrand;

  Future<List<String>> strandmenu(String query) async {
    List<String> data = [
      'ABM (Accountancy Business and Management)',
      'TVL- HE (Home Economics)',
      'STEM (Science Technology Engineering and Mathematics)',
      'HUMSS (Humanities and Social Sciences)',
    ];

    return await Future.delayed(const Duration(seconds: 1), () {
      return data.where((e) {
        return e.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.searchRequest(
      futureRequest: strandmenu,
      fieldSuffixIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
        size: 20,
      ),
      selectedStyle: const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      ),
      hintText: 'Strand',
      hintStyle: GoogleFonts.inter(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 4.20,
        ),
      ),
      controller: jobRoleCtrl,
      fillColor: Colors.white.withOpacity(0.15),
      listItemStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Color(0xFF17153B),
        ),
      ),
      onChanged: (value) {
        setState(() {
          selectedStrand = value; // Update selected value
        });
        widget.onStrandSelected(selectedStrand!); // Call the callback
      },
    );
  }
}
