import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';
import 'package:workout_project/controller/auth_controller.dart';
import 'package:workout_project/controller/data_controller.dart';
import 'package:workout_project/pages/sign_in_page.dart';
import 'package:workout_project/service/payment_service.dart';
import 'package:workout_project/widgets.dart';
import 'package:workout_project/constants.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {

  DataController dataController = Get.find();

  late String title = "";
  late String email= "";
  late String phone ="";
  late int joinDate=0;

  bool existingCardVisibility = false;
  List cards = [
    {
      'cardNumber': '4242424242424242',
      'expireDate': '04/24',
      'cardHolderName': 'Zeshan ul Haq',
      'cvvCode': '424',
      'showCardBack': false,
    },
    {
      'cardNumber': '3434343422456575',
      'expireDate': '21/24',
      'cardHolderName': 'Atiq ur Rehman',
      'cvvCode': '762',
      'showCardBack': false,
    },
  ];

  onItemPress(BuildContext context, int index) async {
    if (index == 0) {
      setState(() {
        existingCardVisibility = false;
      });
      var response =
          await StripeService.payWithNewCard(amount: '150', currency: 'USD');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration:
              Duration(milliseconds: response.success == true ? 1200 : 3000),
        ),
      );
    } else if (index == 1) {
      setState(() {
        existingCardVisibility = !existingCardVisibility;
      });
    }
  }

  payViaExistingCard(BuildContext context, card) {
    var response = StripeService.payVaiExistingCard(
        amount: '150', currency: 'USD', card: card);
    if (response.success) {
      Scaffold.of(context)
          .showSnackBar(
            SnackBar(
              content: Text(response.message),
              duration: const Duration(milliseconds: 1200),
            ),
          )
          .closed
          .then((_) {
        setState(() {
          existingCardVisibility = false;
        });
      });
    }
  }

  UIUpdate() async{
    var response = await dataController.UserData();

    setState(() {
      title = response.docs[0]['user_name'];
      email = response.docs[0]['email'];
      phone = response.docs[0]['phone'];
      joinDate = response.docs[0]['joinDate'];
    });
    print("inside Response: UserName is " + response.docs[0]['joinDate']);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeService.init();
    UIUpdate();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double myHeight = MediaQuery.of(context).size.height - 40;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 28,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/5.jpg"),
                        radius: 25,
                      ),
                    ),
                    FixedSpace(
                      wd: 5,
                    ),
                    Text(
                      title,
                      style: kHeadingNormalTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              FixedSpace(
                ht: 15,
              ),
              Card(
                color: Colors.grey.shade900,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: kWhiteColor,
                          ),
                          Text(
                            email,
                            style: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Phone",
                            style: kWhiteColor,
                          ),
                          Text(
                            phone,
                            style: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Join Date",
                            style: kWhiteColor,
                          ),
                          Text(
                            joinDate.toString(),
                            style: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          Icon? icon;
                          Text? txt;

                          switch (index) {
                            case 0:
                              icon = Icon(
                                Icons.add_circle,
                                color: theme.primaryColor,
                              );
                              txt = Text(
                                "Pay via new card",
                                style: kWhiteColor,
                              );
                              break;
                            case 1:
                              icon = Icon(
                                Icons.credit_card,
                                color: theme.primaryColor,
                              );
                              txt = Text(
                                "Pay via existing card",
                                style: kWhiteColor,
                              );
                              break;
                          }

                          return InkWell(
                            onTap: () {
                              onItemPress(context, index);
                            },
                            child: ListTile(
                              title: txt,
                              leading: icon,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: theme.primaryColor,
                        ),
                        itemCount: 2,
                      ),
                    ),
                    Visibility(
                      visible: existingCardVisibility,
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            var card = cards[index];
                            return InkWell(
                              onTap: () {
                                print(card['cardHolderName']);
                                payViaExistingCard(context, card);
                              },
                              child: CreditCardWidget(
                                cardNumber: card['cardNumber'],
                                expiryDate: card['expireDate'],
                                cardHolderName: card['cardHolderName'],
                                cvvCode: card['cvvCode'],
                                showBackView: false,
                                onCreditCardWidgetChange: (CreditCardBrand) {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FixedSpace(
                ht: 15,
              ),
              ButtonWidget(
                title: "Sign Out",
                bgColor: Colors.deepOrangeAccent,
                func: () async {
                  await FirebaseAuth.instance.signOut();
                  runApp(const MaterialApp(
                      home: SignInPage(),
                    ),
                  );
                },
                radius: 5,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
