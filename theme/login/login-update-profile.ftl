<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','email','firstName','lastName'); section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
    <#elseif section = "form">
        <div>
           <!-- <img class="logo" src="${url.resourcesPath}/img/nu-logo.png" alt="NetUnion"> -->
        </div>
        <div class="box-container">
            <div>
                <p class="application-name">NU Identity Service</p>
                <p class="client-name">
                ${msg("loginProfileTitle")}
                </p>
            </div>
            <div>
               <form id="kc-update-profile-form" class="form-oauth" onsubmit="return true;" action="${url.loginAction}" method="post">
                <#if user.editUsernameAllowed>
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" placeholder="${msg("username")}" id="username" name="username" value="${(user.username!'')}"
                                class="${properties.kcInputClass!} login-field"
                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                            />

                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </div>
                </#if>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="email" placeholder="${msg("email")}" name="email" value="${(user.email!'')}"
                            class="${properties.kcInputClass!} login-field"
                            aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                        />

                        <#if messagesPerField.existsError('email')>
                            <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="firstName" placeholder="${msg("firstName")}" name="firstName" value="${(user.firstName!'')}"
                            class="${properties.kcInputClass!} login-field"
                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                        />

                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" placeholder="${msg("lastName")}" id="lastName" name="lastName" value="${(user.lastName!'')}"
                            class="${properties.kcInputClass!} login-field"
                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                        />

                        <#if messagesPerField.existsError('lastName')>
                            <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <#if isAppInitiatedAction??>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} btn" type="submit" value="${msg("doSubmit")}" />
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} btn-outline" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                        <#else>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} btn" type="submit" value="${msg("doSubmit")}" />
                        </#if>
                    </div>
                </div>
                </form>
            </div>
        <div>
            <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
        </div>
    </#if>
</@layout.registrationLayout>
