defmodule Wld.Repo.Migrations.CreateCases do
  use Ecto.Migration

  def change do
    create table(:cases) do
      add :details, :string
      add :practice_area_id, references(:practice_areas, on_delete: :nothing)
      add :lawyer_id, references(:lawyers, on_delete: :nothing)

      timestamps()
    end

    create index(:cases, [:practice_area_id])
    create index(:cases, [:lawyer_id])
  end
end
