import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String accountLabel;
  final String balance;
  final EdgeInsets? padding;
  final bool? isSettingPage;
  final VoidCallback? deleteFunction;
  final VoidCallback? updateFunction;
  const CardWidget(
      {Key? key,
      required this.accountLabel,
      required this.balance,
      this.padding,
      this.isSettingPage,
      this.deleteFunction,
      this.updateFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(3, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade300,
          ),
          width: 340,
          height: 220,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ACCOUNT LABEL',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          accountLabel,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BALANCE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          balance,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: isSettingPage ?? false,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: deleteFunction,
                        child: Text('Delete Account'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: updateFunction,
                        child: Text('Change Label'),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
