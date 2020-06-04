#!/bin/bash
cp book.txt.bkup book.txt
# -e command
#         Append the editing commands specified by the command argument to the list of commands.
sed -e '1d' -e '2d' -e '5d' book.txt

# recover
cp book.txt.bkup book.txt

# -f command_file
#         Append the editing commands found in the file command_file to the list of commands.  The editing commands should each be listed on a separate line.

sed -f _002_sed_basic_syntax_command_file.txt book.txt

cp book.txt.bkup book.txt