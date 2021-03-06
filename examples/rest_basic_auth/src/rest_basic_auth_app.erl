%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(rest_basic_auth_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", toppage_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, 100, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
	rest_basic_auth_sup:start_link().

stop(_State) ->
	ok.
