public class ParkLocator {
    public static String[] country (String location) {
        ParkService.ParksImplPort parkings = 
            new ParkService.ParksImplPort();
        return parkings.byCountry(location);
    }
}