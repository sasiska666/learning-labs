#include <stdio.h>

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s FILE\n", argv[0]);
        return 1;
    }
    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("fopen");
        return 1;
    }
    long lines = 0;
    int c, last = '\n';
    while ((c = fgetc(f)) != EOF) {
        if (c == '\n') lines++;
        last = c;
    }
    if (last != '\n') lines++;   /* final line without newline */
    fclose(f);
    printf("%ld\n", lines);
    return 0;
}
