CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB= basicClassification.o advancedClassificationRecursion.o advancedClassificationLoop.o
R= basicClassification.o advancedClassificationRecursion.o
L= basicClassification.o advancedClassificationLoop.o

FLAGS= -Wall -g

.PHONY: all loops recursives recursived loopd clean

all:loops recursives recursived loopd mains maindloop maindrec

loops: libclassloops.a
# $(AR) -rcs  $(L)
libclassloops.a: $(L)
	$(AR) -rcs libclassloops.a $(L)

recursives: libclassrec.a
# $(AR) -rcs .a $(R)
libclassrec.a: $(L)
	$(AR) -rcs libclassrec.a $(L)
	
recursived: libclassrec.so
# $(CC) $(FLAGS) -shared -o libclassrec.so $(L)
libclassrec.so: $(L)
	$(CC) -shared -o libclassrec.so $(L)
	
loopd: libclassloops.so
# $(CC) $(FLAGS) -shared -o libclassloops.so $(L)
libclassloops.so: $(L)
	$(CC) -shared -o libclassloops.so $(L)
	

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a

maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so

maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -fPIC -c basicClassification.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -fPIC -c advancedClassificationRecursion.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -fPIC -c advancedClassificationLoop.c

main.o: main.c NumClass.h 
	$(CC) $(FLAGS) -c main.c

clean:
	rm -f *.o *.so *.a mains maindloop maindrec
