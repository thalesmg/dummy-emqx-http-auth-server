# DummyHttpAuth

```sh
mix deps.get
iex -S mix phx.server
```

```elixir
  Application.put_env(DummyHttpAuthWeb, :delay_authn, 0)
  Application.put_env(DummyHttpAuthWeb, :delay_authz, :timer.seconds(30))

  Application.put_env(DummyHttpAuthWeb, :delay_authz, 100)
```
