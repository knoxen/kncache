%%==================================================================================================
%%==================================================================================================
-module(kncache_sup).

-behaviour(supervisor).

%% API
-export([start_link/0
        ,start_link/1]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%==================================================================================================
%%
%% API functions
%%
%%==================================================================================================
%%--------------------------------------------------------------------------------------------------
%%--------------------------------------------------------------------------------------------------
start_link() ->
  start_link([]).

%%--------------------------------------------------------------------------------------------------
%%--------------------------------------------------------------------------------------------------
start_link(Caches) ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, Caches).

%%--------------------------------------------------------------------------------------------------
%%--------------------------------------------------------------------------------------------------
init(Caches) when is_list(Caches) ->
  Children = 
    [
     {kncache_srv, {kncache_srv, start_link, [Caches]}, permanent, 2000, worker, [kncache_srv]}
    ],

  RestartStrategy = {one_for_one, 10, 10},

  {ok, {RestartStrategy, Children}}.

