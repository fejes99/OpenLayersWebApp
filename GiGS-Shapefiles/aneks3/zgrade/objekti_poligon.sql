-- objekti_poligon.sql
--
--   This script creates the spatial table.
--
--   Execute this script before attempting to use SQL*Loader
--   to load the objekti_poligon.ctl file.
--
--   This script will also populate the USER_SDO_GEOM_METADATA table.
--   Loading the .ctl file will populate the OBJEKTI_POLIGON table.
--
--   To load the .ctl file, run SQL*Loader as follows
--   substituting appropriate values:
--       sqlldr username/password objekti_poligon.ctl
--
--   After the data is loaded in the OBJEKTI_POLIGON table, you should
--   migrate polygon data and create the spatial index 
--
-- Creation Date : Fri Aug 14 10:02:41 2009
-- Copyright 1999, 2004 Oracle Corporation
-- All rights reserved
--
DROP TABLE OBJEKTI_POLIGON;

CREATE TABLE OBJEKTI_POLIGON (
  ID 	NUMBER(38) 
	PRIMARY KEY, 
  Entity 	VARCHAR2(16), 
  Handle 	VARCHAR2(16), 
  Layer 	VARCHAR2(254), 
  LyrFrzn 	NUMBER, 
  LyrLock 	NUMBER, 
  LyrOn 	NUMBER, 
  LyrVPFrzn 	NUMBER, 
  LyrHandle 	VARCHAR2(16), 
  Color 	NUMBER, 
  EntColor 	NUMBER, 
  LyrColor 	NUMBER, 
  BlkColor 	NUMBER, 
  Linetype 	VARCHAR2(254), 
  EntLinetyp 	VARCHAR2(254), 
  LyrLnType 	VARCHAR2(254), 
  BlkLinetyp 	VARCHAR2(254), 
  Elevation 	NUMBER, 
  Thickness 	NUMBER, 
  LineWt 	NUMBER, 
  EntLineWt 	NUMBER, 
  LyrLineWt 	NUMBER, 
  BlkLineWt 	NUMBER, 
  RefName 	VARCHAR2(254), 
  LTScale 	NUMBER, 
  ExtX 	NUMBER, 
  ExtY 	NUMBER, 
  ExtZ 	NUMBER, 
  DocName 	VARCHAR2(254), 
  DocPath 	VARCHAR2(254), 
  DocType 	VARCHAR2(32), 
  DocVer 	VARCHAR2(16), 
  GEOM 	MDSYS.SDO_GEOMETRY);

DELETE FROM USER_SDO_GEOM_METADATA 
  WHERE TABLE_NAME = 'OBJEKTI_POLIGON' AND COLUMN_NAME = 'GEOM' ;

INSERT INTO USER_SDO_GEOM_METADATA (TABLE_NAME, COLUMN_NAME, DIMINFO, SRID) 
  VALUES ('OBJEKTI_POLIGON', 'GEOM', 
    MDSYS.SDO_DIM_ARRAY 
      (MDSYS.SDO_DIM_ELEMENT('X', 7396496.894740830, 7397400.666197589, 0.050000000), 
       MDSYS.SDO_DIM_ELEMENT('Y', 5106597.198306773, 5107213.838484742, 0.050000000)  
     ), 
     31277); 
COMMIT;
