import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final int index;
  final String name;
  final String imageUrl;
  final Function onTap;

  const DetailsCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = name.split(',');
    String firstPart = nameParts[0].trim();
    String secondPart = nameParts.length > 1 ? nameParts[1].trim() : '';

    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 250,
                    height: 180,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      firstPart,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
