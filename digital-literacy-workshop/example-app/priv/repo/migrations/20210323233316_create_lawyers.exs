defmodule Wld.Repo.Migrations.CreateLawyers do
  use Ecto.Migration

  def change do
    create table(:lawyers) do
      add :first_name, :string
      add :last_name, :string
      add :birthday, :date

      timestamps()
    end

  end
end
