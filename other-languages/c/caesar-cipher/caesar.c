#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

/* Shift letters by `shift` positions; other characters stay unchanged. */
static void caesar(char *s, int shift) {
    shift = ((shift % 26) + 26) % 26;
    for (; *s; s++) {
        if (isupper((unsigned char)*s))
            *s = 'A' + (*s - 'A' + shift) % 26;
        else if (islower((unsigned char)*s))
            *s = 'a' + (*s - 'a' + shift) % 26;
    }
}

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s SHIFT \"text\"   (negative SHIFT decrypts)\n", argv[0]);
        return 1;
    }
    char *end;
    long shift = strtol(argv[1], &end, 10);
    if (*end != '\0') {
        fprintf(stderr, "SHIFT must be an integer\n");
        return 1;
    }
    char *buf = strdup(argv[2]);
    if (!buf) return 1;
    caesar(buf, (int)(shift % 26));
    puts(buf);
    free(buf);
    return 0;
}
