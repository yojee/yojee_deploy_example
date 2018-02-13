defmodule YojeeChatExampleWeb.PageController do
  use YojeeChatExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
