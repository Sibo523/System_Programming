CC=gcc
AR=ar
OBJECTS_MAIN=main.o
R= basicClassification.o advancedClassificationRecursion.o
L= basicClassification.o advancedClassificationLoop.o
FLAGS= -Wall -g
f = fPIC

.PHONY: clean all  
# loops recursives recursived loopd
all:recursives loops  recursived loopd mains maindrec maindloop 

loops: libclassloops.a
libclassloops.a: $(L)
	$(AR) -rcs libclassloops.a $(L)

recursives: libclassrec.a
libclassrec.a: $(R)
	$(AR) -rcs libclassrec.a $(R)
	
recursived: libclassrec.so
libclassrec.so: $(R)
	$(CC) -shared -o libclassrec.so $(R)
	
loopd: libclassloops.so
libclassloops.so: $(L)
	$(CC) -shared -o libclassloops.so $(L)
	

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o $@ $^

maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o $@ $(OBJECTS_MAIN) ./libclassloops.so

maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o $@ $(OBJECTS_MAIN) ./libclassrec.so

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -$(f) -c $<

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -$(f) -c $<

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -$(f) -c $<

main.o: main.c NumClass.h 
	$(CC) $(FLAGS) -c $<

clean:
	rm -f *.o *.so *.a mains maindloop maindrec
