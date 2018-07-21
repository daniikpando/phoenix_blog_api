defmodule BlogRealWeb.Router do
  use BlogRealWeb, :router

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BlogRealWeb.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/articles", ArticleController do
        resources "/comments", CommentController
      end
    end
  end

end
