%builtins output pedersen


from starkware.cairo.common.hash import hash2
from starkware.cairo.common.cairo_builtins import HashBuiltin

func compute_hash{hash_ptr : HashBuiltin*}(x, y, z) -> (r):
    let (h1) = hash2(x, y)
    let (r) = hash2(h1, z)
    
    return(r=r)
end

func main{output_ptr, pedersen_ptr : HashBuiltin*}():
    let (res) = compute_hash{hash_ptr=pedersen_ptr}(1,2,3)
    assert [output_ptr] = res

    # Manually update the output builtin pointer.
    let output_ptr = output_ptr + 1

    # output_ptr and pedersen_ptr will be implicitly returned.
    return ()
end
