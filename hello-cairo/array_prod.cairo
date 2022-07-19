%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func array_product(arr : felt*, size) -> (prod):
    if size == 1:
        return (prod=1)
    end

    let (product) = array_product(arr=arr + 2, size=size - 2)
    return (prod=[arr] * product)    
end

func main{output_ptr : felt*}():
    const ARRAY_SIZE = 8

    # Allocate memory for an array: ptr
    let (ptr) = alloc()

    # Manually populate an array of size ARRAY_SIZE
    assert [ptr] = 1
    assert [ptr + 1] = 2
    assert [ptr + 2] = 3
    assert [ptr + 3] = 4
    assert [ptr + 4] = 5
    assert [ptr + 5] = 6
    assert [ptr + 6] = 7
    assert [ptr + 7] = 8

    # Call array_product to compute the product of even elements of ptr
    let (prod) = array_product(arr=ptr, size=ARRAY_SIZE)

    # Write prod to the program output
    serialize_word(prod)

    return ()
end