import 'package:flutter/material.dart';
import 'package:mydemo_app/description.dart';

import 'package:mydemo_app/textmodifiyer.dart';

class View3 extends StatelessWidget {
  final List descriptionlist;
  const View3({
    super.key,
    required this.descriptionlist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 250.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 20,
                ),
                Textmodifier(
                  text: "Popular",
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 39, 37, 37),
      ),
      body: ListView.builder(
        itemCount: descriptionlist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 400,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(1),
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    descriptionlist[index]['backdrop_path'],
                              ),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: 200,
                      width: 290,
                      child: ListTile(
                        title: Text(
                          descriptionlist[index]['original_name'] ?? 'Loding',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          descriptionlist[index]['vote_average'].toString() ??
                              'Loding',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 145, 142, 142),
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Description(
                                  name: descriptionlist[index]['original_name'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      descriptionlist[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      descriptionlist[index]['poster_path'],
                                  description: descriptionlist[index]
                                      ['overview'],
                                  vote: descriptionlist[index]['vote_average'],
                                  launch_on: descriptionlist[index]
                                      ['first_air_date'],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
