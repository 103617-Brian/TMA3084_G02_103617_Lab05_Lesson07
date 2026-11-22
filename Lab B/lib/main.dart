import 'package:flutter/material.dart';

class Car {
  Car(this.make, this.model, this.price);

  final String make;
  final int model;
  final int price;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DataTableScreen());
  }
}

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  final List<Car> cars = [
    Car('Honda', 2021, 35000),
    Car('Toyota', 2011, 6000),
    Car('BMW', 2010, 9000),
  ];

  int? sortColumnIndex;

  bool sortAscending = true;

  void sortBy(
    int columnIndex,
    bool ascending,
    int Function(Car a, Car b) compare,
  ) {
    setState(() {
      cars.sort((a, b) => ascending ? compare(a, b) : compare(b, a));

      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Price List')),
      body: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          columns: [
            DataColumn(
              label: const Text('Car Make'),
              onSort: (i, asc) =>
                  sortBy(i, asc, (a, b) => a.make.compareTo(b.make)),
            ),
            DataColumn(
              label: const Text('Model'),
              numeric: true,
              onSort: (i, asc) =>
                  sortBy(i, asc, (a, b) => a.model.compareTo(b.model)),
            ),
            DataColumn(
              label: const Text('Price'),
              numeric: true,
              onSort: (i, asc) =>
                  sortBy(i, asc, (a, b) => a.price.compareTo(b.price)),
            ),
          ],
          rows: cars.map((car) {
            return DataRow(
              cells: [
                DataCell(Text(car.make)),
                DataCell(Text(car.model.toString())),
                DataCell(Text(car.price.toString())),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
