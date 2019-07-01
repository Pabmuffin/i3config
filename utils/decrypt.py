import argparse
import gnupg
import getpass
import os

gpg = gnupg.GPG()

# Grab the password file location
parser = argparse.ArgumentParser(description='Expose encrypted passwords')
parser.add_argument('password_file', metavar='file_path', help='The path of the encrypted file')
parser.add_argument('--save', default=False, action='store_const', const=True, help='echo the plaintext into a new file')
args = parser.parse_args()
password_file = args.password_file
save = args.save

# Ask for password
password = getpass.getpass()
instream = open(password_file, "rb")
decrypted_data = gpg.decrypt_file(instream, passphrase=password)

# Display their decrypted data to stdout, or save it to a file
if(save):
    no_extension = os.path.splitext(password_file)[0]
    outstream = open(no_extension + ".plaintext", 'x')
    outstream.write(str(decrypted_data))
    outstream.close()
else:
    print(decrypted_data)
