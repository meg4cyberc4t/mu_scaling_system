import 'package:flutter/material.dart';
import 'package:mu_scaling_system/mu_scaling_system.dart';

void main() {
  runApp(
    MuScalingBuilder(
      conditions: [
        MuCondition.side(
          mu: 4,
          minShortestSide: 400,
          maxShortestSide: 800,
        ),
        MuCondition.side(
          mu: 5,
          minShortestSide: 800,
          maxShortestSide: 1500,
        ),
      ],
      defaultValue: 4,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: Typography.material2021()
            .englishLike
            .apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
              decorationColor: Colors.black,
            )
            .scale((fontSize, mu) => fontSize * mu / 3.5),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("mu_scaling_system example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current shortest side: ${MediaQuery.of(context).size.shortestSide}',
            ),
            SizedBox(height: 2.mu),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.mu),
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Padding(
                padding: EdgeInsets.all(6.mu),
                child: Text(
                  'Mu: ${1.mu}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: 2.mu),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 210,
              child: Padding(
                padding: EdgeInsets.all(6.mu),
                child: Text(
                  'Real 210 width',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: 2.mu),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 70.mu,
              child: Padding(
                padding: EdgeInsets.all(6.mu),
                child: Text(
                  '70.mu width = ${70.mu}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
