# oneAPI GPU Optimization Guide - Memory Allocation
main source >>> https://www.intel.com/content/www/us/en/docs/oneapi/optimization-guide-gpu/2023-0/memory-allocation.html.

This repo tests different memory allocations for OpenMP offload to Intel PVC gpus. 
Make sure you have Intel icpx compiler available on your system and a PVC instance (spir64).
For example, you can access [Intel Developer Cloud](https://www.intel.com/content/www/us/en/developer/tools/devcloud/services.html) (it is easy and free as we speak). 

# How to compile and test the exmaple
``` make clean ```

```make```

```./run_all.sh```

you can find some helpful commands to read gpu stats (using xpu-smi) in ```gpu-info-useful-commands.txt```.
