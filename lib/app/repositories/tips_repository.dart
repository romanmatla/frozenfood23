import 'package:frozen_food/app/models/tips_model.dart';
import 'package:frozen_food/data/remote_data_sources/tips_remote_data_source.dart';
import 'package:injectable/injectable.dart';



@injectable 
class TipsRepository {
  TipsRepository({required this.remoteDataSource});

  final TipsRemoteRetrofitDataSource remoteDataSource;

  Future<List<TipsModel>> getTipsModels() async {
   return remoteDataSource.getTips();
  }

  
}
