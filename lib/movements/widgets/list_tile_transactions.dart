import 'package:flutter/material.dart';

import '../model/movements_model.dart';

class ListTileTransactions extends StatelessWidget {
  const ListTileTransactions({
    Key? key,
    required this.userTransaction,
    required this.formattedDate,
  }) : super(key: key);

  final MovementsModel userTransaction;
  final String formattedDate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        child: Text(
          userTransaction.cryptoBeingExchangedInfo,
          style: TextStyle(
            fontSize: 18.5,
            fontFamily: 'SourceSansPro-Light',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      subtitle: Text(
        formattedDate,
        style: TextStyle(
          fontSize: 18.5,
          fontFamily: 'SourceSansPro-Light',
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                userTransaction.cryptoToExchangedInfo,
                style: TextStyle(
                  fontSize: 18.5,
                  fontFamily: 'SourceSansPro-Light',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 4),
                width: 150,
                height: 25,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: Text(
                      userTransaction.moneyBeingExchangedInfo,
                      style: TextStyle(
                        fontSize: 18.5,
                        fontFamily: 'SourceSansPro-Light',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
