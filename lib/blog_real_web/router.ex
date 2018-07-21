defmodule BlogRealWeb.Router do
  use BlogRealWeb, :router

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

  # scope "/", BlogRealWeb do
  #   pipe_through :browser # Use the default browser stack
  #
  #   get "/", PageController, :index
  # end
  #

  scope "/", BlogRealWeb do
    pipe_through :browser

    # resources "/articles" do
    #   resources "/comments", except: [:show, :index]
    # end

  end


  # Other scopes may use custom stacks.
  # scope "/api", BlogRealWeb do
  #   pipe_through :api
  # end
end
