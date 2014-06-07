/**
 * Created by workshop on 2014/06/07.
 */
var map1;
var map2;
var infowindow;

function initialize() {
    var loc = new google.maps.LatLng(37.494633, 140.992755);
    var locWorker = new google.maps.LatLng(37.497733, 140.999855);

    var mapOptions = {
        zoom: 15,
        center: loc,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var mapOptionsWorker = {
        zoom: 15,
        center: locWorker,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false,
        navigationControl: false
    };
    map1 = new google.maps.Map(document.getElementById('map-canvas-1'), mapOptions);
    map2 = new google.maps.Map(document.getElementById('map-canvas-2'), mapOptionsWorker);

    var marker = new google.maps.Marker({
        position: loc,
        map: map1
    });
    var markerWorker = new google.maps.Marker({
        position: locWorker,
        map: map2
    });

    /*
    infowindow = new google.maps.InfoWindow();
    var iwopts = {
        content: '浪江小学校',
        positon: loc
    };
    infowindow.setOptions(iwopts);
    infowindow.open(map1);
    */
}

function setLocation(no) {
    map1.setZoom(15);
    var loc;
    if (no == 1) {
        loc = new google.maps.LatLng(34.686272,135.519649);
    } else if (no == 2) {
        loc = new google.maps.LatLng(34.606272,135.529649);
    } else if (no == 3) {
        loc = new google.maps.LatLng(34.706272,135.509649);
    }
    map1.setCenter(loc);
}

function panLocation(dx, dy) {
    map1.panBy(dx, dy);
}

function toAustralia() {
    map1.setZoom(2);
    var ll_sw = new google.maps.LatLng(-44.087585,109.335938);
    var ll_ne = new google.maps.LatLng(-4.565474,157.851563);
    var latLngBounds = new google.maps.LatLngBounds(ll_sw, ll_ne);

    infowindow.close();
    var iwopts = {
        content: 'Australia',
        positon: ll_sw
    };
    infowindow.setOptions(iwopts);
    infowindow.open(map1);

    map1.panToBounds(latLngBounds);
}

function toEuropa() {
    map1.setZoom(2);
    var ll_sw = new google.maps.LatLng(31.653381,-19.6875);
    var ll_ne = new google.maps.LatLng(74.019543,48.164063);
    var latLngBounds = new google.maps.LatLngBounds(ll_sw, ll_ne);

    infowindow.close();
    var iwopts = {
        content: 'Europa',
        positon: ll_sw
    };
    infowindow.setOptions(iwopts);
    infowindow.open(map1);

    map1.panToBounds(latLngBounds);
}

function toSAmerica() {
    map1.setZoom(2);
    var ll_sw = new google.maps.LatLng(-58.447733,-96.328125);
    var ll_ne = new google.maps.LatLng(17.308688,-29.882812);
    var latLngBounds = new google.maps.LatLngBounds(ll_sw, ll_ne);

    infowindow.close();
    var iwopts = {
        content: 'SAmerica',
        positon: ll_sw
    };
    infowindow.setOptions(iwopts);
    infowindow.open(map1);

    map1.panToBounds(latLngBounds);
}

google.maps.event.addDomListener(window, 'load', initialize);


