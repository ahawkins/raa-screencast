require 'sinatra'

class WebService < Sinatra::Base
  post '/invoices' do
    form = SendInvoiceForm.new
    form.to = params['invoice']['to']
    form.description = params['invoice']['description']
    form.amount = params['invoice']['amount']
    form.from = params['invoice']['from']

    use_case = SendInvoice.new form

    use_case.run!

    status 200
  end
end
