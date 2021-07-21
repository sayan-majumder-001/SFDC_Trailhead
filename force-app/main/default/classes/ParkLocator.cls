public class ParkLocator{
public static String[] country(String countryName){
ParkService.ParksImplPort parkImpl= new ParkService.ParksImplPort();
String[] result=null;
countryName='Germany';
result = parkImpl.byCountry(countryName);
return result; 
}
}