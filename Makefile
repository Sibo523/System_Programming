CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB= basicClassification.o advancedClassificationRecursion.o advancedClassificationLoop.o
OBJECTS_rec= basicClassification.o advancedClassificationRecursion.o
OBJECTS_loop= basicClassification.o advancedClassificationLoop.o

FLAGS= -Wall -g

all: progmains progloop progrec

progmains: $(OBJECTS_MAIN) libmylib.a #total
	$(CC) $(FLAGS) -o progmains $(OBJECTS_MAIN) -L. -lmylib
libmylib.a: $(OBJECTS_LIB) #total
	$(AR) -rcs libmylib.a $(OBJECTS_LIB)

#//////////////////////////////////////////////
progrec: $(OBJECTS_MAIN) libclassrec.a #rec
	$(CC) $(FLAGS) -o progrec $(OBJECTS_MAIN) -L. -lmylib

libclassrec.a: $(OBJECTS_rec) #rec static
	$(AR) -rcs libclassrec.a $(OBJECTS_rec)

libclassrec.so: $(OBJECTS_rec) #rec static
	$(AR) -shared libclassrec.so $(OBJECTS_rec)

#//////////////////////////////////////////////
progloop: $(OBJECTS_MAIN) libclassloops.a #loop
	$(CC) $(FLAGS) -o progloop $(OBJECTS_MAIN) -L. -lmylib

libclassloops.a: $(OBJECTS_loop) #loop
	$(AR) -rcs libclassloops.a $(OBJECTS_loop)
libclassloops.so: $(OBJECTS_loop) #loop
	$(AR) -shared libclassloops.so $(OBJECTS_loop)

#////////////////////////////////////////////


basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

.PHONY: clean all

clean:
	rm -f *.o *.a progmains progloop progrec
