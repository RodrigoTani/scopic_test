When('create a user {string}, {string}') do |name, job|
    @reqres_models = ReqresApiModels.new
    @reqres_models.create_user(name, job)
end

Then('I validate the api response {string}') do |expect|
    @reqres_models.validate(expect)
end

When('read a user {string}') do |user_id|
    @reqres_models = ReqresApiModels.new
    @reqres_models.read_user(user_id)
end

When('delete a user {string}') do |user_id|
    @reqres_models = ReqresApiModels.new
    @reqres_models.delete_user(user_id)
end

When('I validate the list users api') do
    @reqres_models = ReqresApiModels.new
    @reqres_models.list_users
end