defmodule BlogReal.Models.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :content, :string

    belongs_to(:article, BlogReal.Models.Article)
    timestamps()
  end

  @attr [:content, :article_id]
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, @attr)
    |> validate_required(@attr)
    |> validate_length(:content, min: 2)
    |> validate_length(:content, max: 200)
    |> assoc_constraint(:article)
  end
end
