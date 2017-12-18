%%==================================================================================================
%%==================================================================================================
-module(kncache_app).

-behaviour(application).

-author("paul@knoxen.io").

%% Application callbacks
-export([start/2
        ,stop/1]).

%%==================================================================================================
%%  API
%%==================================================================================================
%%--------------------------------------------------------------------------------------------------
%%--------------------------------------------------------------------------------------------------
start(_StartType, Caches) ->
  erlang:register(?MODULE, self()),
  kncache_sup:start_link(Caches).

%%--------------------------------------------------------------------------------------------------
%%--------------------------------------------------------------------------------------------------
stop(_State) ->
  ok.

