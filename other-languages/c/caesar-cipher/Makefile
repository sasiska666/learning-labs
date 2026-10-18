CC ?= gcc
CFLAGS = -Wall -Wextra -O2

caesar: caesar.c
	$(CC) $(CFLAGS) -o caesar caesar.c

test: caesar
	@test "$$(./caesar 3 'Hello, World!')" = "Khoor, Zruog!" && echo "encrypt OK"
	@test "$$(./caesar -3 'Khoor, Zruog!')" = "Hello, World!" && echo "decrypt OK"

clean:
	rm -f caesar
