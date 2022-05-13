import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MarketDetailScreen extends StatefulWidget {
  late String id;
  MarketDetailScreen(String id) {
    this.id = id;
  }
  @override
  State<MarketDetailScreen> createState() => _MarketDetailScreenState(id);
}

class _MarketDetailScreenState extends State<MarketDetailScreen> {
  late String id;
  _MarketDetailScreenState(String id) {
    this.id = id;
  }

  final Map name_map = {
    "BTCUSDT": "BitCoin",
    "ETHUSDT": "Etherium",
    "DOTUSDT": "Polkadot",
    "DOGEUSDT": "Dogecoin",
  };

  List<GraphData> graph_data = [];

  void listUpdate(Map data) {
    if (graph_data.length < 30) {
      graph_data.add(new GraphData(data['p'], data['E']));
      return;
    }
    graph_data.removeAt(0);
    graph_data.add(new GraphData(data['p'], data['E']));
  }

  @override
  Widget build(BuildContext context) {
    var _channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/${id.toLowerCase()}@trade'),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          name_map[this.id.toUpperCase()],
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _channel.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final Map m = json.decode(snapshot.data);
              listUpdate(m);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    // Chart titl
                    // Enable legend
                    //legend: Legend(isVisible: true),

                    series: <LineSeries<GraphData, DateTime>>[
                      LineSeries<GraphData, DateTime>(
                        dataSource: graph_data,
                        xValueMapper: (GraphData graph, _) =>
                            DateTime.fromMicrosecondsSinceEpoch(
                                graph.timestamp * 1000),
                        yValueMapper: (GraphData graph, _) =>
                            double.parse(graph.price),
                        // Enable data label
                      )
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Text(
                      double.parse(graph_data[graph_data.length - 1].price)
                          .toStringAsFixed(3)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // ListTile(
                  //   title: Text("All Time Low"),
                  //   trailing: Text("1.002"),
                  // ),
                  // ListTile(
                  //   title: Text("All Time High"),
                  //   trailing: Text("20.002"),
                  // ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.498,
              height: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "Buy",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.498,
              height: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "Sell",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphData {
  GraphData(this.price, this.timestamp);
  final String price;
  final int timestamp;
}
