func main():
    call foo 
    call foo
    call foo

    ret
end

func foo():
    [ap] = ap
    [ap + 1] = fp
    ret
end