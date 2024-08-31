
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class BillsRepositoryImp implements BillsRepository{

        final BillsRemoteDataSource remoteDataSource;
        BillsRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    