
OS := $(shell uname)

CFLAGS = -Wall -Wextra -Werror -pthread
ifeq ($(OS),Darwin)
CFLAGS += -mmacosx-version-min=10.6
endif
ifeq ($(OS),SunOS)
CFLAGS += -m32
CFLAGS += -lnsl -lsocket
endif

PROG = sercons

$(PROG): $(PROG).c
	gcc $(CFLAGS) -o $@ $<

clean:
	rm -rf $(PROG) $(PROG).dSYM

