defmodule ExAws.Rekognition do
  @moduledoc """
  Operations on the AWS Rekognition service.

  ## Basic usage
  ```elixir
  
  alias ExAws.Rekognition

  # Detect Labels
  # You can use the DetectLabels operation to detect labels in an image.
  ExAws.Rekognition.detect_labels("image in base 64")
  |> ExAws.request

  ```
  """

  @namespace "RekognitionService"

  @type data :: binary

  @doc """
  Detect labels
  """
  @spec detect_labels(
          data :: binary
        ) :: ExAws.Operations.JSON.t()
  def detect_labels(
        data
      ) do

    data = %{"Image" => %{"Bytes" => data}}

    request(:detect_labels, data)
  end

  defp request(op, data, opts \\ %{}) do
    operation =
      op
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(
      :rekognition,
      %{
        data: data,
        headers: [
          {"x-amz-target", "#{@namespace}.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
      |> Map.merge(opts)
    )
  end

end
