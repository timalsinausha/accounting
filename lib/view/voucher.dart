import 'package:accountapp/theme/colors.dart';
import 'package:accountapp/theme/text.dart';
import 'package:accountapp/view/salesvoucherscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VouchersHome extends StatefulWidget {
  const VouchersHome({Key? key}) : super(key: key);

  @override
  State<VouchersHome> createState() => _VouchersHomeState();
}

class _VouchersHomeState extends State<VouchersHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // Specify the number of tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(Icons.menu),
        ),
        elevation: 0.7,
        bottom: TabBar(controller: _tabController, tabs: <Widget>[
          Tab(
            text: 'sales',
          ),
          Tab(
            text: 'Purchase',
          ),
          Tab(
            text: 'Receipt',
          ),
          Tab(
            text: 'Payment',
          )
        ]),
        title: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TallyAssist',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  'Beta',
                  style: TextStyle(
                    color: TassistWhite,
                    fontSize: 12,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              'Help?',
              style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
            ),
            Icon(FontAwesomeIcons.whatsapp),
          ],
        ),
        backgroundColor: TassistMenuBg,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: TassistBgLightPurple,
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
              child: Row(
                children: [
                  Text(
                    "Limit: last 2000 Vouchers",
                    style: secondaryListDisc.copyWith(color: TassistInfoGrey),
                  )
                ],
              ),
            ),
            height: 35,
          ),
          Expanded(
              child: TabBarView(
            children: <Widget>[
              SalesVoucherScreen(),
              SalesVoucherScreen(),
              SalesVoucherScreen(),
              SalesVoucherScreen(),
              // PurchaseVoucherScreen(),
              // ReceiptVoucherScreen(),
              // PaymentVoucherScreen(),
            ],
          ))
        ],
      )),
    );
  }
}
