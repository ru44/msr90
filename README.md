# msr90 Card Reader

```bash
chmod +x msr90
```
if you want to run it directly.

## Usage

### Bash / sh / zsh

```bash
./msr90
```

### PowerShell

```ps1
.\msr90.ps1
```

### fish

```fish
./msr90.fish
```

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
