-module(split_string).
-export([rjm_fn/1]).

rjm_fn(Input) -> string:tokens(Input," ").



