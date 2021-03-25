defmodule Wld.Repo.Migrations.CreatePracticeAreas do
  use Ecto.Migration

  def change do
    create table(:practice_areas) do
      add :name, :string

      timestamps()
    end

  end
end
