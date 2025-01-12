# Assembly Register Cheat Sheet

### General Purpose Registers

| Register | Description                          |
| -------- | ------------------------------------ |
| `rax`    | Accumulator register                 |
| `rbx`    | Base register                        |
| `rcx`    | Counter register                     |
| `rdx`    | Data register                        |
| `rsi`    | Source index                         |
| `rdi`    | Destination index                    |
| `rbp`    | Base pointer                         |
| `rsp`    | Stack pointer                        |
| `r8-r15` | Additional general-purpose registers |

### Segment Registers

| Register | Description        |
| -------- | ------------------ |
| `cs`     | Code segment       |
| `ds`     | Data segment       |
| `es`     | Extra segment      |
| `fs`     | Additional segment |
| `gs`     | Additional segment |

### Special Purpose Registers

| Register | Description              |
| -------- | ------------------------ |
| `rip`    | Instruction pointer      |
| `rflags` | Contains processor state |

### Register Usage Tips

- **Function Arguments:** In the System V AMD64 ABI, the first six integer or pointer arguments are passed in `rdi`, `rsi`, `rdx`, `rcx`, `r8`, and `r9`.
- **Return Values:** Functions generally return values in `rax`.
- **Temporary Storage:** `r10` and `r11` are often used for temporary storage and do not need to be preserved across function calls.
- **Preservation:** `rbx`, `rbp`, `r12` to `r15` should be preserved across function calls if modified.

### Mnemonic Devices

#### Function Arguments (in order)

- `rDI`: **D**estination **I**ndex
- `rSI`: **S**ource **I**ndex
- `rDX`: **D**ata e**X**change
- `rCX`: **C**ount re**X**ister
- `r8` : No mnemonic, but remember it comes after `r9`.
- `r9` : No mnemonic, but remember it comes before `r8`.

#### Return Values

- `rAX`: **A**ccumulator re**X**ister

#### Temporary Storage

- `r10`: No mnemonic, think **"10"** as in a "temporary spot."
- `r11`: Similar to `r10`.

#### Preservation

- `rBX`: **B**ase **X**tra (extra "B"ase)
- `rBP`: **B**ase **P**ointer
- `r12` to `r15`: Generally used for extended storage.
