# Prolog Syntax Thingy

This is a very simple Prolog program that checks if a tiny part of a Prolog code is correct. It's not fancy, but it does *something*. It was done for my EIEC4E Theoretical Informatics project.

## What It Does

It checks if a string is like `likes(john, mary).` or `parent(foo, bar).`

## How to Use

1.  Make sure you have SWI-Prolog installed.
2.  Save the `validator.pl` file somewhere.
3.  Open SWI-Prolog and run `?- consult('validator.pl').`
4.  To test it, run `?- test1.` or `?- test2.` or `?- test3.` or `?- test4.` or `?- test5.`
5.  To test a specific case of a token list you can run something like:
`?- validate(Tokens), write("correct"), nl.`

## What's Inside

*   It uses a thing called an FSM (Finite State Machine), which is like a set of rules.
*   It has some hardcoded `tokenize` definitions, and you can add more yourself if you want.

## Caveats

*   It's super basic.
*   It doesn't check for all Prolog rules, it only works for basic facts.
*   If it's broken, it's probably my fault.
*   There is a bug with the implementation that prevents `validate(Tokens)` from returning `true`, therefore, please use `validate(Tokens), write("correct"), nl.` instead.

## Cool, can I contribute?
Please don't.

That's it. Have fun.

