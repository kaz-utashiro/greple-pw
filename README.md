[![Actions Status](https://github.com/kaz-utashiro/greple-pw/workflows/test/badge.svg)](https://github.com/kaz-utashiro/greple-pw/actions) [![MetaCPAN Release](https://badge.fury.io/pl/App-Greple-pw.svg)](https://metacpan.org/release/App-Greple-pw)
# NAME

pw - Module to get password from file

# SYNOPSIS

greple -Mpw pattern file

# VERSION

Version 1.00

# DESCRIPTION

This module searches for ID and password information written in text
files, and displays them interactively.  Passwords are not shown on
display by default, but you can copy them into clipboard by specifying
item mark.

PGP encrypted file can be handled by **greple** standard feature.
Command "**gpg**" is invoked for files with "_.gpg_" suffix by
default.  Option **--pgp** is also available, then you can type
passphrase only once for searching from multiple files.  Consult
**--if** option if you are using other encryption style.

Terminal scroll buffer and screen is cleared when command exits, and
content of clipboard is replaced by prepared string, so that important
information does not remain on the terminal.

Id and password is collected from text using some keywords like
"user", "account", "password", "pin" and so on.  To see actual data,
use **pw\_status** function described below.

Some banks use random number matrices as a countermeasure for tapping.
If the module successfully guesses the matrix area, it blacks out the
table and remembers them.

      | A B C D E F G H I J
    --+--------------------
    0 | Y W 0 B 8 P 4 C Z H
    1 | M 0 6 I K U C 8 6 Z
    2 | 7 N R E Y 1 9 3 G 5
    3 | 7 F A X 9 B D Y O A
    4 | S D 2 2 Q V J 5 4 T

Enter the field positions to get the cell items like:

    > E3 I0 C4

and you will get the answer:

    9 Z 2

Case is ignored and white space is not necessary, so you can type like
this as well:

    > e3i0c4

# INTERFACE

- **pw\_print**

    Data print function.  This function is set for the **--print** option of
    **greple** by default, and users don't have to care about it.

- **pw\_epilogue**

    Epilogue function.  This function is set for the **--end** option of
    **greple** by default, and users don't have to care about it.

- **config**

    Module parameters can be configured using the **config** interface from
    [Getopt::EX::Config](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AConfig).  If you do not want to clear screen after command
    execution, you can set it like:

        greple -Mpw::config=clear_screen=0

    or:

        greple -Mpw --config clear_screen=0 --

    or as a command-line option:

        greple -Mpw --no-clear-screen --

    Currently following configuration options are available:

        clear_clipboard
        clear_string
        clear_screen
        clear_buffer
        goto_home
        browser
        timeout
        debug
        parse_matrix
        parse_id
        parse_pw
        id_keys
        id_chars
        id_color
        id_label_color
        pw_keys
        pw_chars
        pw_color
        pw_label_color
        pw_blackout

    These parameters can also be used as command-line options with underscores 
    replaced by hyphens (e.g., **--parse-matrix**, **--id-keys**).

    **id\_keys** and **pw\_keys** are lists of keywords separated by spaces.
    **pw\_blackout** controls password display: 0=show, 1=mask with 'x', >1=fixed length mask.

- **pw\_status**

    Print current configuration status. Next command displays current settings:

        greple -Mpw::pw_status= dummy /dev/null

    This shows which parameters are set to non-default values and which are using defaults.

# SEE ALSO

[App::Greple](https://metacpan.org/pod/App%3A%3AGreple), [App::Greple::pw](https://metacpan.org/pod/App%3A%3AGreple%3A%3Apw)

[https://github.com/kaz-utashiro/greple-pw](https://github.com/kaz-utashiro/greple-pw)

# AUTHOR

Kazumasa Utashiro

# LICENSE

Copyright (C) 2017-2025 Kazumasa Utashiro.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
