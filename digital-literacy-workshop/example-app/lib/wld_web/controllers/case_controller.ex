defmodule WldWeb.CaseController do
  use WldWeb, :controller

  alias Wld.Courts
  alias Wld.Courts.Case
  alias Wld.Lawyers

  def index(conn, _params) do
    cases = Courts.list_cases()
    render(conn, "index.html", cases: cases)
  end

  def new(conn, _params) do
    practice_areas = Courts.list_practice_areas()
    lawyers = Lawyers.list_lawyers()
    changeset = Courts.change_case(%Case{})
    render(conn, "new.html", changeset: changeset, practice_areas: practice_areas, lawyers: lawyers)
  end

  def create(conn, %{"case" => case_params}) do
    case Courts.create_case(case_params) do
      {:ok, case} ->
        conn
        |> put_flash(:info, "Case created successfully.")
        |> redirect(to: Routes.case_path(conn, :show, case))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    case = Courts.get_case!(id)
    render(conn, "show.html", case: case)
  end

  def edit(conn, %{"id" => id}) do
    case = Courts.get_case!(id)
    changeset = Courts.change_case(case)
    render(conn, "edit.html", case: case, changeset: changeset)
  end

  def update(conn, %{"id" => id, "case" => case_params}) do
    case = Courts.get_case!(id)

    case Courts.update_case(case, case_params) do
      {:ok, case} ->
        conn
        |> put_flash(:info, "Case updated successfully.")
        |> redirect(to: Routes.case_path(conn, :show, case))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", case: case, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    case = Courts.get_case!(id)
    {:ok, _case} = Courts.delete_case(case)

    conn
    |> put_flash(:info, "Case deleted successfully.")
    |> redirect(to: Routes.case_path(conn, :index))
  end
end
