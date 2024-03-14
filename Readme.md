# 16-Bit Binary Divider

This project implements a 16-bit binary divider using the restoring division algorithm for unsigned numbers.

## Introduction

The restoring division algorithm is a commonly used method for performing binary division. It follows an iterative approach, subtracting the divisor from the dividend and shifting both registers until the division is complete. This algorithm aligns the binary numbers by appending zeros to the left of the dividend to ensure they have the same number of bits. It then compares the current dividend with the divisor, subtracts if possible, and sets the corresponding bit in the quotient register. After each subtract operation, the registers are shifted left. This process continues until all bits in the dividend have been processed, resulting in a quotient stored in the quotient register and a remainder in the dividend register.

## Algorithm

1. Load the 16/8-bit divisor and dividend values into the system.
2. The system takes these values at the positive edge of the input 'Ready', provided by the user.
3. Clear all previous results (if any).
4. Save the divisor value in an intermediate register.
5. Compute the 2's complement of the divisor.
6. Initialize the count value as 16.
7. Extend the 16-bit dividend to 32 bits by filling in zeros (barrel extend).
8. At the positive edge of the launch signal, indicating that the necessary initial conditions have been met.
9. Left-shift the 32-bit extended dividend by one bit.
10. Save the first 16 MSB bits in an intermediate register.
11. Add the 2's complement of the divisor to the first 16 MSB bits.
12. If the MSB bit of the system is 1, then the LSB remains zero, and the first 16 bits are replaced by the saved 16 bits (from step 10).
13. If the MSB is zero, then the LSB is set to 1.
14. Decrement the count value and repeat from step 10 if the count value is not zero.
15. After the count is zero, the system indicates through the intermediate 'Done' signal.
16. The lower 16 bits represent the quotient, and the upper 16 bits represent the remainder, provided by 'Inter_rem' and 'Inter_Ouot', respectively.
17. To provide different values to the system, set the input 'Ready' to zero and repeat from step 1.

## Results

The output waveform obtained in the transcript window and waveform display serves as a verification of the division implementation.

The waveform displays different stages of the division process and aids in verifying the correctness of the implementation.
