# define matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

# inspect dimensions
dim(A)  
dim(B)

# determinant of A
detA <- tryCatch(det(A), error = function(e) e$message)
print(paste("det(A):", detA))

# inverse of A
invA <- tryCatch(solve(A), error = function(e) e$message)
print(paste("solve(A):", invA))

# determinant of B
detB <- tryCatch(det(B), error = function(e) e$message)
print(paste("det(B) error:", detB))

# inverse of B
invB <- tryCatch(solve(B), error = function(e) e$message)
print(paste("solve(B) error:", invB))
