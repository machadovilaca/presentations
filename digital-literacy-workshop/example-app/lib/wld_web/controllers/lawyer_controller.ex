defmodule WldWeb.LawyerController do
  use WldWeb, :controller

  alias Wld.Lawyers
  alias Wld.Lawyers.Lawyer
  alias Wld.Courts

  def index(conn, _params) do
    lawyers = Lawyers.list_lawyers()
    render(conn, "index.html", lawyers: lawyers)
  end

  def new(conn, _params) do
    changeset = Lawyers.change_lawyer(%Lawyer{practice_areas: []})
    practice_areas = Courts.list_practice_areas()
    render(conn, "new.html", changeset: changeset, practice_areas: practice_areas)
  end

  def create(conn, %{"lawyer" => lawyer_params}) do
    case Lawyers.create_lawyer(lawyer_params) do
      {:ok, lawyer} ->
        conn
        |> put_flash(:info, "Lawyer created successfully.")
        |> redirect(to: Routes.lawyer_path(conn, :show, lawyer))

      {:error, %Ecto.Changeset{} = changeset} ->
        practice_areas = Courts.list_practice_areas()
        render(conn, "new.html", changeset: changeset, practice_areas: practice_areas)
    end
  end

  def show(conn, %{"id" => id}) do
    lawyer = Lawyers.get_lawyer!(id)
    render(conn, "show.html", lawyer: lawyer)
  end

  def edit(conn, %{"id" => id}) do
    lawyer = Lawyers.get_lawyer!(id)
    changeset = Lawyers.change_lawyer(lawyer)
    practice_areas = Courts.list_practice_areas()
    render(conn, "edit.html", lawyer: lawyer, changeset: changeset, practice_areas: practice_areas)
  end

  def update(conn, %{"id" => id, "lawyer" => lawyer_params}) do
    lawyer = Lawyers.get_lawyer!(id)

    case Lawyers.update_lawyer(lawyer, lawyer_params) do
      {:ok, lawyer} ->
        conn
        |> put_flash(:info, "Lawyer updated successfully.")
        |> redirect(to: Routes.lawyer_path(conn, :show, lawyer))

      {:error, %Ecto.Changeset{} = changeset} ->
        practice_areas = Courts.list_practice_areas()
        render(conn, "edit.html", lawyer: lawyer, changeset: changeset, practice_areas: practice_areas)
    end
  end

  def delete(conn, %{"id" => id}) do
    lawyer = Lawyers.get_lawyer!(id)
    {:ok, _lawyer} = Lawyers.delete_lawyer(lawyer)

    conn
    |> put_flash(:info, "Lawyer deleted successfully.")
    |> redirect(to: Routes.lawyer_path(conn, :index))
  end
end
