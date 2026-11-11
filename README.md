# msr90

Read a magnetic stripe card with an **MSR90 USB reader** and see what is on it: card number,
card holder and expiry date, straight in your terminal.

The MSR90 behaves like a keyboard: when you swipe a card it "types" the raw stripe data. This
script reads that line, checks that it is Track 1 (format B) and prints the fields.

```console
$ ./bash/msr90.sh
CardReader MSR90
Please Swipe Your Card (Enter to Exit):

Card Number:     4111111111111111
Card Holder:     JOHN DOE
Expiration Date: 12/25
----------------------------
Please Swipe Your Card (Enter to Exit):
```

<sub>The example uses a well-known test card number, not a real card.</sub>

- **No dependencies.** Plain POSIX shell, plus PowerShell and fish versions.
- **Nothing is saved or sent.** The data is only printed to your terminal.
- **Use it on your own cards** or cards you have permission to read.

## Usage

Plug in the reader, run the script for your shell, then swipe.

| Shell | Command |
| --- | --- |
| bash / sh / zsh / dash | `./bash/msr90.sh` (run `chmod +x bash/msr90.sh` once) |
| fish | `./fish/msr90.fish` |
| PowerShell | `.\powershell\msr90.ps1` |

Press Enter on an empty line to exit.

## Compatibility

| Shell / Platform         | Compatible? | Notes                                       |
| ------------------------ | ----------- | ------------------------------------------- |
| **bash** (Linux/macOS)   | ✅ Yes      | Native support                              |
| **sh (POSIX shell)**     | ✅ Yes      | Fully compliant                             |
| **dash (Debian/Ubuntu)** | ✅ Yes      | Default `/bin/sh`                           |
| **zsh**                  | ✅ Yes      | When invoked as `sh` or with `#!/bin/sh`    |
| **fish**                 | ✅ Yes      | Needs a complete rewrite (different syntax) |
| **Windows (WSL)**        | ✅ Yes      | Works in WSL                                |
| **Git Bash / MSYS2**     | ✅ Yes      | Works if `sh` or `bash` available           |
| **PowerShell / CMD**     | ✅ Yes      | Must run from Bash-like environment         |
