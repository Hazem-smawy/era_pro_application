
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class StoreRepositoryImp implements StoreRepository{

        final StoreRemoteDataSource remoteDataSource;
        StoreRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    