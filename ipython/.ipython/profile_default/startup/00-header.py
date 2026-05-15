from math import *
from pwn import *

def bases(n, group=4):
    bit_len = max(n.bit_length(), 1)
    padded = (bit_len + group - 1) // group * group
    b = f"{n:b}".zfill(padded)
    nibbles = ' '.join(b[i:i+group] for i in range(0, len(b), group))
    
    byte_len = (bit_len + 7) // 8
    h = f"{n:0{byte_len*2}x}"
    hex_grouped = ' '.join(h[i:i+2] for i in range(0, len(h), 2))
    
    print(f"  dec │ {n}")
    print(f"  hex │ {hex_grouped}")
    print(f"  bin │ {nibbles}")
