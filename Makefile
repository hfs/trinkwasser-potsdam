%.geojson: %.shp
	ogr2ogr -dim 2 -f GeoJSON $@ $<

%.gcp: %.geojson geojson2gcp.py
	./geojson2gcp.py < $< > $@

ewp_bezirke_georef.shp: ewp_bezirke.shp vector_bender.gcp
	ogr2ogr -tps $@ -a_srs EPSG:4326 $$(cat vector_bender.gcp) $<

ewp_trinkwasserschutzgebiete_georef.shp: ewp_trinkwasserschutzgebiete.shp vector_bender_trinkwasserschutzgebiete.gcp
	ogr2ogr -tps $@ -a_srs EPSG:4326 $$(cat vector_bender_trinkwasserschutzgebiete.gcp) $<
