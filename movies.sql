CREATE DATABASE "movies-db"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1251'
    LC_CTYPE = 'English_United States.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE IF NOT EXISTS public.countries
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT countries_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.countries
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.dubbing
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    movie_id integer NOT NULL,
    person_id integer NOT NULL,
    CONSTRAINT dubbing_pkey PRIMARY KEY (id),
    CONSTRAINT movies_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT persons_fkey FOREIGN KEY (person_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dubbing
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.genres
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genres_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genres
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.movie_cast
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    movie_id integer NOT NULL,
    person_id integer NOT NULL,
    role text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT movie_cast_pkey PRIMARY KEY (id),
    CONSTRAINT movies_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT persons_fkey FOREIGN KEY (person_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movie_cast
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.movie_genres
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    movie_id integer NOT NULL,
    genre_id integer NOT NULL,
    CONSTRAINT "movies-genres_pkey" PRIMARY KEY (id),
    CONSTRAINT genres_fkey FOREIGN KEY (genre_id)
        REFERENCES public.genres (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT movies_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movie_genres
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.movies
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title text COLLATE pg_catalog."default" NOT NULL,
    release_year smallint NOT NULL,
    composer_id integer,
    country_id integer,
    director_id integer,
    writer_id integer,
    producer_id integer,
    editor_id integer,
    cinematographer_id integer,
    art_director_id integer,
    "box office" bigint,
    description text COLLATE pg_catalog."default",
    budget bigint,
    duration integer,
    CONSTRAINT movies_pkey PRIMARY KEY (id),
    CONSTRAINT countries_fkey FOREIGN KEY (country_id)
        REFERENCES public.countries (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_art_director_fkey FOREIGN KEY (art_director_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_cinematographer_fkey FOREIGN KEY (cinematographer_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_composer_fkey FOREIGN KEY (composer_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_director_fkey FOREIGN KEY (director_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_editor_fkey FOREIGN KEY (editor_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_producer_fkey FOREIGN KEY (producer_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_writer_fkey FOREIGN KEY (writer_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movies
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.persons
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT persons_pkey PRIMARY KEY (id),
    CONSTRAINT persons_unique UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.persons
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.viewerships
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    movie_id integer NOT NULL,
    country_id integer NOT NULL,
    quantity bigint,
    CONSTRAINT viewerships_pkey PRIMARY KEY (id),
    CONSTRAINT countries_fkey FOREIGN KEY (country_id)
        REFERENCES public.countries (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT movies_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.viewerships
    OWNER to postgres;
	
	