# Prolog Syntax Thingy

This is a simple Prolog program that checks if a tiny part of a Prolog code is correct. It's not fancy, but it does *something*. It was done for my EIEC4E Theoretical Informatics project.

## What It Does

It checks if a string is like `likes(john, mary).`, `parent(foo, bar).` or `has(item).`, using a Finite State Machine (FSM) to validate the structure.

## How to Use

1.  Make sure you have SWI-Prolog installed.
2.  Save the `validator.pl` file somewhere.
3.  Open SWI-Prolog and run `?- consult('validator.pl').`
4.  To test it, run `?- test1.` or `?- test2.` or `?- test3.` or `?- test4.` or `?- test5.` or `?- test6.` or `?- test7.`
5.  To test a specific case of a token list you can run something like:
    `?- tokenize("likes(john,mary).", Tokens), validate(Tokens), write("correct"), nl.`
    or
    `?- tokenize("parent(john,mary).", Tokens), validate(Tokens), write("correct"), nl.`

## What's Inside

*   It uses a Finite State Machine (FSM) with over 10 states to model the valid syntax of Prolog facts.
*   The program uses predicates with variables for its tokenization and validation logic, and the predicates now are core to the logic of the program.
*   The FSM is implemented using `transition/3`, with an initial state of `start` and a final state of `end`.

## Caveats

*   It's still basic.
*   It only checks a limited subset of Prolog syntax.
*   The tokenizer only accepts a few predefined strings.
*   Error messages are simple, and not all types of errors may be handled explicitly.

## Cool, can I contribute?

Please don't.

That's it. Have fun.
