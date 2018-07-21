defmodule BlogRealWeb.Api.V1.ArticleController do
  use BlogRealWeb, :controller
  alias BlogReal.Models.Article
  alias BlogReal.Repo
  alias BlogRealWeb.ErrorView
  alias Plug.Conn

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.json", articles: articles)
  end

  def show(conn, %{"id" => id }) do

    with article = %Article{} <- Repo.get(Article, id) do
      render(conn, "show.json", article: article)
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView,"404.json", error: "Not found")
    end

  end

  def create(conn, params) do
    changeset = Article.changeset(%Article{}, params)

    with {:ok, article} <- Repo.insert(changeset) do
      conn
      |> Conn.put_status(201)
      |> render("show.json", article: article)
    else
      {:error, %{errors: errors} } ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors} )
    end
  end

  def update(conn, params = %{"id" => id} ) do

    changeset = ( fn id ->
      Article
      |> Repo.get!(id)
      |> Article.changeset(params)
    end).(id)

    with {:ok, article} <- Repo.update(changeset) do
      conn
      |> Conn.put_status(201)
      |> render("show.json", article: article)
    else
      {:error, errors } ->
        conn
        |> render(ErrorView, "422.json", %{errors: errors} )
        |> put_status(422)
    end
  end

  def delete(conn, %{"id" => id}) do
    with article = %Article{} <- Repo.get(Article, id) do
      Repo.delete!(article)
      conn
      |> Conn.put_status(204)
      |> Conn.send_resp(:no_content, "")
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json")
    end
  end
end
