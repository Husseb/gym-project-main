import 'package:flutter/material.dart';
import 'package:flutter_gym_app/Providers/DBDayProvider.dart';
import 'package:flutter_gym_app/Providers/DBExerciseProvider.dart';
import 'package:flutter_gym_app/Providers/trainingPageCounter.dart';
import 'package:flutter_gym_app/models/day.dart';
import 'package:flutter_gym_app/models/exercise.dart';
import 'package:flutter_gym_app/ui/statistic.dart';
import 'package:flutter_gym_app/ui/trainingTypePage.dart';
import 'package:flutter_gym_app/utilities/DialogPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Day> days = [];

  getAllDays() async {
    await context.read<DBDayProvider>().getAllDays();
  }

  initExercises(int dayId) async {
    List<Exercise> exxersises = [
      Exercise(
          trainingName: "Back",
          day_id: dayId,
          done: 0,
          burnsCalories: 0.0,
          wight: 0.0,
          foodCalorise: 0.0,
          reachedNumber: 0,
          targetNumber: 0,
          url: 'assets/images/back.jpg'),
      Exercise(
          trainingName: "Leg ",
          day_id: dayId,
          done: 0,
          burnsCalories: 0.0,
          wight: 0.0,
          foodCalorise: 0.0,
          reachedNumber: 0,
          targetNumber: 0,
          url: 'assets/images/leg.jpg'),
      Exercise(
          trainingName: "Shoulders",
          day_id: dayId,
          done: 0,
          burnsCalories: 0.0,
          wight: 0.0,
          foodCalorise: 0.0,
          reachedNumber: 0,
          targetNumber: 0,
          url: 'assets/images/shoulder.jpg'),
      Exercise(
          trainingName: "Chest",
          day_id: dayId,
          done: 0,
          burnsCalories: 0.0,
          wight: 0.0,
          foodCalorise: 0.0,
          reachedNumber: 0,
          targetNumber: 0,
          url: 'assets/images/chest.jpg'),
      Exercise(
          trainingName: "Arm  ",
          day_id: dayId,
          done: 0,
          burnsCalories: 0.0,
          wight: 0.0,
          foodCalorise: 0.0,
          reachedNumber: 0,
          targetNumber: 0,
          url: 'assets/images/arm.jpg'),
      Exercise(
          trainingName: "Cardio",
          day_id: dayId,
          done: 0,
          burnsCalories: 0.0,
          wight: 0.0,
          foodCalorise: 0.0,
          reachedNumber: 0,
          targetNumber: 0,
          url: 'assets/images/cardio.jpg'),
    ];
    await context.read<DBExerciseProvider>().insertIntoDatabase(exxersises[0]);
    await context.read<DBExerciseProvider>().insertIntoDatabase(exxersises[1]);
    await context.read<DBExerciseProvider>().insertIntoDatabase(exxersises[2]);
    await context.read<DBExerciseProvider>().insertIntoDatabase(exxersises[3]);
    await context.read<DBExerciseProvider>().insertIntoDatabase(exxersises[4]);
    await context.read<DBExerciseProvider>().insertIntoDatabase(exxersises[5]);
  }

  @override
  void initState() {
    getAllDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<DBDayProvider>(context, listen: true);
    // ScreenUtil.init(
    //   BoxConstraints(),
    // );
    ScreenUtil.init(
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
    return days == null
        ? Container()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(translator.translate("Trainings")),
              leading: IconButton(
                  icon: Icon(Icons.stacked_bar_chart),
                  onPressed: () {
                    Get.to(Statistic());
                  }),
              actions: [
                IconButton(
                    icon: Icon(Icons.g_translate_outlined),
                    onPressed: () {
                      translator.setNewLanguage(
                        context,
                        newLanguage:
                            translator.activeLanguageCode == 'ar' ? 'en' : 'ar',
                        remember: true,
                        restart: true,
                      );
                    }),
              ],
            ),
            body: Consumer<DBDayProvider>(
              builder: (_, value, child) {
                return ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                        onTap: () async {
                          print(value.dayes[index].weight);
                          await context
                              .read<TainingPageCounterProvider>()
                              .setWaterCounter(value.dayes[index].literOfWater);
                          await context
                              .read<TainingPageCounterProvider>()
                              .setwight(value.dayes[index].weight);
                          dynamic values = await context
                              .read<DBExerciseProvider>()
                              .isExsisteInDatabase(value.dayes[index].id);
                          print(values);
                          if (values == 0) {
                            await initExercises(value.dayes[index].id);
                          } else {}

                          Get.to(TrainingTypePage(day: value.dayes[index]));
                        },
                        child: CustomeContainer(value.dayes[index])),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: value.dayes.length);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                var now = new DateTime.now();
                String dayName = DateFormat('EEEE').format(now);
                String date = DateFormat('d MMM, yyyy').format(now);
                Day day = Day(
                    dayName: dayName,
                    dateOfDate: date,
                    weight: 0,
                    literOfWater: 0.0);
                await context.read<DBDayProvider>().insertIntoDatabase(day);
                Fluttertoast.showToast(
                    msg: translator.translate("Added_successfully"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green[100],
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}

class CustomeContainer extends StatefulWidget {
  Day day;

  CustomeContainer(this.day);

  @override
  _CustomeContainerState createState() => _CustomeContainerState();
}

class _CustomeContainerState extends State<CustomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(
            Icons.date_range_rounded,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            children: [
              Text(
                "${widget.day.dayName}",
                style: TextStyle(
                  color: Colors.blue[300],
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text("${widget.day.dateOfDate}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  )),
            ],
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              onPressed: () async {
                CustomeDialog.showMyDialog(context, widget.day);
              }),
        ],
      ),
    );
  }
}
