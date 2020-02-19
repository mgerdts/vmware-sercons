
OS := $(shell uname)

CFLAGS = -Wall -Wextra -Werror
ifeq ($(OS),Darwin)
CFLAGS += -m32
CFLAGS += -mmacosx-version-min=10.6
endif
ifeq ($(OS),SunOS)
CFLAGS += -m32
CFLAGS += -lnsl -lsocket
endif
ifeq ($(OS),Linux)
CFLAGS += -lpthread
endif

PROG = sercons

$(PROG): $(PROG).c
	gcc $(CFLAGS) -o $@ $<

clean:
	rm -rf $(PROG) $(PROG).dSYM

