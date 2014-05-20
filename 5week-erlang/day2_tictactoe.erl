#!/usr/local/bin/escript
-export([main/1]).
% Usage: Enter a 9 digit board as input with two space delimiters, e.g.
%     ./day2_tictactoe.erl "xox oxo oox"
% You can use any character to represent a cell that isn't filled in yet, e.g.
%     ./day2_tictactoe.erl "??? oxo oox"

% Apply a pattern P to a board B. Wherever the pattern has a wildcard ("."),
% use the corresponding element in B. Pattern and board are passed in as a
% tuple called Z. All patterns have exactly 3 wildcards, so the output of
% this function should always be of length 3. 
filter(Z) -> [ B || {P, B} <- Z, P == hd(".")].

% Apply all winning patterns to the board B.
apply(Board) -> [filter(lists:zip(P, Board)) || P <- [ 
  "?.? ?.? ?.?",
  "??. ??. ??.",
  "... ??? ???",
  "??? ... ???",
  "??? ??? ...",
  "??. ?.? .??",
  ".?? ?.? ??." ]].

% Returns true if the board contains at least one instance of a win.
won(Board) -> lists:any(fun(X) -> if X == "xxx" -> true; X == "ooo" -> true; true -> false end end, apply(Board)).

main([X]) -> io:fwrite("Board [" ++ X ++ "] has win status: "),
             io:fwrite(won(X)),
             io:fwrite("~n").
