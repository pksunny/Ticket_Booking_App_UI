// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_ui/ReUseable%20Widget/flight_container.dart';
import 'package:ticket_booking_ui/ReUseable%20Widget/flight_container_small.dart';
import 'package:ticket_booking_ui/utils/app_layout.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;

  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {

    print('Date is ${ticket['date']}');
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            /* 
              SHOWING GREEN PART OF CARD TICKET
            */
            Container(
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              decoration: BoxDecoration(
                color: isColor==null ? Colors.white : Colors.greenAccent.shade200,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)), topRight: Radius.circular(AppLayout.getHeight(21)))
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'], style: isColor == null ? Styles.headLineStyle3 : Styles.headLineStyle3.copyWith(color: Colors.white)),
                      Spacer(),
                      FlightContainer(isColor: true,),
                      Gap(2),
                      FlightContainerSmall(isColor: true,),
                      Gap(2),
                      FlightContainerSmall(isColor: true,),
                      Gap(2),
                      FlightContainerSmall(isColor: true,),
                      Gap(10),
                      Transform.rotate(
                        angle: 1.5,
                        child: Icon(Icons.local_airport_rounded, color: isColor == null ? Colors.teal : Colors.white)
                        ),
                      Gap(10),
                      FlightContainerSmall(isColor: true,),
                      Gap(2),
                      FlightContainerSmall(isColor: true,),
                      Gap(2),
                      FlightContainerSmall(isColor: true,),
                      Gap(2),
                      FlightContainer(isColor: true,),
                      Spacer(),
                      Text(ticket['to']['code'], style: isColor == null ? Styles.headLineStyle3 : Styles.headLineStyle3.copyWith(color: Colors.white)),
                    ],
                  ),

                  Row(
                    children: [
                      Text(ticket['from']['name'], style: isColor == null ? Styles.headLineStyle3 : Styles.headLineStyle3.copyWith(color: Colors.white)),
                      Spacer(),
                      Text(ticket['flying_time'], style: isColor == null ? Styles.headLineStyle3 : Styles.headLineStyle3.copyWith(color: Colors.white)),
                      Spacer(),
                      Text(ticket['to']['name'], style: isColor == null ? Styles.headLineStyle3 : Styles.headLineStyle3.copyWith(color: Colors.white)),

                    ],
                  ),
                ],
              ),
            ),
            /* 
              SHOWING BLUE PART OF CARD TICKET
            */
            Container(
              color: Colors.lightBlueAccent,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                      height: AppLayout.getHeight(20),
                      width: AppLayout.getWidth(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(AppLayout.getHeight(10)),
                              bottomRight: Radius.circular(AppLayout.getHeight(10))),
                          color: Colors.white,
                        ),
                      )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(AppLayout.getHeight(8.0),),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraint) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              (constraint.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                    width: AppLayout.getWidth(5),
                                    height: AppLayout.getHeight(1),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                        );
                      },
                    ),
                  )),
                  SizedBox(
                      height: AppLayout.getHeight(20),
                      width: AppLayout.getWidth(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppLayout.getHeight(10)),
                              bottomLeft: Radius.circular(AppLayout.getHeight(10))),
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            /* 
              BOTTOM PART OF BLUE CARD TICKET
            */
            Container(
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(21)), bottomRight: Radius.circular(AppLayout.getHeight(21)))
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'], style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                          Gap(5),
                          Text('DATE', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                        ],
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'], style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                          Gap(5),
                          Text('Departure time', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket['number'].toString(), style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                          Gap(5),
                          Text('Number', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}