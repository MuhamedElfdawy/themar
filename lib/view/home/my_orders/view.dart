import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('طلباتي'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 25.h,),
            Container(
              height: 100,
              width: 342,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('طلب #4587',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                      Text('27,يونيو,2021',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff9C9C9C)),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Image.network('https://avatars.mds.yandex.net/i?id=a80f42e53a55e7727eced3b87a07e286135d956e-9570000-images-thumbs&n=13',
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Image.network('https://avatars.mds.yandex.net/i?id=5a37958b1e72905cacbb18b0bd546ac380082d3c-5228234-images-thumbs&n=13',
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Image.network('https://avatars.mds.yandex.net/i?id=860996fe6005d7d18bf2cf192b1cd70a8c29a7d0-9858449-images-thumbs&n=13',
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Theme.of(context).primaryColor.withOpacity(0.2),
                            ),
                            child: Text('+2',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Theme.of(context).primaryColor.withOpacity(0.2)
                        ),
                        child: Text('بإنتظار الموافقة',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
