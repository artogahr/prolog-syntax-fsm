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
