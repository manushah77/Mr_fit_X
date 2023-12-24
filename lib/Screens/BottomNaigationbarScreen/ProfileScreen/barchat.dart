import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BarChartSample extends StatefulWidget {
  String? category;

  BarChartSample({required this.category, Key? key}) : super(key: key);

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  double categoryValue = 0.0;

  Future retrieveSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      categoryValue = prefs.getDouble('${widget.category}') ?? 0;
    });
    print('asdajh uhahduhai ${widget.category}');
  }

  @override
  void initState() {
    super.initState();
    retrieveSharedData();
  }

  // Method to update the category dynamically
  void updateCategory(String newCategory) {
    setState(() {
      widget.category = newCategory;
      retrieveSharedData();
    });
  }

  @override
  void didUpdateWidget(covariant BarChartSample oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      retrieveSharedData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: BarChart(
        BarChartData(
          maxY: 100,
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TileMode) {
                  return Text(
                    '${value.toInt()}',
                    style: TextStyle(color: Colors.white,fontSize: 11),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TileMode) {
                  return Text(
                    '${value.toInt()}',
                    style: TextStyle(color: Colors.white,fontSize: 11),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TileMode) {
                  return Text('');
                },
              ),
            ),
          ),
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white30, width: 1),
          ),
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  color: widget.category == 'Shoulder'
                      ? Colors.red
                      :  widget.category == 'Chest'
                          ? Colors.blue
                          :  widget.category == 'Lower Abs'
                              ? Colors.green
                              : Colors.orange,
                  toY: double.parse(categoryValue.toString()),
                  width: 40,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    topLeft: Radius.circular(3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
