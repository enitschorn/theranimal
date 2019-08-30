import "bootstrap";

import { initMapbox } from './../plugins/init_mapbox'
import { initAutocomplete } from './../plugins/init_autocomplete'

initMapbox();
initAutocomplete();

import { displayAlertOnHeartClick } from './../plugins/favorites_list.js'

displayAlertOnHeartClick();
