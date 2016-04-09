json.array!(@loans) do |loan|
  json.extract! loan, :id, :loanamount, :term, :intrate, :subgrade, :emplength, :homeowner, :anualincome, :verficationstatus, :loanstatus, :dti, :ficolow, :ficohigh, :numinqsixmonths, :desc
  json.url loan_url(loan, format: :json)
end
