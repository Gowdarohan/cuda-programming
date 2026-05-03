#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cuda_runtime.h>

// Host function
void vec_mul_host(float* A_h, float* B_h, float* C_h, int n){
    for(int i = 0; i < n; i++){
        C_h[i] = A_h[i] * B_h[i];
    }
}

// Kernel function
__global__ void vecmulkernel(float* A_d, float* B_d, float* C_d, int n){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n){
        C_d[i] = A_d[i] * B_d[i];
    }
}

void vecmuldevice(float* A_h, float* B_h, float* C_h, int n){
    int size = n * sizeof(float);
    float *A_d, *B_d, *C_d;

    cudaMalloc((void**)&A_d, size);
    cudaMalloc((void**)&B_d, size);
    cudaMalloc((void**)&C_d, size);

    cudaMemcpy(A_d, A_h, size, cudaMemcpyHostToDevice);
    cudaMemcpy(B_d, B_h, size, cudaMemcpyHostToDevice);

    int threadsPerBlock = 256;
    int blocksPerGrid = (n + threadsPerBlock - 1) / threadsPerBlock;

    vecmulkernel<<<blocksPerGrid, threadsPerBlock>>>(A_d, B_d, C_d, n);

    cudaMemcpy(C_h, C_d, size, cudaMemcpyDeviceToHost);

    cudaFree(A_d);
    cudaFree(B_d);
    cudaFree(C_d);
}

int main(){
    int n = 1773449;
    float *A, *B, *C;

    A = (float*)malloc(n * sizeof(float));
    B = (float*)malloc(n * sizeof(float));
    C = (float*)malloc(n * sizeof(float));

    for(int i = 0; i < n; i++){
        A[i] = i;
        B[i] = i;
    }

    // Host timing
    clock_t start_host = clock();
    vec_mul_host(A, B, C, n);
    clock_t end_host = clock();
    double host_time = (double)(end_host - start_host) / CLOCKS_PER_SEC;

    // Device timing
    clock_t start_device = clock();
    vecmuldevice(A, B, C, n);
    cudaDeviceSynchronize();// wait until all the threads complete there execution
    clock_t end_device = clock();

    double device_time = (double)(end_device - start_device) / CLOCKS_PER_SEC;

    printf("Time taken for Host: %f seconds\n", host_time);
    printf("Time taken for Device: %f seconds\n", device_time);

    free(A);
    free(B);
    free(C);

    return 0;
}