-module(jorel_hello_provider).

-behaviour(jorel_provider).

-export([init/1, do/1]).
-define(PROVIDER, hello).

init(State) ->
  jorel_config:add_provider(
    State,
    {?PROVIDER,
     #{
       module => ?MODULE,
       depends => [],
       desc => "Display a simple hello message"
      }
    }
   ).

do(State) ->
  Name = jorel_log:ask("Wht's your name", [], "?"),
  jorel_log:info("Hello ~s!", [Name]),
  State.


