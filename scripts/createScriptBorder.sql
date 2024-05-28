CREATE TABLE public."Border"
(
	"borderId" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 1000 CACHE 1 ),
    name text NOT NULL,
    location geography NOT NULL,
    PRIMARY KEY ("borderId")
);

ALTER TABLE IF EXISTS public."Border"
    OWNER to postgres;