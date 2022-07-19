%builtins output pedersen

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.cairo_builtins import HashBuiltin

func hash_chain{hash_ptr : HashBuiltin*}(arr : felt*, size) -> (r):
    if size == 2:
        let (r) = hash2(x=[arr], y=[arr + 1])
        return (r=r)
    end

    # recursion
    let (r) = hash_chain(arr=arr, size=size - 1)
    let (r) = hash2(x=r, y=[arr + size - 1])
    return(r=r)
end

func main{output_ptr, pedersen_ptr : HashBuiltin*}():
    const ARRAY_SIZE = 4
    let (ptr) = alloc()

    assert [ptr] = 1
    assert [ptr + 1] = 2
    assert [ptr + 2] = 3
    assert [ptr + 3] = 4
        
    let (res) = hash_chain{hash_ptr=pedersen_ptr}(arr=ptr, size=ARRAY_SIZE)
    assert [output_ptr] = res

    # Manually update the output builtin pointer.
    let output_ptr = output_ptr + 1

    # output_ptr and pedersen_ptr will be implicitly returned.
    return ()
end