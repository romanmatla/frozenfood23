// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:frozen_food/app/core/enums.dart';
// import 'package:frozen_food/app/features/home/products/cubit/products_cubit.dart';
// import 'package:frozen_food/app/models/product_model.dart';
// import 'package:frozen_food/app/repositories/product_repository.dart';
// import 'package:mocktail/mocktail.dart';

// class MocProductRepository extends Mock implements ProductRepository {}

// void main() {
//   late ProductsCubit sut;
//   late MocProductRepository repository;

//   setUp(() {
//     repository = MocProductRepository();
//     sut = ProductsCubit(repository);
//   });

//   group('start', () {
//     setUp(() {
//       when(() => repository.getProductStream(categories: 'test'))
//             .thenAnswer((_) => []
//                 // ProductModel(
//                 //     id: 1,
//                 //     title: 'title',
//                 //     dataAdded: 'dataAdded',
//                 //     expirationDate: 'expirationDate',
//                 //     quantity: 'quantity')
//               // ]
//               );
//     });
//     blocTest<ProductsCubit, ProductsState>(
//       'emit Status.loading then Status.success with results',
//       build: () => sut,
//       act: (cubit) => cubit.start(categories: 'Owoce'),
//       expect: () => [
//         ProductsState(
//           documents: [],
//           status: Status.loading,
//         ),
//         ProductsState(
//           documents: data,
//           status: Status.success,
//         ),
//       ],
//     );
//   });
// }
