CFLAGS  = -Wall -march=native -O2 -ansi

SRC     = $(shell ls src/*/*.c | grep -v benchmk)
OBJ     = $(SRC:%.c=%.o)

PNAME   = libccm
PVERSO  = 2
PVER    = $(PVERSO).2.1
LIBA    = $(PNAME).a
LIBSO   = $(PNAME).so.$(PVERSO)
LIB     = $(LIBA) $(LIBSO)
AR      = ar
LD      = ld
INSTALL = install

default: $(LIB)

$(LIBA): $(OBJ)
	$(AR) r $@ $^

$(LIBSO): $(OBJ)
	$(LD) -shared -o $@ $^

clean:
	$(RM) $(LIB) $(OBJ)
