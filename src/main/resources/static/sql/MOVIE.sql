CREATE TABLE MOVIE (
    MOVIE_CODE VARCHAR2(20) PRIMARY KEY, 
    MOVIE_TITLE VARCHAR2(255),
    MOVIE_DIRECTOR VARCHAR2(100),
    MOVIE_POSTER VARCHAR2(255),
    MOVIE_ACTORS VARCHAR2(500),
    MOVIE_GENRE VARCHAR2(100),
    MOVIE_RUNTIME VARCHAR2(20),
    MOVIE_OPENDATE VARCHAR2(20),
    MOVIE_GRADE VARCHAR2(20),
    MOVIE_PLOT VARCHAR2(3000),
    MOVIE_STAR NUMBER(1, 1) CHECK (MOVIE_STAR >= 0 AND MOVIE_STAR <= 5),
    MOVIE_RELASE VARCHAR2(20),
    MOVIE_SCREEN VARCHAR2(20)
    
);