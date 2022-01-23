import 'package:flutter/material.dart';
import 'package:flutter_gym_app/Providers/DBExerciseProvider.dart';
import 'package:flutter_gym_app/Providers/exercissDetailsCounterProvider.dart';
import 'package:flutter_gym_app/models/exercise.dart';
import 'package:flutter_gym_app/utilities/customTextStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class ExercisesDetailsPage extends StatefulWidget {
  int dayId;
  int exId;
  String trainingName;
  ExercisesDetailsPage(this.dayId, this.exId, this.trainingName);
  @override
  _ExercisesDetailsPageState createState() => _ExercisesDetailsPageState();
}

class _ExercisesDetailsPageState extends State<ExercisesDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translator.translate("Exercise_Details_Page")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Consumer<ExercissDetailsCounterProvider>(
                builder: (_, value, child) {
              return CustomeContainer1(
                title:translator.translate("reached_number"),
                increase: value.numberIncrease,
                decrease: value.numberDecrease,
                textEditingController:
                    new TextEditingController(text: '${value.reachedNumber}'),
                textValue: '${value.reachedNumber}',
                type: 1,
              );
            }),
            SizedBox(
              height: 40.h,
            ),
            Consumer<ExercissDetailsCounterProvider>(
                builder: (_, value, child) {
              return CustomeContainer1(
                title: translator.translate("Targite_Number"),
                increase: value.targiteNumberIncrease,
                decrease: value.targiteNumberDecrease,
                textEditingController:
                    new TextEditingController(text: '${value.targiteNumber}'),
                textValue: '${value.targiteNumber}',
                type: 2,
              );
            }),
            SizedBox(
              height: 40.h,
            ),
            Consumer<ExercissDetailsCounterProvider>(
                builder: (_, value, child) {
              return CustomeContainer1(
                title:translator.translate("The_weight"),
                increase: value.weightIncrease,
                decrease: value.weightDecrease,
                textEditingController:
                    new TextEditingController(text: '${value.weight}'),
                textValue: '${value.weight}',
                type: 3,
              );
            }),
            SizedBox(
              height: 40.h,
            ),
            Consumer<ExercissDetailsCounterProvider>(
                builder: (_, value, child) {
              return CustomeContainer1(
                title: translator.translate("Calories_burned"),
                increase: value.caloriesBurnedIncrease,
                decrease: value.caloriesBurnedDecrease,
                textEditingController:
                    new TextEditingController(text: '${value.caloriesBurned}'),
                textValue: '${value.caloriesBurned}',
                type: 4,
              );
            }),
            SizedBox(
              height: 40.h,
            ),
            Consumer<ExercissDetailsCounterProvider>(
                builder: (_, value, child) {
              return CustomeContainer1(
                title:translator.translate("Food_Calories"),
                increase: value.caloriesFoodBIncrease,
                decrease: value.caloriesFoodDecrease,
                textEditingController:
                    new TextEditingController(text: '${value.caloriesFood}'),
                textValue: '${value.caloriesFood}',
                type: 5,
              );
            }),
            SizedBox(
              height: 60.h,
            ),
            CustomeButton(
              title: translator.translate("Save"),
              exercise: Exercise(
                  day_id: widget.dayId,
                  id: widget.exId,
                  trainingName: widget.trainingName),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  String title;

  Exercise exercise;
  CustomeButton({this.title, this.exercise});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          child: Text('$title'),
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue)),
          onPressed: () async {
            Exercise ex = new Exercise(
              id: exercise.id,
              day_id: exercise.day_id,
              trainingName: exercise.trainingName,
              reachedNumber: await context
                  .read<ExercissDetailsCounterProvider>()
                  .reachedNumber,
              targetNumber: await context
                  .read<ExercissDetailsCounterProvider>()
                  .targiteNumber,
              wight:
                  await context.read<ExercissDetailsCounterProvider>().weight,
              burnsCalories: await context
                  .read<ExercissDetailsCounterProvider>()
                  .caloriesBurned,
              foodCalorise: await context
                  .read<ExercissDetailsCounterProvider>()
                  .caloriesFood,
              done: 1,
            );
            await context.read<DBExerciseProvider>().updateExercise(ex);
            Fluttertoast.showToast(
                msg: "Saved successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green[100],
                textColor: Colors.white,
                fontSize: 16.0);
          }),
    );
  }
}

class CustomeContainer1 extends StatelessWidget {
  String title;
  TextEditingController textEditingController;
  Function increase;
  Function decrease;
  int type;
  String textValue;
  CustomeContainer1(
      {this.title,
      this.textEditingController,
      this.increase,
      this.decrease,
      this.type,
      this.textValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.yellow,
      height: 80.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 80.h,
            width: 150.w,
            //   color: Colors.red[200],
            child: Center(
                child: Text(
              '$title',
              style: CustomTextStyle.getcustomeBouldStyle(),
            )),
          ),
          CustomeContainer3(
            textEditingController: textEditingController,
            increase: increase,
            decrease: decrease,
            type: type,
            textValue: textValue,
          ),
        ],
      ),
    );
  }
}

class cutomeContainer2 extends StatelessWidget {
  TextEditingController textEditingController;
  int type;
  String textvalue;
  cutomeContainer2({this.textEditingController, this.type, this.textvalue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 50,
      child: TextField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        onChanged: (value) async {
          textEditingController.text = value;
          int newValue = int.parse(value);
          if (type == 1) {
            await context
                .read<ExercissDetailsCounterProvider>()
                .setNumer(newValue);
          } else if (type == 2) {
            await context
                .read<ExercissDetailsCounterProvider>()
                .settargiteNumber(newValue);
          } else if (type == 3) {
            await context
                .read<ExercissDetailsCounterProvider>()
                .setweight(double.parse(value));
          } else if (type == 4) {
            await context
                .read<ExercissDetailsCounterProvider>()
                .setcaloriesBurned(double.parse(value));
          } else if (type == 5) {
            await context
                .read<ExercissDetailsCounterProvider>()
                .setcaloriesFood(double.parse(value));
          }
        },
        decoration: InputDecoration(
          hintText: textvalue,
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

class CustomeContainer3 extends StatelessWidget {
  TextEditingController textEditingController;
  Function increase;
  Function decrease;
  int type;
  String textValue;

  CustomeContainer3(
      {this.textEditingController,
      this.increase,
      this.decrease,
      this.type,
      this.textValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.add), onPressed: () => increase()),
          SizedBox(
            width: 5.w,
          ),
          cutomeContainer2(
            textEditingController: textEditingController,
            type: type,
            textvalue: textValue,
          ),
          SizedBox(
            width: 5.w,
          ),
          IconButton(icon: Icon(Icons.remove), onPressed: () => decrease()),
        ],
      ),
    );
  }
}
