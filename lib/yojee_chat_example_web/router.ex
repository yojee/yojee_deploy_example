defmodule YojeeChatExampleWeb.Router do
  use YojeeChatExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", YojeeChatExampleWeb do
    pipe_through :browser # Use the default browser stack


		resources "/users", UserController

		get "/", PageController, :index
  end

end
