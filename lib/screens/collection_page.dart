import 'package:flutter/material.dart';
import 'package:ride_app/constants.dart';
import 'package:ride_app/selected_collection_argments.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);
  static const String routeName = '/collection';
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as SelectedCollectionArguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox.expand(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _backButtonRow(),
              _collectionName(args.index),
              _descriptionRow(args.index),
              _statsRow(args.index),
              _activitiesRow(args.index),
              _bestCarsRow()
            ],
          ),
        ),
      )),
    );
  }

  Widget _backButtonRow() => Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ],
        ),
      );

  Widget _collectionName(int index) => Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'collection_name_$index',
              child: Text(
                tripCollectionCONST[index]['place'],
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            Wrap(
              spacing: 2.0,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 15,
                ),
                Text(
                  tripCollectionCONST[index]['country'],
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            )
          ],
        ),
      );

  Widget _descriptionRow(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
      child: Text(
        tripCollectionCONST[index]['description'],
        style: Theme.of(context).textTheme.bodyText1!,
      ),
    );
  }

  Widget _statsRow(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                tripCollectionCONST[index]['distance'],
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              Text(
                'Total Distance',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                tripCollectionCONST[index]['visitors'],
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              Text(
                'Visitors',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _activitiesRow(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          child: Text('What you will see',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: double.infinity,
          height: 230,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tripCollectionCONST[index]['activities'].length,
              itemBuilder: (context, _index) {
                return _activitiesListWidget(index, _index);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _activitiesListWidget(int indexARGS, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19.0, 0.0, 8.0, 0.0),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(17.0),
                      topRight: Radius.circular(17.0)),
                  child: Image.network(
                      tripCollectionCONST[indexARGS]['activities'][index]
                          ['activity_image'],
                      width: 170,
                      height: 190,
                      fit: BoxFit.cover),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text('Top 10',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 3.0, 0, 0),
              child: Text(
                  tripCollectionCONST[indexARGS]['activities'][index]
                      ['activity_name'],
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bestCarsRow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          child: Text('Best cars for the trip',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carsCONST.length,
              itemBuilder: (context, _index) {
                return _bestCarsListWidget(_index);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _bestCarsListWidget(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19.0, 0.0, 8.0, 0.0),
      child: Container(
          width: 160,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 0, 0),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: carsCONST[index]['brand'],
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    TextSpan(
                      text: carsCONST[index]['model'],
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ],
                )),
              ),
              Image.network(carsCONST[index]['image'],
                  width: 160, height: 100, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(carsCONST[index]['lease_time'],
                                style: Theme.of(context).textTheme.caption!),
                            Text(carsCONST[index]['lease_price'],
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    )),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Gas',
                                style: Theme.of(context).textTheme.caption!),
                            Text(carsCONST[index]['gas_price'],
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    )),
                          ],
                        ),
                      ),
                    ]),
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    elevation: MaterialStateProperty.all<double>(0),
                  
                  ),
                    onPressed: () {},
                    child: Text('Book Lease',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary))),
              ),
            ],
          )),
    );
  }
}
