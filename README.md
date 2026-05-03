# 🚀 CUDA Practice

A collection of CUDA programs exploring GPU computing concepts such as parallel execution, memory management, and performance optimization.

---

## 📚 Contents

* Vector Addition
* Vector Multiplication
* Matrix Multiplication
* Memory Management
* CUDA Streams *(coming soon)*

---

## ⚙️ Requirements

* NVIDIA GPU (for local execution)
* CUDA Toolkit
* C/C++ Compiler (`nvcc`)

---

## ▶️ How to Run

### 💻 Run Locally (with NVIDIA GPU)

Ensure CUDA is installed and `nvcc` is available in your system path.

**Compile:**

```id="j1dahg"
nvcc filename.cu -o output
```

**Run:**

```id="4lvg6v"
./output
```

---

### ☁️ Run on Google Colab (No GPU Required)

You can use **Google Colab** for free GPU access.

#### Steps:

1. Open Colab and create a new notebook

2. Enable GPU:

   * Go to **Runtime → Change runtime type → GPU**

3. Verify GPU availability:

```id="1tttsq"
!nvidia-smi
```

4. Check CUDA compiler:

```id="69a0v8"
!nvcc --version
```

5. Clone this repository:

```id="8g0f6f"
!git clone https://github.com/your-username/cuda-practice.git
%cd cuda-practice
```

6. Compile your CUDA program:

```id="iqs4bp"
!nvcc filename.cu -o output
```

7. Run the program:

```id="5lg81e"
!./output
```

---

## 🎯 Goal

To build a strong foundation in GPU programming by implementing and understanding core CUDA concepts, including parallel execution, memory hierarchy, and performance optimization.

---

## 📌 Notes

* Each folder contains standalone CUDA programs.
* Programs are written for learning and experimentation purposes.
* More advanced topics and optimizations will be added over time.

---

## 🚧 Future Improvements

* Performance comparison (CPU vs GPU)
* Memory optimization techniques
* Advanced CUDA features (streams, shared memory, etc.)
