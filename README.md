# pez-terraform

## Description

This is the terraform that's responsible for anything "Cloud" or "Edge" in my personal homelab.

Secrets that's used for backend configuration and various auth keys are kept in the `./secrets` directory.

These secret files are encrypted using openssl and the makefile in the repo has functionality to "lock" and "unlock" the encrypted files.

## Modules used

* Cloudflare
* AzureAD

## Contributing

This is my own junk. Please, do not attempt to contribute.

Contributing will be seen as an act of aggression.