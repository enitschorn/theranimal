import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { displayAlertOnHeartClick } from './../plugins/favorites_list.js';
import { setPricing } from '../plugins/calculate_price';

displayAlertOnHeartClick();
initMapbox();

var therapyStartDate = document.querySelector('#therapy_start_on')
var therapyEndDate = document.querySelector('#therapy_end_on')

therapyStartDate.addEventListener("change", setPricing);
therapyEndDate.addEventListener("change", setPricing);
