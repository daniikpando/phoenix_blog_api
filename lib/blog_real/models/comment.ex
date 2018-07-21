defmodule BlogReal.Models.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :content, :string

    belongs_to(:article, BlogReal.Models.Article)
    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
    |> validate_length(:content, min: 2)
    |> validate_length(:content, max: 200)
    |> assoc_constraint(:article)
  end
end
