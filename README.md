# LLVM and CUDA-PTX
本repo简单描述了LLVM调用CUDA GPU的示例。

LLVM是用来统一各个编译器语言与硬件之间的产生的gap。 所有的程序语言一旦接入到LLVM层面，那么在各个硬件上的运行就不存在障碍。而CUDA等硬件层面一直是LLVM发力的方向。因为上层接入MLIR，这是深度学习方面的一个研究方向。

PTX是什么？
[PTX](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html)是NVIDIA官方的针对GPU的一种汇编语言。 目前的LLVM去驱动NVIDIA的GPU就是采用的PTX来进行运行。

## 流程
1. 编写llvm代码。
2. 使用llc进行编译为ptx代码。 （如果使用到自带的库，libdevice.10.bc，需要进行llvm-link进行链接）
3. 编写主函数来调用ptx代码。
4. 运行

## example 这里演示的是幂方
```
>>> make
>>> ./sample
Using CUDA Device [0]: NVIDIA GeForce RTX 3080 Ti
Device Compute Capability: 8.6
Launching kernel
Results:
0 op 2 = 0
1 op 2 = 1
2 op 2 = 4
3 op 2 = 9
4 op 2 = 16
5 op 2 = 25
6 op 2 = 36
7 op 2 = 49
8 op 2 = 64
9 op 2 = 81
10 op 2 = 100
11 op 2 = 121
12 op 2 = 144
13 op 2 = 169
14 op 2 = 196
15 op 2 = 225
```
