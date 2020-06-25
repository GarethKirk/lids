
//this will give you teh workd of desired length
String getlatlngword(double lat, double lng, int sizeofword) {
    double nlat = 0.0;
    double nlng = 0.0;
    String word = '';

    double lathalfsize = 90.0;  //up down
    double longhalfsize = 180.0; //left right

    for (var i = 0; i < sizeofword; i++) {
      lathalfsize = lathalfsize / 2;
      longhalfsize = longhalfsize / 2;
      //up & left 
      if (lat >= nlat && lng <= nlng) {
        word = word + 'a';
        nlat = nlat + lathalfsize;
        nlng = nlng - longhalfsize;
        // up & right
      } else if (lat >= nlat && lng >= nlng) {
        word = word + 'b';
        nlat = nlat + lathalfsize;
        nlng = nlng + longhalfsize;
        //down & rigth
      } else if (lat <= nlat && lng >= nlng) {
        word = word + 'd';
        nlat = nlat - lathalfsize;
        nlng = nlng + longhalfsize;
        //down & left
      } else if (lat <= nlat && lng <= nlng) {
        word = word + 'c';
        nlat = nlat - lathalfsize;
        nlng = nlng - longhalfsize;
      }
    }
    return word;
  }
  
  
//this will get the LatLng (block, and center point) from the word
  List<LatLng> getlatlngfromword(String word) {
    double trlat = 90;  //top
    double trlng = 180; //right
    double tllat = 90; //top
    double tllng = -180; //left
    double bllat = -90; //bottom
    double bllng = -180;//left
    double brlat = -90; //bottom
    double brlng = 180;// right
    double center_lat = 0;
    double center_lng = 0;
    
    double lathalfsize = 180.0;
    double longhalfsize = 360.0;
    List<LatLng> pointList = [];
    int id =0;

    word.runes.forEach((int rune) {
      id += 1;
      var character = new String.fromCharCode(rune);
      lathalfsize = lathalfsize / 2;
      longhalfsize = longhalfsize / 2;
      //up left -lat + long
      if (character == 'a') {
        trlng = trlng - longhalfsize; //move left
        brlat = brlat + lathalfsize; //move up
        brlng = brlng - longhalfsize;//move left
        bllat = bllat + lathalfsize; //move up
        
        center_lat = center_lng - longhalfsize;
        center_lat = center_lat + lathalfsize;
      } 
      //up right + long + lat
      else if (character == 'b') {
        tllng = tllng + longhalfsize; //move right
        brlat = brlat + lathalfsize;  //move up
        bllat = bllat + lathalfsize; //move up 
        bllng = bllng + longhalfsize; //move left

        center_lat = center_lng + longhalfsize;
        center_lat = center_lat + lathalfsize;
      } 
     
      // down left -lat -long
      else if (character == 'c') {
        tllat = tllat - lathalfsize; //  move down
        trlat = trlat - lathalfsize; // move dwn
        trlng = trlng - longhalfsize; // move left
        brlng = brlng - longhalfsize; // move left

        center_lat = center_lng - longhalfsize;
        center_lat = center_lat - lathalfsize;
      }
       // down right -long + lat
      else if (character == 'd') {
        tllat = tllat - lathalfsize; //move down
        tllng = tllng + longhalfsize; //move right
        trlat = trlat - lathalfsize; // move down
        bllng = bllng + longhalfsize; // move right

        center_lat = center_lng + longhalfsize;
        center_lat = center_lat - lathalfsize;
      } 
    });
    print("Bottom width : " + (brlat - bllat).toString());
    print("Left height : " + (tllng - bllng).toString());
    print("Top width : " + (trlat - tllat).toString());
    print("Right height : " + (trlng - brlng).toString());
    print("Center point Lat: " + center_lat.toString() + ", Lng: " + center_lng.toString());

    return [LatLng(bllat, bllng), LatLng(tllat, tllng), LatLng(trlat, trlng), LatLng(brlat, brlng), LatLng(bllat, bllng), LatLng(center_lat,center_lng)];
  }
  
