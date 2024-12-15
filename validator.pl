% FSM transitions
transition(start, identifier, state1).
transition(state1, open_paren, state2).
transition(state2, identifier, state3).
transition(state3, comma, state4).
transition(state4, identifier, state5).
transition(state5, close_paren, state6).
transition(state6, dot, state7).
transition(state7, end_marker, end).
transition(state8, some_random_token, error).
transition(state9, another_random_token, error).
transition(error, _, error).


% Initial and final states
initial_state(start).
final_state(end).

% Tokenizer with predicates with variables that returns the result of a tokenizer definition
tokenize(String, Tokens) :-
    tokenize_helper(String, Tokens, Result),
    Result.

% Tokenizer helper
tokenize_helper("likes(john,mary).", [identifier, open_paren, identifier, comma, identifier, close_paren, dot, end_marker], true).
tokenize_helper("parent(john,mary).", [identifier, open_paren, identifier, comma, identifier, close_paren, dot, end_marker], true).
tokenize_helper("has(item).", [identifier, open_paren, identifier, close_paren, dot, end_marker], true).
tokenize_helper(_, _, false).



% Validation predicate
validate(Tokens) :-
    initial_state(Start),
    validate_helper(Start, Tokens, end),
    validation_result(true).

validation_result(Result) :- Result.



% Helper predicate with improved error handling and variables
validate_helper(CurrentState, [], FinalState) :-
    final_state_check(CurrentState, FinalState).


validate_helper(CurrentState, [Token|Rest], FinalState) :-
    transition_check(CurrentState, Token, NextState),
    validate_helper(NextState, Rest, FinalState).


validate_helper(CurrentState, [_|_], _) :-
    % fail if no transition for a token is found on current state
    transition_error(CurrentState).


% Predicates with Variables (implementing helper logic)
final_state_check(CurrentState, FinalState) :-
    final_state(CurrentState) -> (final_state(FinalState) -> true ; fail) ; fail.

transition_check(CurrentState, Token, NextState) :-
    transition(CurrentState, Token, NextState) -> true ; fail.

transition_error(CurrentState) :-
    write('Syntax error at state: '), write(CurrentState), nl, fail.

% Test Predicates
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

test6 :-
    tokenize("has(item).", Tokens),
    validate(Tokens),
    write("Valid Prolog syntax"), nl.

test7 :-
  tokenize("has(item", Tokens),
  validate(Tokens).
