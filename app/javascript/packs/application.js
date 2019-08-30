import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { displayAlertOnHeartClick } from './../plugins/favorites_list.js'

displayAlertOnHeartClick();
initMapbox();
