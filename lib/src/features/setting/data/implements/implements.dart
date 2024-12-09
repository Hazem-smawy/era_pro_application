
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class SettingRepositoryImp implements SettingRepository{

        final SettingRemoteDataSource remoteDataSource;
        SettingRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    