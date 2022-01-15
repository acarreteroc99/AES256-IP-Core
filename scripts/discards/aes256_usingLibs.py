
from Crypto.Cipher import AES

key =  'ThisIsTheEncKey!ThisIsTheEncKey!'                                           # key in hex is 546869734973546865456e634b657921 546869734973546865456e634b657921
cipher = AES.new(key, AES.MODE_ECB)

encData = cipher.encrypt('HelloWorldHello!')                                        # data in hex is 48656c6c6f576f726c6448656c6c6f21
print("Plaintext(hex): ", ('HelloWorldHello!'.encode('utf-8')).hex())
print("Key: ", (key.encode('utf-8')).hex())
print("Encryption result: ", encData.hex())                  

decipher = AES.new(key, AES.MODE_ECB)
print("Decryption result: ", decipher.decrypt(encData))        

"""
# AES 256 encryption/decryption using pycrypto library
 
import base64
import hashlib
from Crypto.Cipher import AES
from Crypto import Random
 
BLOCK_SIZE = 16
pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * chr(BLOCK_SIZE - len(s) % BLOCK_SIZE)
unpad = lambda s: s[:-ord(s[len(s) - 1:])]
 
password = input("Enter encryption password: ")
 
 
def encrypt(raw, password):
    private_key = hashlib.sha256(password.encode("utf-8")).digest()
    raw = pad(raw)
    iv = Random.new().read(AES.block_size)
    cipher = AES.new(private_key, AES.MODE_CBC, iv)
    return base64.b64encode(iv + cipher.encrypt(raw))
 
 
def decrypt(enc, password):
    private_key = hashlib.sha256(password.encode("utf-8")).digest()
    enc = base64.b64decode(enc)
    iv = enc[:16]
    cipher = AES.new(private_key, AES.MODE_CBC, iv)
    return unpad(cipher.decrypt(enc[16:]))
 
 
# First let us encrypt secret message
encrypted = encrypt("This is a secret message", password)
print(encrypted)
 
# Let us decrypt using our original password
decrypted = decrypt(encrypted, password)
print(bytes.decode(decrypted))

"""