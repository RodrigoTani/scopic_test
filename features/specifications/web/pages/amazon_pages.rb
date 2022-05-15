class AmazonPage
    
    def method_name
        click_on("Your Account")

        if has_css?("form[name='signIn']", wait: 10)
            find("#ap_email").set("your.email@scoopic.com")
            find("#continue").click
        end
    end

    def registration(ap_password)
        ap_password = "Mypassword#"

        find("#auth-create-account-link").click
        
        find("#ap_customer_name").set("Rodrigo Tani")
        find("#ap_email").set("rodrigo.tani@scopic.com")
        find("#ap_password").set(ap_password)
        find("#ap_password_check").set(ap_password)
        
        find("#continue").click
    end
end