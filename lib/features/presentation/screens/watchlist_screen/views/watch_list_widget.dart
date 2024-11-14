import 'package:flutter/material.dart';

class WatchListWidget extends StatelessWidget {
  const WatchListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.5, top: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        width: MediaQuery.sizeOf(context).width * 0.37,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        "assets/Mask Group 2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alita Battle Angel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '2019',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Rosa Salazar, Christoph Waltz',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                index == 7
                    ? const SizedBox(height: 15)
                    : Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 30,
                        endIndent: 27,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
