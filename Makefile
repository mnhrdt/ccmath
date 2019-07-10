CFLAGS  = -march=native -O2 -ansi

SRC     = $(shell ls */*.c | grep -v benchmk)
OBJ     = $(SRC:%.c=%.o)
LIB     = libccm.a
default : $(LIB)
$(LIB)  : $(OBJ)  ; $(AR) r $@ $(OBJ)
clean   :         ; $(RM) $(LIB) $(OBJ)
