import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  };

  connect() {
    console.log("MapboxController connected!");
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    const longlat = [20,20]
    this.#addMarkersToMap(longlat)
    this.#fitMapToMarkers(longlat)
  }

  #addMarkersToMap(longlat) {
    new mapboxgl.Marker()
      .setLngLat(longlat)
      .addTo(this.map)
  };

  #fitMapToMarkers(longlat) {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend(longlat)
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 3, duration: 0 })
  }

}
