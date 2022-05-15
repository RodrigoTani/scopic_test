class AmazonPage
    include Capybara::DSL
    include RSpec::Matchers
    include Helpers
    
    def log_in(email, ap_password)
        if has_css?("div[class='nav-signin-tt nav-flyout']")
            find("span[class='nav-action-inner']", wait: 5).click #Sign in
        end

        if has_css?("form[name='signIn']", wait: 10)
            find("#ap_email", wait: 5).set(email)
            find_all("#continue", wait: 5).first.click
        end

        if has_css?("#auth-error-message-box", wait: 3)
            raise find("#auth-error-message-box").text + "\n"
        end

        find("#ap_password", wait: 5).set(ap_password)
        find_all("#signInSubmit", wait: 5).first.click

        if has_css?("div[class='a-box-inner a-alert-container']")
            raise find("div[class='a-box-inner a-alert-container']").text
        end
    end

    def registration(email, ap_password)
        if has_css?("div[class='nav-signin-tt nav-flyout']")
            find("a[class='nav-a']").click #Start
        else
            raise "The login modal is disable"
        end

        has_css?("form[name='register']", wait: 10)
        
        find("#ap_customer_name", wait: 5).set("Rodrigo Tani")
        find("#ap_email", wait: 5).set(email)
        find("#ap_password", wait: 5).set(ap_password)
        find("#ap_password_check", wait: 5).set(ap_password)
        
        find("#continue", wait: 5).click

        if find("span[class='a-size-large']").text == "Solve this puzzle to protect your account"
            raise "Captcha protect! The Automation can't continue the execution"
        end

        #Enter iframes to click solve puzze
            switch_to_frame(find("iframe[id='cvf-arkose-frame']", wait: 5))
            switch_to_frame(find("iframe[title='Verification challenge']", wait: 5))
            switch_to_frame(find("iframe[id='fc-iframe-wrap']", wait: 5))

            if has_css?("iframe[id='CaptchaFrame']", wait: 5)
                raise "Captcha protect! The Automation can't continue the execution"
            end

            switch_to_frame(find("iframe[id='CaptchaFrame']", wait: 5))

            find("button[id='home_children_button']").click #solve puzze
        #solve puzzle


        #get out iframe
            page.driver.browser.switch_to.default_content
            if has_text?("Verify email address", wait: 5)
                find("#cvf-input-code", wait: 5).set(otp_code)
            end
    end
end