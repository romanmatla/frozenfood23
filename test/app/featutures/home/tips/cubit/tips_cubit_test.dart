import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/features/home/tips/cubit/tips_cubit.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:frozen_food/app/repositories/tips_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockTipsRepository extends Mock implements TipsRepository {}

void main() {
  late TipsCubit sut;
  late MockTipsRepository repository;

  setUp(() {
    repository = MockTipsRepository();
    sut = TipsCubit(repository);
  });

  

  group('start', () {
    setUp(() {
      when(() => repository.getTipsModels()).thenAnswer(
        (_) async => [
          TipsModel(1, 'title', 'picture'),
        ],
      );
    });

    blocTest<TipsCubit, TipsState>(
      'emit Status.loadind then Status.success with results',
      build: () => sut,
      act: (cubit) => cubit.start(title: 'test'),
      expect: () => [
        const TipsState(
          status: Status.loading,
        ),
        TipsState(
          result: [
          TipsModel(1, 'title', 'picture'),
          ],
          status: Status.success,
        ),
      ],
    );
  });
}
