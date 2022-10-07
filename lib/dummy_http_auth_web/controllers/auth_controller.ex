defmodule DummyHttpAuthWeb.AuthController do
  use DummyHttpAuthWeb, :controller

  require Logger

  def authn(conn, params) do
    Logger.info("authn >>>>>>>>> #{inspect(params)}")
    # IO.inspect(binding(), label: "authn >>>>>>>>")
    wait_delay(:authn)
    json(conn, %{ok: true})
  end

  def authz(conn, params) do
    Logger.info("authz >>>>>>>>> #{inspect(params)}")
    # IO.inspect(binding(), label: "authz >>>>>>>>")
    wait_delay(:authz)
    json(conn, %{ok: true})
  end

  def delay(type) do
    case type do
      :authn ->
        Application.get_env(DummyHttpAuthWeb, :delay_authn, 0)

      :authz ->
        Application.get_env(DummyHttpAuthWeb, :delay_authz, 0)
    end
  end

  def wait_delay(type) do
    delay = delay(type)
    Logger.info("sleeping for #{delay} ms...")
    Process.sleep(delay)
  end
end
