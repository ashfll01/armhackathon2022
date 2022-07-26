#!/bin/bash

# Generate private key and public key (currently specified method and variables, must be changed for different test vectors):
openssl ecparam -name prime256v1 -genkey -noout -out skR.pem
openssl ec -in skR.pem -pubout -out pkR.pem

#Rewrite the .pem formats to a raw key format (whatever that means...):
key_writer mode=public filename=pkR.pem output_mode=public output_file=pkR.bin output_format=bin
key_writer mode=private filename=skR.pem output_mode=private output_file=skR.bin output_format=bin

file = $1 #plant textfile input

hpke_app doing_enc=1 pkR_filename=pkR.bin input_filename=$file pkE_filename=pkE.bin output_filename=ciphertext mode=base suite=0x10,1,1


