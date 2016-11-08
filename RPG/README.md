# Introduction
Random Password Generator.

To read the help or manual, please type:

```perl
./rpg.pl
./rpg.pl -h
./rpg.pl -m
```

# Features

* It allows you to specify the character set:
  * by using character classes:
    * uppercase ASCII letters `A-Z`
    * lowercase ASCII letters `a-z`
    * digits `0-9`
    * punctuation ```~!@#$%^&*()-_=+{}[]|\;:'",.<>/?``  
  * by adding custom characters
  * by blacklisting custom characters
  * by excluding some non-human-readable characters`O0l1`


- It allows you to specify any desired length of the password, including specify the minimum and maximum length.
- It allows you to get more than one password at once.
- It allows you to get the exact same password by using random seed.

# Reference

* [PasswordGenerator](https://github.com/ByteCommander/PasswordGenerator)
* Linux command: apg
* [Data::Pwgen](https://metacpan.org/pod/Data::Pwgen)
* [CPAN modules for generating passwords](http://neilb.org/reviews/passwords.html)