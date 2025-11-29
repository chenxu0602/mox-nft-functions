# pragma version 0.4.3
# @license GPL-3.0-or-later


call_anyting_address: public(address)
MAX_OUTSIZE: constant(uint256) = 32
EMPTY_BYTES: constant(Bytes[32]) = b''


@external
def call_function_directly(
    new_address: address,
    new_amount: uint256,
    call_anyting_address: address,
) -> Bytes[MAX_OUTSIZE]:

    success: bool = False
    response: Bytes[MAX_OUTSIZE] = EMPTY_BYTES
    success, response = raw_call(
        call_anyting_address,
        abi_encode(
            new_address,
            new_amount,
            method_id=method_id('transfer(address,uint256)'),
        ),
        max_outsize=32,
        revert_on_failure=False,
    )

    assert success
    return response

