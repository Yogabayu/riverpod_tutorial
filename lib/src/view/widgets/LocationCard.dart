import 'package:flutter/material.dart';
import '../../../src/data/models/location.dart';

import 'custom_card.dart';

class LocationCard extends StatelessWidget {
  final Location? location;

  LocationCard({required this.location});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CustomCard(
      onTap: () {},
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        width: width,
        height: height * 0.82,
        child: ListView.builder(
          itemCount: location!.results!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    child: Text(
                      location!.results![index].id!.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location!.results![index].name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${location!.results![index].type!}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '${location!.results![index].dimension!}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        buildInfo('Total Residents:',
                            location!.results![index].residents!.length),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  buildInfo(title, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Color? statusColor(status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green[300];
      case 'dead':
        return Colors.red;
      case 'unknown':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }
}
