% fibonacci: http://en.literateprograms.org/Fibonacci_numbers_(Prolog)
% factorial: http://stackoverflow.com/questions/9576494/prolog-factorial-recursion


% reverse elements in a list
tsil([], []).
tsil([Head|[]], Head).
tsil([Head|Tail], Result) :- tsil(Tail, Liat), append(Liat, [Head], Result).
% tsil([1, 2, 3, 5], What).

% find smallest element in a list
smallest([Head|[]], Head).
smallest([Head|Tail], Result) :- smallest(Tail, T), Head > T, Result = T.
smallest([Head|Tail], Result) :- smallest(Tail, T), Head =< T, Result = Head.
% smallest([3, 4, 1, 2], What).

% sort elements in a list
% http://kti.ms.mff.cuni.cz/~bartak/prolog/sorting.html

