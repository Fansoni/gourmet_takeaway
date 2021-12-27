import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with TickerProviderStateMixin {
  AnimationController _controller;

  TabController tabController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.settings, color:Colors.black, size: 30,),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Material(
            elevation: 3.0,
            child: Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/1.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Container(
                        width: MediaQuery.of(context).size.width - 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Joccb Coleman',
                              style: TextStyle(
                                color: Colors.orange[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on, color: Colors.green[300],),
                                Text(
                                  'Building 5104, 18 Street',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.0,),
                            Text(
                              '13 Hudson Estuary, Freedom Island, New York Harbour',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 29.0,),
                  Container(
                    //height: 50,
                    width: double.infinity,
                    child: TabBar(
                      isScrollable: true,
                      controller: tabController,
                      indicatorColor: Colors.orange[700],
                      labelColor: Colors.orange[700],
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 5.0,
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      tabs: <Widget>[
                        Tab(text: 'Guess you like',),
                        Tab(text: 'News',),
                        Tab(text: 'Coupon',)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                BuidCardItem(image: 'assets/images/2.jpg',name: 'Chicken Chow Mein', cal: 123, km: 23, min: 23, rating: 5,),
                BuidCardItem(image: 'assets/images/3.jpg',name: 'Beef vermicelli soup', cal: 123, km: 23, min: 23, rating: 4,),
                BuidCardItem(image: 'assets/images/3.jpg',name: 'Beef vermicelli soup', cal: 123, km: 23, min: 23, rating: 2,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuidCardItem extends StatelessWidget {
  final image, name, rating, cal, km, min;
  const BuidCardItem({
    Key key, this.image, this.name, this.rating, this.cal, this.km, this.min,
  }) : super(key: key);

  List<Widget> _buildRating(rating){
    List<Widget> list = [];

    for (var i = 1; i <= 5; i++) {
      if(rating >= i){
        list.add(Icon(Icons.star, color: Colors.orange[700]));
      }else{
        list.add(Icon(Icons.star, color: Colors.grey));
      }
    }

    list.add(SizedBox(width: 10.0,));
    list.add(Text('$rating', style: TextStyle(color: Colors.orange[700], fontSize: 18.0),));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            //height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  //margin: EdgeInsets.only(bottom: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    image: DecorationImage(
                      image: AssetImage(this.image),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(width: 8.0,),
                Container(
                  width: MediaQuery.of(context).size.width - 105,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            this.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              color: Colors.orange[700],
                            ),
                            child: Center(child: Icon(Icons.favorite_border, color: Colors.white))
                          ),
                        ],
                      ),
                      Row(children: _buildRating(this.rating)),
                      SizedBox(height: 10.0,),
                      Text(
                        'About dishes',
                        style: TextStyle(
                          color: Colors.green[300],
                          fontSize: 15
                        ),
                      ),
                      SizedBox(height: 6.0,),
                      Text(
                        'Chicken fried noodles is a delicious home-cooked dish made from chicken, fragrance and taste',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.fastfood, color: Colors.grey),
                          Text(
                            '${this.cal}kcal',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Icon(Icons.location_on, color: Colors.grey),
                          Text(
                            '${this.km}km',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Icon(Icons.access_time, color: Colors.grey),
                          Text(
                            '${this.min}mins',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}