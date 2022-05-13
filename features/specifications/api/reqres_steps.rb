When('create a user {string}, {string}') do |name, job|
    @reqres_models = ReqresApiModels.new
    @reqres_models.create_user(name, job)
end

Then('I validate the api response {string}') do |expect|
    
end