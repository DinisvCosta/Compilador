
OBJS=scanner.o parser.o ast.o threeAddress.o main.o
INTERM=scanner.c parser.c parser.h compiler.o printer.o
PROGRAM=./main
CFLAGS=-g 

all: $(PROGRAM)

scanner.c: scanner.flex parser.h
	flex -o scanner.c scanner.flex

parser.c parser.h: parser.bison
	bison --defines=parser.h -o parser.c parser.bison

$(PROGRAM): $(OBJS)
	$(CC) -o $(PROGRAM) $(OBJS)

clean:
	rm -f $(PROGRAM) $(OBJS) $(INTERM)

test: $(PROGRAM)
	$(PROGRAM) matlab.txt

