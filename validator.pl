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

validate(Tokens) :-
    initial_state(Start),
    validate_helper(Start, Tokens, end).

validate_helper(CurrentState, [], FinalState) :-
    final_state(CurrentState) -> (final_state(FinalState) -> true ; fail);
     format('Invalid Prolog syntax: Unexpected end of input at state ~w', [CurrentState]), nl, fail.

validate_helper(CurrentState, [Token|Rest], FinalState) :-
    transition(CurrentState, Token, NextState),
    validate_helper(NextState, Rest, FinalState).
