CC = clang
CFLAGS = 
LDFLAGS = 
SRC := $(wildcard *.c)
DEP := $(wildcard *.h)
OBJ := $(SRC:.c=.o)
BIN := $(shell basename $$PWD)

.PHONY: all
all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -f $(OBJ)

.PHONY: distclean
distclean: clean
	rm -f $(BIN)
