#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Function to perform matrix multiplication
void matrix_mul(int *a, int *b, int *c, int N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            c[i * N + j] = 0;
            for (int k = 0; k < N; k++) {
                c[i * N + j] += a[i * N + k] * b[k * N + j];
            }
        }
    }
}

// Verify result
void verify_result(int *a, int *b, int *c, int N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int temp = 0;
            for (int k = 0; k < N; k++) {
                temp += a[i * N + k] * b[k * N + j];
            }
            assert(temp == c[i * N + j]);
        }
    }
}

int main() {

    int N = 1 << 10; // 1024

    int *a = (int*)malloc(N * N * sizeof(int));
    int *b = (int*)malloc(N * N * sizeof(int));
    int *c = (int*)malloc(N * N * sizeof(int));

    for (int i = 0; i < N * N; i++) {
        a[i] = rand() % 100;
        b[i] = rand() % 100;
    }

    matrix_mul(a, b, c, N);
    verify_result(a, b, c, N);

    printf("COMPLETED SUCCESSFULLY\n");

    free(a);
    free(b);
    free(c);

    return 0;
}
