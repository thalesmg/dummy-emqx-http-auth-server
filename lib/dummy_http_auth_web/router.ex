defmodule DummyHttpAuthWeb.Router do
  use DummyHttpAuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DummyHttpAuthWeb do
    pipe_through :api

    post("/authn", AuthController, :authn)
    post("/authz", AuthController, :authz)
  end
end
