defmodule BlogReal.Models.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :content, :string
    field :description, :string
    field :metadata, :map
    field :title, :string
    field :views, :integer

    has_many(:comments, BlogReal.Models.Comment)
    
    timestamps()
  end

  @attrs [:title, :content, :description, :metadata, :views]
  def changeset(article, attrs) do
    fields_for_validation = [:title, :content, :description]
    article
    |> cast(attrs, @attrs)
    |> validate_required(fields_for_validation)
    |> validate_length(:title, min: 10)
    |> validate_length(:title, max: 50)
    |> validate_length(:content, min: 10)
    |> validate_length(:description, min: 10)
  end

end
