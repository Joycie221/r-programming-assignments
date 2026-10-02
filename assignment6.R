# defines matrices A and B
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# matrix addition
A_plus_B <- A + B
print("Matrix A + B:")
print(A_plus_B)

# matrix subtraction
A_minus_B <- A - B
print("Matrix A - B:")
print(A_minus_B)

# constructs a 4x4 diagonal matrix with diagonal entries
D <- diag(c(4, 1, 2, 3))
print("Matrix D (4x4 Diagonal):")
print(D)

# sets the first row (columns 2:5) to 1, and the first column (rows 2:5) to 2.
M <- diag(3, nrow = 5, ncol = 5)
M[1, 2:5] <- 1
M[2:5, 1] <- 2

print("Custom 5x5 Matrix:")
print(M)
