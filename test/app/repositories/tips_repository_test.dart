import 'package:flutter_test/flutter_test.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:frozen_food/app/repositories/tips_repository.dart';
import 'package:frozen_food/data/remote_data_sources/tips_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MocTipsDataSource extends Mock implements TipsRemoteRetrofitDataSource {}

void main() {
  late TipsRepository sut;
  late MocTipsDataSource dataSource;

  setUp(() {
    dataSource = MocTipsDataSource();
    sut = TipsRepository(remoteDataSource: dataSource);
  });
  group('getTipsModels', () {
    test('should call remoteDataSource.getTips()', () async {
      // 1
      when(() => dataSource.getTips()).thenAnswer((_) async => []);

      // 2
      await sut.getTipsModels();

      // 3
      verify(() => dataSource.getTips()).called(1);
    });
  });
  test('should return data source results', () async {
    //1
    when(() => dataSource.getTips()).thenAnswer(
      (_) async => [
        TipsModel(1, 'title1', 'picture1'),
        TipsModel(2, 'title2', 'picture2'),
        TipsModel(3, 'title3', 'picture3'),
        TipsModel(4, 'title4', 'picture4'),
      ],
    );
    //2
    final results = await sut.getTipsModels();
    //3
    expect(
      results,
      [
        TipsModel(1, 'title1', 'picture1'),
        TipsModel(2, 'title2', 'picture2'),
        TipsModel(3, 'title3', 'picture3'),
        TipsModel(4, 'title4', 'picture4'),
      ],
    );
  });
}
