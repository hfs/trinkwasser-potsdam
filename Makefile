ewp_bezirke_georef.geojson: ewp_bezirke_georef.shp
	ogr2ogr -dim 2 -f GeoJSON $@ $<

ewp_bezirke_georef.shp: ewp_bezirke.shp vector_bender.gcp
	ogr2ogr -tps $@ -a_srs EPSG:4326 $$(cat vector_bender.gcp) $<

vector_bender.gcp: vector_bender.geojson geojson2gcp.py
	./geojson2gcp.py < $< > $@

vector_bender.geojson: vector_bender.shp
	ogr2ogr -f GeoJSON $@ $<

