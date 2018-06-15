Before do
  @gen = Generator.new.form_generator_value
end


Given("I access the bbc login page") do
  bbc_homepage.visit_home_page
  bbc_homepage.click_sign_in_link
end

And("I input incorrect username details") do
  bbc_sign_in_page.fill_in_username(@gen.email_gen)
end

And("I input incorrect password details") do
  bbc_sign_in_page.fill_in_password(@gen.password_gen)
end

When("I try to login") do
  bbc_sign_in_page.sign_in_button.click
end
Then("I receive and error for not finding the account") do
  expect(bbc_sign_in_page.incorrect_password_text).to be true
end

And("I input any username details") do
  bbc_sign_in_page.fill_in_username(@gen.email_gen)
end

And("I input a incorrect password 1234abc") do
  bbc_sign_in_page.fill_in_password("1234abc")
end

Then("I receive an error stating it needs to be at least 8 chars") do
  expect(bbc_sign_in_page.incorrect_password_format).to be true
end
