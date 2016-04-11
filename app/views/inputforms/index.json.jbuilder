json.array!(@inputforms) do |inputform|
  json.extract! inputform, :id, :loan_amnt, :installment, :grade, :emp_length, :annual_inc, :dti, :fico_range_low, :fico_range_high, :number_inq_last_6months
  json.url inputform_url(inputform, format: :json)
end
