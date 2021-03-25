defmodule WldWeb.LawyerControllerTest do
  use WldWeb.ConnCase

  alias Wld.Lawyers

  @create_attrs %{birthday: ~D[2010-04-17], first_name: "some first_name", last_name: "some last_name"}
  @update_attrs %{birthday: ~D[2011-05-18], first_name: "some updated first_name", last_name: "some updated last_name"}
  @invalid_attrs %{birthday: nil, first_name: nil, last_name: nil}

  def fixture(:lawyer) do
    {:ok, lawyer} = Lawyers.create_lawyer(@create_attrs)
    lawyer
  end

  describe "index" do
    test "lists all lawyers", %{conn: conn} do
      conn = get(conn, Routes.lawyer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Lawyers"
    end
  end

  describe "new lawyer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.lawyer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Lawyer"
    end
  end

  describe "create lawyer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.lawyer_path(conn, :create), lawyer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.lawyer_path(conn, :show, id)

      conn = get(conn, Routes.lawyer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Lawyer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.lawyer_path(conn, :create), lawyer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Lawyer"
    end
  end

  describe "edit lawyer" do
    setup [:create_lawyer]

    test "renders form for editing chosen lawyer", %{conn: conn, lawyer: lawyer} do
      conn = get(conn, Routes.lawyer_path(conn, :edit, lawyer))
      assert html_response(conn, 200) =~ "Edit Lawyer"
    end
  end

  describe "update lawyer" do
    setup [:create_lawyer]

    test "redirects when data is valid", %{conn: conn, lawyer: lawyer} do
      conn = put(conn, Routes.lawyer_path(conn, :update, lawyer), lawyer: @update_attrs)
      assert redirected_to(conn) == Routes.lawyer_path(conn, :show, lawyer)

      conn = get(conn, Routes.lawyer_path(conn, :show, lawyer))
      assert html_response(conn, 200) =~ "some updated first_name"
    end

    test "renders errors when data is invalid", %{conn: conn, lawyer: lawyer} do
      conn = put(conn, Routes.lawyer_path(conn, :update, lawyer), lawyer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Lawyer"
    end
  end

  describe "delete lawyer" do
    setup [:create_lawyer]

    test "deletes chosen lawyer", %{conn: conn, lawyer: lawyer} do
      conn = delete(conn, Routes.lawyer_path(conn, :delete, lawyer))
      assert redirected_to(conn) == Routes.lawyer_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.lawyer_path(conn, :show, lawyer))
      end
    end
  end

  defp create_lawyer(_) do
    lawyer = fixture(:lawyer)
    %{lawyer: lawyer}
  end
end
