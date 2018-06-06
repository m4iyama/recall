const makeMap = () => {
    return new GMaps({
        div: '#map',
        lat: 35.6896,
        lng: 139.6921,
    });
};

const setMapCenter = map => {
    GMaps.geolocate({
        success: function (position) {
            map.setCenter(position.coords.latitude, position.coords.longitude);
        },
        error: function (error) {
        },
        not_supported: function () {
        },
    });
};

const locateMarkers = (markers, map) => {
    markers.forEach(function(marker) {
        map.addMarker({
            lat: marker.lat,
            lng: marker.lng,
            infoWindow: {
                content: `<img src=${marker.photo_url} height='100' />`
            },
            mouseover: function (e) {
                this.infoWindow.open(map, this);
            },
            mouseout: function (e) {
                this.infoWindow.close();
            },
            click: function (e) {
                window.location.href = marker.post_url
            }
        })
    });
};
