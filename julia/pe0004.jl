"""
https://projecteuler.net/problem=4
Largest palindrome product
Problem 4

A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
v1 euler(99) = (9009, 9801)
v1 euler(999) = (906609, 998001)
v2 euler1(2) = (9009, 8100)
v2 euler1(3) = (906609, 810000)
v3 euler2(2) = (9009, 99, 91, 21)
v3 euler2(3) = (906609, 993, 913, 2169)
v3 euler2(4) = (99000099, 9999, 9901, 2451)

Note:  This could be made more efficient if the order of pairs checked were sorted by sum
from high to low.  I couldn't figure out how to do this, though!  And don't check duplicates,
considering pairs 9 * 8 == 8 * 9.
"""
function ispallindrome(s)
    if length(s) ≤ 1
        return true
    else
        return s[1] == s[end] && ispallindrome(s[2:end-1])
    end
end

"""
The two numbers are created in a normal nested for loop.
The range is restricted to yield the correct number of digits.
"""
function euler1(n)
    steps = 0
    pallindromes = []
    for a in 10^(n-1) : 10^n - 1
        for b in 10^(n-1) : 10^n - 1
            steps += 1
            ab = a * b
            if ispallindrome(string(ab))
                push!(pallindromes, (ab, a, b))
            end
        end
    end
    return maximum(pallindromes), steps
end

"""
Generates an array of tuples with d digits that sum to n.
"""
function sum2n(n, d) # n = number to sum to, d = number of digits
    a = 10^d - 1
    output = []
    while true
        b = n - a
        if a < b
            break
        end
        push!(output, (a, b))
        a -= 1
    end
    return output
end

"""
This algorithm uses the observation that two numbers with a greater sum will have a greater product.
"""
function euler2(n)
    steps = 0
    pallindromes = []
    for dsum in (2 * 10^n - 1) : -1 : 2
        for (a, b) in sum2n(dsum, n)
            steps += 1
            ab = a * b
            if ispallindrome(string(ab))
                return (a*b, a, b, steps)
                push!(pallindromes, (ab, a, b))
            end
        end
    end
    return maximum(pallindromes), steps
end

function test()
    @show(euler1(2))
    @show(euler1(3))
    @show(euler1(4))
    @show(euler2(2))
    @show(euler2(3))
    @show(euler2(4))
    @show(euler2(5))
    @show(euler2(6))
    nothing
end




