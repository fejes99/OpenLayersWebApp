import './index.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import ImageLayer from 'ol/layer/Image';
import ImageWMS from 'ol/source/ImageWMS';
import LayerGroup from 'ol/layer/Group';
import XYZ from 'ol/source/XYZ';
import LayerSwitcher from 'ol-layerswitcher';
import { fromLonLat } from 'ol/proj';
import { createXYZ } from 'ol/tilegrid';

const googleMapLayer = new TileLayer({
  title: 'Google Maps',
  source: new XYZ({
    url: 'http://mt0.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}',
  }),
  type: 'base',
  visible: true,
});

const googleSatelliteMapLayer = new TileLayer({
  title: 'Google Satellite Map',
  source: new XYZ({
    url: 'http://mt0.google.com/vt/lyrs=s&hl=en&x={x}&y={y}&z={z}',
  }),
  type: 'base',
  visible: false,
});

const yandexMapLayer = new TileLayer({
  title: 'Yandex',
  source: new XYZ({
    url: 'https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}',
    projection: 'EPSG:3395',
    tileGrid: createXYZ({
      extent: [-20037508.342789244, -20037508.342789244, 20037508.342789244, 20037508.342789244],
    }),
  }),
  visible: false,
  type: 'base',
});

const openStreetMapLayer = new TileLayer({
  title: 'Open Street Map',
  source: new OSM(),
  visible: false,
  type: 'base',
});

const mapsLayerGroup = new LayerGroup({
  title: 'Tip mape',
  layers: [googleMapLayer, googleSatelliteMapLayer, yandexMapLayer, openStreetMapLayer],
});

const serbiaLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:serbia',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Srbija',
  visible: false,
  opacity: 0.7,
});

const districtsLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Districts',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Okruzi',
  visible: false,
  opacity: 0.7,
});

const regionsLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Regions',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Pokrajine',
  visible: false,
  opacity: 0.7,
});

const municipalitiesLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Municipalities',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Opštine',
  visible: false,
  opacity: 0.7,
});

const regionsLayerGroup = new LayerGroup({
  title: 'Regije',
  layers: [serbiaLayer, districtsLayer, regionsLayer, municipalitiesLayer],
});

const riversLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Rivers',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Reke',
  visible: false,
  opacity: 0.7,
});

const natureLayerGroup = new LayerGroup({
  title: 'Priroda',
  layers: [riversLayer],
});

const roadsLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Roads',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Drumski',
  visible: false,
  opacity: 0.7,
});

const railroadsLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Railroads',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Železnica',
  visible: false,
  opacity: 0.7,
});

const roadsLayerGroup = new LayerGroup({
  title: 'Putevi',
  layers: [roadsLayer, railroadsLayer],
});

const serbianBordersLayer = new ImageLayer({
  source: new ImageWMS({
    url: 'http://localhost:8080/geoserver/cite/wms',
    params: {
      LAYERS: 'cite:Serbian borders covered with cameras',
      FORMAT: 'image/png',
      TRANSPARENT: true,
    },
    serverType: 'geoserver',
  }),
  title: 'Prelazi prekriveni kamerama',
  visible: false,
  opacity: 0.7,
});

const bordersLayerGroup = new LayerGroup({
  title: 'Granični prelazi',
  layers: [serbianBordersLayer],
});

const map = new Map({
  target: 'map',
  layers: [mapsLayerGroup, regionsLayerGroup, natureLayerGroup, roadsLayerGroup, bordersLayerGroup],
  view: new View({
    center: fromLonLat([20.91667, 44.29111]),
    zoom: 7,
  }),
});

const layerSwitcher = new LayerSwitcher({
  tipLabel: 'Legend',
  groupSelectStyle: 'children',
});

map.addControl(layerSwitcher);
