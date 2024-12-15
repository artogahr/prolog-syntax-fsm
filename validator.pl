% FSM transitions
transition(start, identifier, identifier1).
transition(identifier1, open_paren, paren1).
transition(paren1, identifier, arg1).
transition(arg1, comma, arg2).
transition(arg2, identifier, arg3).
transition(arg3, close_paren, paren2).
transition(paren2, dot, end).
transition(end, end, end). % Accepting state

% Error state (if no valid transition is found)
transition(error, _, error).

% Initial and final states
initial_state(start).
final_state(end).

% Simplified Tokenizers (Needs significant improvement for real-world use)
tokenize("likes(john,mary).", [identifier, open_paren, identifier, comma, identifier, close_paren, dot]).
tokenize("parent(john,mary).", [identifier, open_paren, identifier, comma, identifier, close_paren, dot]).

% Validation predicate
validate(Tokens) :-
    initial_state(Start),
    validate_helper(Start, Tokens, end) -> true ; fail.

% Helper predicate with improved error handling
validate_helper(CurrentState, [], FinalState) :-
    final_state(CurrentState) -> (final_state(FinalState) -> true ; fail) ; fail.


validate_helper(CurrentState, [Token|Rest], FinalState) :-
    transition(CurrentState, Token, NextState),
    validate_helper(NextState, Rest, FinalState).


% test predicates
test1 :-
    tokenize("likes(john,mary).", Tokens),
    validate(Tokens),
    write('Valid Prolog syntax'), nl.

test2 :-
    tokenize("likes(john,mary", Tokens),
    validate(Tokens).

test3 :-
    tokenize("likes(john,mary)", Tokens),
    validate(Tokens).

test4 :-
    tokenize("likes(john,mary.)", Tokens),
    validate(Tokens).

test5 :-
    tokenize("parent(john,mary).", Tokens),
    validate(Tokens),
    write("Valid Prolog syntax"), nl.
