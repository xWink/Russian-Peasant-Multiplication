# Russian-Peasant-Multiplication

#### Contained in this folder are three programs:
* multiply.adb
* multiply.c
* multiply.f95

## How to Use the Programs:
1. Compile the desired program
    * multiply.adb: `gnatmake multiply.adb`
    * multiply.c: `gcc -std=c11 -o multiply multiply.c`
    * multiply.f95: `gfortran multiply.f95 -o multiply`
2. Run with `./multiply`
3. Input a the first number
4. Input the second number
5. Program will multiply the two numbers together recursively and iteratively,
then print the product and runtime of each algorithm

#### Example:
```
Enter multiplier: 4
Enter multiplicand: 5

Recursive product: 20
Nonrecursive product: 20

Recursive runtime: 0.004000 ms
Nonrecursive runtime: 0.003000 ms
```

## Analysis
A small experiment was performed on the three programs using a wide range of
products. Graphing, analysis, and further discussion on the data collected is
available in Analysis.pdf
