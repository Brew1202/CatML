# Assignment 8, CS3250


This repository contains a (template) implementation of CatML, an ML variant used at UVM for CS3250.

## Building this repository with `dune`

This repository can be built with [`dune`](https://github.com/ocaml/dune), a build system for OCaml projects. It helps manage linking when your project is made up of multiple `.ml` files.

### Install `dune`

Check if dune is already installed via the following terminal command:

```
$ dune --version
```

If the command is not found, you can install it via `opam` [(detailed instructions)](https://dune.readthedocs.io/en/latest/howto/install-dune.html).

```
$ opam install dune
$ eval $(opam config env)
$ dune --version
```

### Build the project

With `dune` installed, you can build the project by running `dune build` from the command line.

```
$ dune build
```

You can also access the project modules by running `dune utop`, which will build the project and then open the `utop` toplevel. Different files (such as `src/lang.ml`) correspond to OCaml modules, and data structures (such as the `Var` constructor in the CatML AST) can be accessed via `CatML.Lang.Bool`, where `CatML` is the overall name of the project.

### Structure of the repository

```
- <root>
  - dune-project
  - src
    - dune
    - lang.ml
    - lexer.mll
    - parser.mly
    - main.ml
  - examples
    - example.catml
    - factorial.catml
```

The `dune-project` plaintext file at the top level tells dune how to build your project. The file `src/dune` tells dune the name of the library (`CatML`) and the fact that we have a ocamllex file `lexer.mll` and a menhir parser specification file `parser.mly` in the `src` subdirectory.

```
(library (name CatML))
(menhir (modules parser))
(ocamllex lexer)
```

The files in the `src` directory include:

- `lang.ml`: The main definition of the CatML language, including syntax, evaluation, and type checking
- `lexer.mll`: The specification of the lexer used by ocamllex
- `parser.mly`: The specification of the parser used by menhir
- `main.ml`: Demonstration of how to access the lexer and parser generated from the above files

In the `examples` directory I have included two sample CatML programs. You should write your own additional CatML programs to test your work.

## Other Resources

1. Parsing and lexing generators in OCaml, [OCaml Programming, Correct + Efficient + Beautiful](https://cs3110.github.io/textbook/chapters/interp/parsing.html)
2. Parsing with OCamllex and Menhir, [Real World OCaml](https://dev.realworldocaml.org/parsing-with-ocamllex-and-menhir.html)
3. [Dune build system reference](https://github.com/ocaml/dune)

## How to interact with a CatML program

First, build the project using dune build, then start utop using dune utop.

Once utop is open you can run a CatML program by entering:


CatML.Main.run_file "examples/example.catml";;


This example should output 105.

You can also run the factorial example using:


CatML.Main.run_file "examples/factorial.catml";;


This should output 120.

The program reads the file, parses it, checks the type and evaluates it. If there is a syntax or type error it prints an error message.



# Reflection Questions

1. If you worked as a group, list all the group members.

Only me.

2. Did you use generative AI to assist you in implementing this project? If so, briefly explain how you used it and for which component.

I used ai to help get Dune set up and troubleshoot a few issues with the development tools.

3. Did you make any design decisions that we should know about?

I decided to keep the small step evaluation and substitution approach from the starter code.

4. Did you implement any of the extra credit features? Briefly summarize your work.

I did not.

5. Any feedback on the structure of this assignment?

I thought the assignment was a little challenging especially getting all the different parts working together, but it was definitely good practice for understanding how the different parts of a programming language work.