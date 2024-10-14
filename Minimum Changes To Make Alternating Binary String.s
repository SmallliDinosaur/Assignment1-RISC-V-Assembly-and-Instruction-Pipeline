.data
    string1: .asciz "0100"  # Test case 1
    string2: .asciz "10"    # Test case 2
    string3: .asciz "1111"  # Test case 3
    newline: .asciz "\n"    # Newline character

    .text
    .globl main
main:
    la a0, string1       # Load the address of string1
    jal process_string   # Process string1
    jal print_result     # Output the result of string1

    la a0, string2       # Load the address of string2
    jal process_string   # Process string2
    jal print_result     # Output the result of string2

    la a0, string3       # Load the address of string3
    jal process_string   # Process string3
    jal print_result     # Output the result of string3

    li a0, 1          # Set the exit code to 1
    li a7, 93         # ecall number 93 is for exit
    ecall

process_string:
    li t0, 0            # i = 0
    li t1, 0            # c1 = 0
    li t2, 0            # c2 = 0

process_loop:
    lb t3, 0(a0)        # Load the current character from the string
    beqz t3, end_process # Exit if the current character is '\0'

    # Check if s[i] == i % 2
    li t4, 48           # Load the ASCII value of character '0'
    sub t5, t3, t4      # Calculate s[i] - '0' (convert ASCII to number)
    
    andi t6, t0, 1      # Use bitwise operation for i % 2, get the lowest bit of i
    beq t5, t6, inc_c1  # If equal, increment c1++
    j inc_c2            # If not equal, increment c2++

inc_c1:
    addi t1, t1, 1      # c1++
    j next_char         # Jump to the next character

inc_c2:
    addi t2, t2, 1      # c2++

next_char:
    addi t0, t0, 1      # i++
    addi a0, a0, 1      # Move the string pointer to the next character
    j process_loop      # Continue processing the next character

end_process:
    # Compare c1 and c2, take the minimum value
    bge t1, t2, output_c2
    mv a0, t1           # a0 = c1
    j end_process_func

output_c2:
    mv a0, t2           # a0 = c2

end_process_func:
    jr ra               # Return to the main program

print_result:
    li a7, 1            # ecall number 1 is for printing an integer
    ecall               # System call to print the content of a0

    la a0, newline      # Load the address of the newline character
    li a7, 4            # ecall number 4 is for printing a string
    ecall               # System call to print a newline
    jr ra               # Return to the main program