# Write a program poly.cairo that computes the expression:
#   x^3 + 23x^2 + 45x + 67 , x = 100

func main():
    tempvar x = 100
    # << Your code here >>
    tempvar a = x + 23 # x + 23
    tempvar b = x * a # x(x + 23)
    tempvar c = b + 45 # x(x + 23) + 45
    tempvar d = c * x # x(x(x + 23) + 45)
    tempvar e = d + 67 # x(x(x + 23) + 45) + 67
    ret
end