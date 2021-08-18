*** Variables ***
${LOGIN_STRAPI.EMAIL.FIELD}   xPath=//input[@name="email"]
${LOGIN_STRAPI.PASSWORD.FIELD}   xPath=//input[@name='password']
${LOGIN_STRAPI.CONFIRMLOGIN.BTN}     xPath=//button[@type="submit"]
${LOGIN_STRAPI.REQUIREDEMAIL.MSG}    xPath=//p[@id="error-email"]
${LOGIN_STRAPI.REQUIREDPASSWORD.MSG}    xPath=//p[@id="error-password"]
${LOGIN_STRAPI.FAILED.MSG}      xPath=//p[@class="sc-eggNIi hcxot"]