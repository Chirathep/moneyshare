import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;

  //สร้างออปเจ็กต์เพื่อจะนำไปใช้ควบคุม TextField ในหน้าจอที่สร้างไว้
  TextEditingController? money_ctrl = TextEditingController();
  TextEditingController? person_ctrl = TextEditingController();
  TextEditingController? tip_ctrl = TextEditingController();

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
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        centerTitle: true,
        title: Text(
          'แชร์เงินกันเถอะ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 30,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงินบาท (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.purple[300],
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 20,
                ),
                child: TextField(
                  controller: person_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purple[300],
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (checked) {
                      setState(() {
                        check_tip = checked;
                      });
                    },
                    value: check_tip,
                    activeColor: Colors.purple[300],
                    side: BorderSide(
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 5,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.purple[300],
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (money_ctrl!.text.isEmpty) {
                    showWarningDialog(
                        context, 'กรุณาป้อนจำนวนเงินที่ต้องการแชร์');
                    return;
                  } else if (person_ctrl!.text.isEmpty) {
                    showWarningDialog(
                        context, 'กรุณาป้อนจำนวนคนที่ต้องการแชร์');
                    return;
                  } else if (check_tip == true) {
                    if (tip_ctrl!.text.isEmpty) {
                      showWarningDialog(
                          context, 'กรุณาป้อนจำนวนทิปที่ต้องการแชร์');
                      return;
                    } else {
                      //คำนวณ (money_ctrl+tip_ctrl)/person_ctrl
                    }
                  } else {
                    //คำนวณ money_ctrl/person_ctrl
                  }
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  primary: Color(0xff5a026a),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //เขียน Logic การทำงานโดยจะเคลียร์ค่าททุกอย่างบนหน้าจอ
                  //กลับมาเป็นเหมือนเดิม
                  setState(() {
                    money_ctrl!.clear();
                    person_ctrl!.clear();
                    tip_ctrl!.clear();
                    check_tip = false;
                  });
                },
                label: Text(
                  'ยกเลิก',
                ),
                icon: Icon(
                  Icons.refresh,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  primary: Color(0xffB21B1B),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Created by BC SAU 2021',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
