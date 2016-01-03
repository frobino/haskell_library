CC=ghc

all: simplejson.x

simplejson.x: Main.hs
	${CC} -o simplejson.x Main.hs 

SimpleJSON.o: SimpleJSON.hs
	${CC} -c SimpleJSON.hs

clean:
	rm -rf *.o *.hi *.x
