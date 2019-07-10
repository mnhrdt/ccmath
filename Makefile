CFLAGS  = -march=native -O3

SRC     = $(shell ls */*.c | grep -v benchmk)
OBJ     = $(SRC:%.c=%.o)
LIB     = libccm.a
default : $(LIB)
$(LIB)  : $(OBJ)  ; $(AR) r $@ $(OBJ)
clean   :         ; $(RM) $(LIB) $(OBJ)
