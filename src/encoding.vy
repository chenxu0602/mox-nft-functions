# pragma version 0.4.3
# @license GPL-3.0-or-later


EMPTY_BYTES: constant(Bytes[32]) = b''


@external
@pure
def combine_strings(
    string_one: String[50], string_two: String[50]
) -> String[100]:
    return concat(string_one, string_two)


@external
@pure
def encode_number() -> Bytes[32]:
    amount: uint256 = 1
    return abi_encode(amount)


@internal
@pure
def _encode_string() -> Bytes[128]:
    my_string: String[50] = 'Hello World'
    return abi_encode(my_string)


@external
@pure
def decode_string() -> String[50]:
    decoded_string: String[50] = abi_decode(self._encode_string(), (String[50]))
    return decoded_string
    

@internal    
@pure
def _multi_encode() -> Bytes[256]:
    my_string: String[50] = 'Hi Mom'
    my_string_two: String[50] = 'Miss you'
    return abi_encode(my_string, my_string_two)


@external
@pure
def multi_decode() -> (String[50], String[50]):
    my_encoded_stirngs: Bytes[256] = self._multi_encode()
    my_string: String[50] = empty(String[50])
    my_string_two: String[50] = empty(String[50])
    my_string, my_string_two = abi_decode(
        my_encoded_stirngs, (String[50], String[50])
    )
    return my_string, my_string_two


@external
def withdraw(recent_winder: address):
    raw_call(recent_winder, EMPTY_BYTES, value=self.balance)