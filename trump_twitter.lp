
#include 'keyword.lp'.

_print_sentiment(Value) :-
	Value > 0,
	write('Team').
_print_sentiment(Value) :-
	Value < 0,
	write('Trump').
_print_sentiment(Value) :-
	Value = 0,
	write('neutral').
	
_value_of(positive, 1).
_value_of(negative, -1).
_value_of(_, 0).

_prevTokValue([],CurrentValue, CurrentValue).
_prevTokValue([_, nothing], CurrentValue, CurrentValue).
_prevTokValue([_, inv], CurrentValue, OutputValue) :-
	OutputValue is CurrentValue * -1.
_prevTokValue([_, inc], CurrentValue, OutputValue) :-
	OutputValue is CurrentValue * 2.
_prevTokValue([_, dec], CurrentValue, OutputValue) :-
	OutputValue is CurrentValue / 2.


_sentence_score([], _, _).
_sentence_score([_, Tag], PrevToken, CurScore) :-
	_value_of(Tag, ValueTag),	
	_prevTokValue(PrevToken, ValueTag, CurScore).	
_sentence_score([[Word, Tag]|Tail], PrevToken, TotalScore) :- 
	_value_of(Tag, ValueTag),	
	_prevTokValue(PrevToken, ValueTag, CurScore),
	CurToken = [Word, Tag],
	_sentence_score(Tail, CurToken, TotalofRest),
	TotalScore is CurScore + TotalofRest.

_tag_sentence([Word |Reststring], Reststring, [Word, Category]) :-
	_keyword(Word,Category).
_tag_sentence([Word |Reststring], Reststring, [Word, nothing]) :-
	not _keyword(Word,_).
_tag_sentence([],String, String).
_tag_sentence(String, Reststring, [Subtree|Subtrees]) :-
	_tag_sentence(String, String1, Subtree),
	_tag_sentence(String1, Reststring, Subtrees).

sentiment(String) :-
        _tag_sentence(String, [], TaggedResult),
		_sentence_score(TaggedResult, [], Value),
		%totalScore(Value),
		write('The tweet is from: '), _print_sentiment(Value), nl.

?- sentiment([obamaCare,iss,a,total,disaster]).