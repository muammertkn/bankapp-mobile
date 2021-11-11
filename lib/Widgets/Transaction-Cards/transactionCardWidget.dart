import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionWidget extends StatelessWidget {
  final String transactionNo;
  final String transactionAmount;
  final String transactionPersonName;
  final bool isSend;
  String transactionTime;
  TransactionWidget(
      {Key? key,
      required this.transactionNo,
      required this.transactionTime,
      required this.transactionAmount,
      required this.isSend,
      required this.transactionPersonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(3, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade300,
        ),
        width: 340,
        height: 150,
        child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 30,
            ),
            child: Wrap(
              spacing: 5,
              runSpacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction No.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      transactionNo,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isSend ? 'Send' : 'Receive',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            transactionAmount,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            isSend ? 'To' : 'From',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            transactionPersonName,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      transactionTime,
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
