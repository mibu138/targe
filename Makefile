CC = gcc

CFLAGS = -Wall -Wno-missing-braces -Wno-attributes -fPIC
LDFLAGS = -L/opt/hfs18.0/dsolib -L$(HOME)/lib
INFLAGS = -I$(HOME)/dev
LIBS = -lm -lportaudio
LIB = $(HOME)/lib
LIBNAME = targa
BIN = bin

O = build

NAME = targa

DEPS =  \
		a_audio.h \

OBJS =  \
		$(O)/a_audio.o \

debug: CFLAGS += -g -DVERBOSE=1
debug: all

release: CFLAGS += -DNDEBUG -O3
release: all

all: bin lib tags 

bin: main.c $(OBJS) $(DEPS) 
	$(CC) $(CFLAGS) $(INFLAGS) $(LDFLAGS) $(OBJS) $< -o $(BIN)/$(NAME) $(LIBS)

clean: 
	rm -f $(O)/* $(LIB)/$(LIBNAME)  $(BIN)/$(NAME)

tags:
	ctags -R .

lib: $(OBJS) $(DEPS) 
	$(CC) -shared -o $(LIB)/lib$(LIBNAME).so $(OBJS)

staticlib: $(OBJS) $(DEPS) shaders
	ar rcs $(LIB)/lib$(NAME).a $(OBJS)

$(O)/%.o:  %.c $(DEPS)
	$(CC) $(CFLAGS) $(INFLAGS) -c $< -o $@

