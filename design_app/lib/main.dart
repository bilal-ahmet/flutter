import 'package:flutter/material.dart';
import 'package:tasarim_uygulamasi/detay.dart';

void main() => runApp(const ModaApp());

class ModaApp extends StatelessWidget {
  const ModaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> with SingleTickerProviderStateMixin{

  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(controller: tabController, tabs: [
          Tab(icon: Icon(Icons.more, color: Colors.grey, size: 16,),),
          Tab(icon: Icon(Icons.play_arrow, color: Colors.grey, size: 16,),),
          Tab(icon: Icon(Icons.navigation, color: Colors.grey, size: 16,),),
          Tab(icon: Icon(Icons.supervised_user_circle, color: Colors.grey, size: 16,),),
        ]),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "moda uygulaması",
          style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))],
      ),
      body: ListView(
        children: [
          // üst tarafta ki profil listesi
          Container(
            padding: EdgeInsets.only(top: 10),
            //color: Colors.blue.shade300,
            height: 145,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                listeElemani("assets/model1.jpeg", "assets/chanellogo.jpg"),
                const SizedBox(
                  width: 30,
                ),
                listeElemani("assets/model2.jpeg", "assets/louisvuitton.jpg"),
                const SizedBox(
                  width: 30,
                ),
                listeElemani("assets/model3.jpeg", "assets/chloelogo.png"),
                const SizedBox(
                  width: 30,
                ),
                listeElemani("assets/model1.jpeg", "assets/chanellogo.jpg"),
                const SizedBox(
                  width: 30,
                ),
                listeElemani("assets/model2.jpeg", "assets/louisvuitton.jpg"),
                const SizedBox(
                  width: 30,
                ),
                listeElemani("assets/model3.jpeg", "assets/chloelogo.png"),
              ],
            ),
          ),

          // card tasarımı
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 30,
              color: Colors.blueGrey.shade50,
              shadowColor: Colors.grey,
              child: Container(
                height: 500,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/model1.jpeg"),
                                    fit: BoxFit.cover),
                              ),
                          ),
                          //SizedBox(width: 3,),

                          Container(
                            width: MediaQuery.of(context).size.width - 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daisy",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "34 min ago",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 50),

                          Icon(Icons.more_vert)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "this offical website features a ribet knit zipper jacket that is"
                        "modern and stylish. It looks very temperament and is recomended to friends",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Detay(imgPath: "assets/modelgrid1.jpeg"),));
                            },
                            child: Hero(
                              tag: "assets/modelgrid1.jpeg",
                              child: Container(
                                height: 200,
                                width: (MediaQuery.of(context).size.width - 50) / 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage("assets/modelgrid1.jpeg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              InkWell(
                                 onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Detay(imgPath: "assets/modelgrid2.jpeg"),));
                            },
                                child: Hero(
                                  tag: "assets/modelgrid2.jpeg",
                                  child: Container(
                                    height: 95,
                                    width:
                                        (MediaQuery.of(context).size.width - 100) /
                                            2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/modelgrid2.jpeg"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Detay(imgPath: "assets/modelgrid3.jpeg"),));
                            },
                                child: Hero(
                                  tag: "assets/modelgrid3.jpeg",
                                  child: Container(
                                    height: 95,
                                    width:
                                        (MediaQuery.of(context).size.width - 100) /
                                            2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/modelgrid3.jpeg"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.brown.withOpacity(0.2),
                            ),
                            child: Center(child: Text("# louis vuitton")),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.brown.withOpacity(0.2),
                            ),
                            child: Center(child: Text("# chloe")),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Divider(),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Icon(Icons.reply, size: 20, color: Colors.brown.withOpacity(0.3),),
                          SizedBox(width: 10,),
                          Text("1.7K", style: TextStyle(fontFamily: "Montserrat", fontSize: 20, color: Colors.brown.withOpacity(0.3)),),
                          SizedBox(width: 30,),

                          Icon(Icons.comment, size: 20, color: Colors.brown.withOpacity(0.3),),
                          SizedBox(width: 10,),
                          Text("325", style: TextStyle(fontFamily: "Montserrat", fontSize: 20, color: Colors.brown.withOpacity(0.3)),),
                          SizedBox(width: 120,),

                          Icon(Icons.favorite, size: 20, color: Colors.red,),
                          SizedBox(width: 10,),
                          Text("2.3K", style: TextStyle(fontFamily: "Montserrat", fontSize: 20, color: Colors.brown.withOpacity(0.3)),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  listeElemani(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          // stack içindeki elemanların dağılımı: ilk yazılan en altta olur
          children: [
            Expanded(
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Positioned(
                top: 50,
                left: 50,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(logoPath), fit: BoxFit.cover)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            height: 30,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.brown,
            ),
            child: const Center(
                child: Text(
              "follow",
              style: TextStyle(
                  fontFamily: "Montserrat", fontSize: 14, color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
