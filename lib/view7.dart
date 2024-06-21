import 'package:flutter/material.dart';
import 'package:mydemo_app/api2.dart';
import 'package:mydemo_app/description2.dart';
import 'package:mydemo_app/personmodel.dart';
import 'package:mydemo_app/textmodifiyer.dart';

class View7 extends StatefulWidget {
  final List descriptionlist;

  const View7({
    super.key,
    required this.descriptionlist,
  });

  @override
  State<View7> createState() => _View7State();
}

class _View7State extends State<View7> {
  Personmodel? personmodel;
  final Api2 api2 = Api2();

  @override
  void initState() {
    super.initState();
    if (widget.descriptionlist.isNotEmpty) {
      detail(widget.descriptionlist.first['id']);
    }
  }

  Future<void> detail(int personID) async {
    try {
      var results = await api2.getsearchpeople(personID);
      setState(() {
        personmodel = results;
      });
    } catch (error) {
      print('Error fetching person details: $error');
    }
  }

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
                  ),
                ),
                SizedBox(width: 20),
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
        itemCount: widget.descriptionlist.length,
        itemBuilder: (context, index) {
          var item = widget.descriptionlist[index];
          var profilePath = item['profile_path'] ?? '';
          var name = item['name'] ?? 'Loading';
          var knownForDepartment = item['known_for_department'] ?? '';

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
                            'https://image.tmdb.org/t/p/w500' + profilePath,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 290,
                      child: ListTile(
                        title: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          knownForDepartment,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 145, 142, 142),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            await detail(item['id']);
                            if (personmodel != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Description2(
                                    name: personmodel!.name,
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500${personmodel!.profilePath}',
                                    placeofbirth: personmodel!.placeOfBirth,
                                    known_of_department:
                                        personmodel!.knownForDepartment,
                                    popularcel: personmodel!.deathday,
                                    birthdate: personmodel!.birthday,
                                    bio: personmodel!.biography,
                                  ),
                                ),
                              );
                            }
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
