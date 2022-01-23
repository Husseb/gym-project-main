import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gym_app/models/ChartItem.dart';
import 'package:flutter_gym_app/utilities/customTextStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chart extends StatefulWidget {
  List<ChartItem> listChartItem;
  Chart(this.listChartItem);
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<PieChartSectionData> _sections = List<PieChartSectionData>();
  @override
  void initState() {
    PieChartSectionData _item1 = PieChartSectionData(
        color: Colors.blue,
        value: widget.listChartItem[0].value,
        title: '${widget.listChartItem[0].value}%',
        radius: 50,
        titleStyle: CustomTextStyle.getcustomeBouldStyle());
    PieChartSectionData _item2 = PieChartSectionData(
        color: Colors.redAccent,
        value: widget.listChartItem[1].value,
        title: '${widget.listChartItem[1].value}%',
        radius: 50,
        titleStyle: CustomTextStyle.getcustomeBouldStyle());
    PieChartSectionData _item3 = PieChartSectionData(
        color: Colors.deepPurple,
        value: widget.listChartItem[2].value,
        title: '${widget.listChartItem[2].value}%',
        radius: 50,
        titleStyle: CustomTextStyle.getcustomeBouldStyle());
    PieChartSectionData _item4 = PieChartSectionData(
        color: Colors.greenAccent,
        value: widget.listChartItem[3].value,
        title: '${widget.listChartItem[3].value}%',
        radius: 50,
        titleStyle: CustomTextStyle.getcustomeBouldStyle());
    _sections = [_item1, _item2, _item3, _item4];
    super.initState();
  }

  @override
  Widget build(BuildContext context) { ScreenUtil.init(
    BoxConstraints(
      maxHeight: 640.0,
      minHeight: 640.0,
      maxWidth: 360.0,
      minWidth:  360.0,
    ),
    context: context,
    orientation: Orientation.portrait,
    splitScreenMode: false,
    designSize: ScreenUtil.defaultSize,
    minTextAdapt: false,
  );
    // ScreenUtil.init(context,
    //     width: 360.0, height: 640.0, allowFontScaling: true);
    return Container(
      height: 250.h,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: PieChart( 
          PieChartData(
              sections: _sections, borderData: FlBorderData(show: false)),
        ),
      ),
    );
  }
}
