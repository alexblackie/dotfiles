" Fix vim-elixir's default garbage.
"
" If this is not set, vim-elixir will call out to `mix format` (a feature only
" available if you have Elixir installed locally, and are running the most
" latest release at time of writing) when you hit `gq`, instead of keeping the
" default vim behaviour. So much for the principle of least surprise; I'd say
" calling out to a CLI function that may or may not exist is pretty fucking
" surprising.
"
" So we have to force it to not violate my editor by setting the formatprg to
" empty, which it checks for before injecting its own.
setlocal formatprg=
