import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;

  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_ctrl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();
  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D9F7),
      appBar: AppBar(
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5A026A),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFC9C9C9),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Color(0xFF5A026A),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 15.0,
                ),
                child: TextField(
                  controller: person_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Color(0xFFC9C9C9),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF5A026A),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (checked) {
                      //เขียนโค้ดเอาค่าที่ user เลือกที่ส่งมาให้ chacked มากำหนดให้กับ check_tip
                      setState(() {
                        check_tip = checked;
                        if (checked == false){
                          tip_ctrl.text = '' ;
                        }
                      });
                    },
                    value: check_tip,
                    activeColor: Color(0xFF5A026A),
                    side: BorderSide(
                      color: Color(0xFF5A026A),
                    ),
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 15.0,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFC9C9C9),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Color(0xFF5A026A),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: () {
                  //สร้างตัวแปรมาเก็บผมลัพธ์ที่ได้จากการคำนวณ
                  double? moneyshere = 0;

                  //ตรวจสอบและคำนวณ
                  if (money_ctrl.text.isEmpty) {
                    showWarningDialog(context, 'ป้อนเงินด้วย!!!!');
                    return;
                  } else if (person_ctrl.text.length == 0) {
                    showWarningDialog(context, 'ป้อนจำนวนคนด้วย!!!!');
                    return;
                  } else if (check_tip == false) {
                    //คำนวณแบบไม่มี tip
                    double? money = double.parse(money_ctrl.text);
                    int? person = int.parse(person_ctrl.text);
                    moneyshere = money / person;
                  } else {
                    //ตรวจสอบว่าแล้วได้ป้อน tip หรือยัง
                    if (tip_ctrl.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนทิปด้วย!!!!');
                    } else {
                      //คำนวณแบบมี tip
                      double? money = double.parse(money_ctrl.text);
                      int? person = int.parse(person_ctrl.text);
                      double? tip = double.parse(tip_ctrl.text);
                      moneyshere = (money+tip) / person;
                    }
                  }

                  //ส่งข้อมูลที่ป้อน และที่คำนวณได้ไปแสดงอึกหน้า ShowMoneyshareUI
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowmoneyshareUI(
                        money: double.parse(money_ctrl.text),
                        person: int.parse(person_ctrl.text),
                        tip: double.parse(tip_ctrl.text.isEmpty ? '0' : tip_ctrl.text),
                        moneyshare: moneyshere,
                      ),
                    ),
                  );
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Color(0xFF5A026A),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //กำหนดค่าของ TextField ทั้ง 3 ตัวให้ว่าง และ CheckBox ไม่ติ๊ก
                  setState(() {
                    money_ctrl.text = '';
                    person_ctrl.text = '';
                    tip_ctrl.text = '';
                    check_tip = false;
                  });
                },
                label: Text(
                  'ยกเลิก',
                ),
                icon: Icon(
                  FontAwesomeIcons.sync,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Colors.red,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Creted by NINNIN SAU',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
