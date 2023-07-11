import 'package:flutter/material.dart';

import '../../data/models/character.dart';
import 'custom_card.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  CharacterCard({required this.character});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CustomCard(
      onTap: () {},
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(),
          SizedBox(width: 10.0),
          Container(
            width: width,
            height: height,
            child: ListView.builder(
              itemCount: character.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.results![index].name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 7.0,
                            width: 7.0,
                            decoration: BoxDecoration(
                              color: statusColor(),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '${character.results![index].status!} - ${character.results![index].species!}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      buildInfo('Last known location:',
                          character.results![index].origin!.name),
                      SizedBox(height: 5.0),
                      buildInfo(
                          'Origin:', character.results![index].location!.name),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        bottomLeft: Radius.circular(10.0),
      ),
      child: Image.network(
        character.image,
        height: 145.0,
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

  Color statusColor() {
    switch (character.status.toLowerCase()) {
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
