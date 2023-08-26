import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';


/// [SearchBar] is a custom search bar widget used to search and represents the search bar and its functionality.
class SearchBar extends StatefulWidget{
  SearchBar({required this.getSearchCallBack});
  Function getSearchCallBack;
  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>{
  final TextEditingController controller = TextEditingController(text: '');
  var selectedDate = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
    return Container(
      width: 671.w,
      height: 71,
      margin: const EdgeInsets.only(right: 16,left: 8),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
            fontSize: 20,
            color: Colors.black
        ),
        decoration: InputDecoration(
          hintText: "البحث",
          hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 168, 168, 168)
          ),
          hoverColor: Colors.transparent,
          fillColor: const Color.fromARGB(255, 239, 239, 239),
          filled: true,
          suffixIcon: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 54, 121, 175),
                shape: BoxShape.circle
            ),
            width: 35,
            height: 35,
            margin: EdgeInsets.symmetric(horizontal:8),
            child: RawMaterialButton(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(0),
              child: const Icon(
                Icons.date_range,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () => _selectDate(context),
            ),
          ),
          prefixIcon: SizedBox(
            height: 27,
            width: 27,
            child: RawMaterialButton(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              onPressed: (){
                widget.getSearchCallBack(controller.text);
              },
              child: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 168, 168, 168),
                size: 30,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(36.0)),
            borderSide: BorderSide(
                color: Colors.transparent
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(36.0)),
            borderSide: BorderSide(
                color: Colors.transparent
            ),
          ),
        ),
        onChanged: (String text){
          if(text.isEmpty){
            widget.getSearchCallBack("");
          }else {
            widget.getSearchCallBack(text);
          }
        },
        onSubmitted: (String text){
          widget.getSearchCallBack(controller.text);
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: HijriCalendar()
        ..hYear = HijriCalendar.now().hYear+5
        ..hMonth = 12
        ..hDay = 30,
      firstDate: HijriCalendar()
        ..hYear = 1357
        ..hMonth = 1
        ..hDay = 1,
      initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        controller.text = selectedDate.toString();
        widget.getSearchCallBack(controller.text);
      });
    }
  }
}