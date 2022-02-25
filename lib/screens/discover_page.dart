import 'package:flutter/material.dart';
import 'package:ride_app/constants.dart';
import 'package:ride_app/screens/collection_page.dart';
import 'package:ride_app/selected_collection_argments.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      duration: const Duration(seconds: 2),
      child: SizedBox.expand(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _profileSection(),
                _searchSection(),
                _destinationSection(),
                _tripCollection(),
                _popularCars(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileSection() => Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hi, James',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
            const CircleAvatar(
              foregroundImage: NetworkImage('https://picsum.photos/200/300'),
            )
          ],
        ),
      );

  Widget _searchSection() => Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        child: Form(
            child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Where are you going?',
            hintStyle: Theme.of(context).textTheme.caption!,
            suffixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        )),
      );

  Widget _destinationSection() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 0.0),
            child: Text('Popular destinations',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _destinationWidget(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tanzania.svg/320px-Flag_of_Tanzania.svg.png',
                      'Tanzania'),
                  _destinationWidget(
                      'https://www.nationalflags.shop/WebRoot/vilkasfi01/Shops/2014080403/53E6/2F6B/9F5E/2B82/9A93/0A28/100B/04F9/Flag_of_Zimbabwe_ml.png',
                      'Zimbabwe'),
                  _destinationWidget(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flag_of_Uganda.svg/1280px-Flag_of_Uganda.svg.png',
                      'Uganda'),
                  _destinationWidget(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Kenya.svg/800px-Flag_of_Kenya.svg.png',
                      'Kenya'),
                  _destinationWidget(
                      'https://www.worldatlas.com/img/flag/rw-flag.jpg',
                      'Rwanda'),
                  _destinationWidget(
                      'https://cdn.britannica.com/27/4227-004-32423B42/Flag-South-Africa.jpg',
                      'South Africa'),
                ],
              ),
            ),
          )
        ],
      );

  Widget _destinationWidget(String image, String country) => Padding(
        padding: const EdgeInsets.fromLTRB(19.0, 0.0, 8.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Text(country,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      );

  Widget _tripCollection() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
            child: Text('Trip collections',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tripCollectionCONST.length,
                itemBuilder: (context, index) => _tripCollectionWidget(
                    tripCollectionCONST[index]['image'],
                    tripCollectionCONST[index]['country'],
                    tripCollectionCONST[index]['place'],
                    tripCollectionCONST[index]['distance'], index),
              ),
            ),
          )
        ],
      );

  Widget _tripCollectionWidget(
          String image, String country, String place, String distance, int index) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(19.0, 0.0, 8.0, 0.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, CollectionPage.routeName,
                arguments: SelectedCollectionArguments(
                    index));
          },
          child: Container(
              width: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(17.0)),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(13.0, 18.0, 0.0, 18.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                             mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'collection_name_$index',
                                  child: Text(
                                    place,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                  ),
                                ),
                                Text(
                                  country,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Distance',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                                Text(
                                  distance,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Image.network(
                      image,
                      width: 200,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )),
        ),
      );

  Widget _popularCars() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
            child: Text('Most popular cars',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carsCONST.length,
                itemBuilder: (context, index) => _popularCarsWidget(
                    carsCONST[index]['brand'],
                    carsCONST[index]['model'],
                    carsCONST[index]['image'],
                  )
              ),
            ),
          )
        ],
      );

  Widget _popularCarsWidget(String brand, String model, String image) =>
      Container(
        width: 250,
        margin: const EdgeInsets.fromLTRB(19.0, 0.0, 8.0, 0.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Text(brand, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
                      Text(model, style: Theme.of(context).textTheme.caption!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(17),
                    bottomRight: Radius.circular(17)),
                child: Image.network(
                  image,
                  width: 125,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
}
