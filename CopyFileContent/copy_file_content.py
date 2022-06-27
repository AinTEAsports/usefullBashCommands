import os
import sys
import argparse
import pyperclip

import termcolor


parser = argparse.ArgumentParser(description="A CLI tool to copy file content with various options")

parser.add_argument(
    "-f",
    "--filename",
    metavar="filename",
    type=str,
    required=True,
    help="the filename you want to copy its content"
)

parser.add_argument(
    "--lowercase",
    action="store_true",
    help="option that copies the content of file in lowercase"
)

parser.add_argument(
    "--uppercase",
    action="store_true",
    help="option that copies the contnt of file in uppercase"
)

parser.add_argument(
    "--encoding",
    metavar="encoding",
    type=str,
    nargs='?',
    default="utf-8",
    help="option to specify encoding in which you want to read file"
)

args = parser.parse_args()


if args.lowercase and args.uppercase:
    error_text = termcolor.colored(f"[!] {sys.argv[0]}: bad usage of flags (you gave '--lowercase' and '--uppercase' at the same time)", "red")
    print(error_text)
    sys.exit(1)


if not os.path.exists(args.filename):
    error_text = termcolor.colored(f"[!] {sys.argv[0]}: file not found or does not exists", "red")
    print(error_text)
    sys.exit(2)


with open(args.filename, 'r', encoding=args.encoding) as f:
    if args.lowercase:
        to_copy = f.read().lower()
    elif args.uppercase:
        to_copy = f.read().upper()
    else:
        to_copy = f.read()

    pyperclip.copy(to_copy)

