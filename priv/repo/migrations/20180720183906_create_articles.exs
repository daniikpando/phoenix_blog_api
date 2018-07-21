defmodule BlogReal.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string, null: false, size: 100
      add :content, :text, null: false
      add :description, :string, null: false, size: 200
      add :views, :integer, null: false, default: 0
      add :metadata, :map

      timestamps()
    end

  end
end
