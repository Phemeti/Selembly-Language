<img width='80px' src='https://raw.githubusercontent.com/Phemeti/Selembly-Language/refs/heads/main/SLM.png'></img>

# Selembly Language Documentation
Welcome to Selembly, I, Squrri, will walk you through the steps of using... whatever this is.

---

## How To Write Code?
Open the main script in any text editor, or IDE, you can write code in the "main" variable, where everything will take place.

---

## How To ***Learn.***
Selembly is very simple and kind of similar to another "programming language", which is **"Brainfuck"**, by Urban Müller. Brainfuck, if you have never heard of it, is a language that is meant to be **as mind frustratingly difficult to use.**

Anyways, I'm not gonna explain Brainfuck, that's for another conversation we'll have later. I'll explain the functions now.

---

## The Functions

Selembly operates on a **memory array**, a fixed list of numbered slots, each holding a value. You navigate between slots and manipulate their values using short commands. There are also **named tables** for more structured data storage.

---

### Data Slot Commands

#### `cd <n>`
**Create Data** — Sets the total number of memory slots to `n`. All new slots are initialized to `1`.
```
cd 5
```
> Creates 5 memory slots. The selector stays where it is.

---

#### `ml`
**Move Left** — Moves the selector one slot to the left. Wraps around to the last slot if you go past slot 1.
```
ml
```

---

#### `mr`
**Move Right** — Moves the selector one slot to the right. Wraps around to slot 1 if you go past the last slot.
```
mr
```

---

#### `sd <value>`
**Set Data** — Sets the currently selected slot to a value. There are three ways to use it:

- **Plain number:** Sets the slot to that number directly.
```
sd 7
```

- **String:** Sets the slot to a string value.
```
sd "hello"
```

- **Reference:** Sets the slot to the value of another slot, using `[index]` syntax.
```
sd [3]
```
> Copies the value from slot 3 into the current slot.

- **Increment/Decrement:** Use `>` to add 1 and `<` to subtract 1. You can chain them.
```
sd >>>
```
> Adds 4 to the current slot's value.
```
sd <<>
```
> Subtracts 1 from the current slot's value (net: -1).

---

#### `prD`
**Print Data** — Prints the value of the currently selected slot.
```
prD
```

---

#### `prS`
**Print Selection** — Prints the **index** of the currently selected slot (not its value).
```
prS
```

---

#### `rs`
**Reset Selection** — Moves the selector back to slot 1.
```
rs
```

---

#### `cld`
**Clear Data** — Resets **all** slot values back to `1`.
```
cld
```

---

### Table Commands

Tables let you store named key-value pairs, separate from the main memory slots.

---

#### `ndt <tableName>`
**New Data Table** — Creates a new empty table with the given name.
```
ndt scores
```

---

#### `cdk <tableName> <key>`
**Create Data Key** — Creates a key inside a table and sets it to `1`.
```
cdk scores player1
```

---

#### `sdk <tableName> <key> <value>`
**Set Data Key** — Sets the value of a key inside a table. Supports numbers, strings, and slot references `[index]`.
```
sdk scores player1 42
sdk scores player2 [1]
```

---

#### `prDK <tableName> <key>`
**Print Data Key** — Prints the value stored at a key in a table.
```
prDK scores player1
```
> Output: `42`

---

## Quick Reference

| Function | Functionality |
|---|---|
| `cd <n>` | Set number of memory slots |
| `ml` | Move selector left (wraps) |
| `mr` | Move selector right (wraps) |
| `sd <value>` | Set current slot (`>>>`, `[ref]`, number, or string) |
| `prD` | Print current slot's value |
| `prS` | Print current slot's index |
| `rs` | Reset selector to slot 1 |
| `cld` | Clear all slots to 1 |
| `ndt <tbl>` | Create a new table |
| `cdk <tbl> <key>` | Create a key in a table (defaults to 1) |
| `sdk <tbl> <key> <val>` | Set a key's value in a table |
| `prDK <tbl> <key>` | Print a key's value from a table |

---

Anyways, there you go! That is the full documentation on how to use **Selembly.**
