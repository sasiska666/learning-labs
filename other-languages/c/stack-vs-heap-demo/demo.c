#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Demonstrates a safe, bounded copy into a heap buffer. */
int main(void) {
    const char *input = "short text";
    size_t cap = 16;
    char *heap = malloc(cap);
    if (!heap) return 1;
    snprintf(heap, cap, "%s", input);   /* never writes past cap */
    char stack[16];
    snprintf(stack, sizeof stack, "%s", input);
    printf("heap : %s (%zu bytes allocated)\n", heap, cap);
    printf("stack: %s (%zu bytes array)\n", stack, sizeof stack);
    free(heap);
    return 0;
}
