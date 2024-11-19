import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';

class ResultFlChart extends StatelessWidget {
  const ResultFlChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.9, // تحديد العرض النسبي
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barGroups: [
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                      width: 20, color: ColorManager.secondaryColor, toY: 40),
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    toY: 50,
                    width: 20,
                    color: ColorManager.secondaryColor,
                  ),
                ],
              ),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                    width: 22, color: ColorManager.secondaryColor, toY: 60),
              ]),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: 70,
                    width: 20,
                    color: ColorManager.secondaryColor,
                  ),
                ],
              ),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                  width: 22,
                  color: ColorManager.secondaryColor,
                  toY: 80,
                ),
              ]),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                      toY: 90, width: 20, color: ColorManager.secondaryColor),
                ],
              ),
            ],
            gridData: const FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), right: BorderSide()),
            ),
            titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      switch (value.toInt()) {
                        case 1:
                          return Text('الأول');
                        case 2:
                          return Text('الثاني');
                        case 3:
                          return Text('الثالث');
                        case 4:
                          return Text('الرابع');
                        case 5:
                          return Text('الخامس');
                        case 6:
                          return Text('السادس');
                        default:
                          return Text('');
                      }
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false))),
          ),
        ),
      ),
    );
  }
}
