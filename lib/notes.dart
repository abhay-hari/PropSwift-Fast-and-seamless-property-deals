/*
* 
! 
?
TODO : 


 ! Folders


  * config
    TODO : bloc providers || const_values || image_path || routes || validation
  * core
    TODO : config(app_color, app_theme) || utils (response code and all other utils)
  * data
    TODO : model || repository || source 
  * domain
    TODO : entities || repositories || usecases
  * features
    TODO : bloc || pages || widgets


 ! API calling flow
   * create Entity in Domain/Entities
   * class Entity{}
   * create model class extend with entity class
     ? :  class Medel extend with Entity{}
   * create an abstract with a function domain/repo
     TODO : only a method in the abstract class
     ? : abstract class DomainRepo{ Future getData(){}}
   * write api call in the data/source
     TODO : first create an abstract class then impliment the same class inside the same page (Data/Source) 
     ? : abstract class GetDataSource{ Future getDataSource(){}}
     ? : class GetDataSourceImpl extend GetDataSource{ //!write api call in the override function}
   * impliment the domain/repo class in the data/repo with extend the domain/repo class
     ? : Instance of sourceclass : SourceClass sourceClass =SourceClassImpl();
     ? : class DataRepo extends Domainrepo{create an instatnce of DataSource class and override function call the api inside the function and return it } 
   * for call the api in bloc create a simple class and a function inside the domain/usecases
     ? create a DomainRepo instatnce : DomainRepo  domainRepo =DomainRepo();
     ? class UseCases{ static Future<returnType> callApi(){ domainRepo.function name and return it }}
   * In the Bloc class
     ?final data = await UseCases.callApi();


     ! Bloc notes 

     emit every time if store new value in state

*/
