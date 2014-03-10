import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;

// import org.json.*;
import processing.net.*;
// import for SQLite JDBC : storage map
import de.bezier.data.sql.*;

import java.io.*;
import java.util.*;

/********* For Map *********/
UnfoldingMap map;
MBTilesMapProvider mytiles;
SimplePointMarker mymarker;
Location myloc;

/********* For Requests *********/
JSONObject datasJsonobject;

int currentsecond;

Requests requests = new Requests();

void setup() {
	size(1000, 800, P3D);
	//requests.getBikeStation(this);
	requests.isLocationAtTime(this,"13:46",1);
	/************** UNFOLDING PART ***********/
	String tilesStr = sketchPath("data/Alexandre.mbtiles");
	map = new UnfoldingMap(this,new MBTilesMapProvider(tilesStr));
    MapUtils.createDefaultEventDispatcher(this, map);
    map.setZoomRange(13, 16);
    map.zoomAndPanTo(new Location(48.1134750f, -1.6757080f), 13);
    /*****************************/

}

void draw() {

	myloc = new Location(48.1134750, -1.6757080);
	mymarker = new SimplePointMarker(myloc);

	//map.addMarkers(mymarker);
	background(255);
	map.draw();
	/* 3d line */
	// stroke(255);
	// line(width/2, height/2, 0, width/2, height/2, 200);
	//ExecuteEachSecondChange();

	camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

}

void ExecuteEachSecondChange(){
  if (currentsecond != second()){
      currentsecond = second();
      println(hour()+":"+minute()+":"+second());
  }
}