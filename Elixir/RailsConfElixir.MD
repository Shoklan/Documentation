This is from the talk found [here](https://youtu.be/5kYmOyJjGDM).

## Getting Started
- Basics; skipping documenting.
- Everything is an expression.
- Parenthesis are optional.
- Documentation is in markdown.
- Elixir coexists with Erlang and you can call those functions.
- Preface the expression with `:`

## Basic
- Atoms are not garbage collected; don't build tons of them.
- Tuples are stored concurrently in memory for fast access.
- Lists are just linked lists.
- `[1,2, third | rest ] = [1,2,3,4,5]` is valid.
- `hd` will give you the head of a list.
- `tl` will give you the tail of a list.
- `Enum.at` is what allows us to iterate over a list.
- `h` is the bultin helper function.
- **Keyword Lists** are syntatical sugar within the lists.
- `[{:atom, "Atom"}] == [atom: "Atom"]` is true; aka stored internally as a list of 2 value tuples.
- `if true, [do: "it's true"]` prints "it's true".
- `Keywords.keys( list )` will give you the keys for a pairing.
- Functions are first class.
- When you call `5 + 2` it's actually calling `Kernel.+(5,2)`.
- All functions in elixir are defined by their name and their arity.
- You define a module using `defmodule`.


## Control Flow
- There is no ifelse, elif.
- Instead, you'd use `cond`.
- This evaluates your expression for true before running.
- Most control flow will use `case`.
- `_` can be used as a default catch to throw errors.
- `_first` will be named and discarded still; documentation purposes.
-
