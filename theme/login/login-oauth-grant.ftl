<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
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
                <#if client.name?has_content>
                    ${msg("oauthGrantTitle",advancedMsg(client.name))}
                <#else>
                    ${msg("oauthGrantTitle",client.clientId)}
                </#if>
                </p>
            </div>
            <div class="oauth-text">
                <h3>${msg("oauthGrantRequest")}</h3>
                <ul>
                <#if oauth.clientScopesRequested??>
                    <#list oauth.clientScopesRequested as clientScope>
                        <li>
                            <span>${advancedMsg(clientScope.consentScreenText)}</span>
                        </li>
                    </#list>
                </#if>
                </ul>
            </div> 
            <div>
               <form id="kc-form-login" class="form-oauth" onsubmit="return true;" action="${url.oauthAction}" method="post">
                    <input type="hidden" name="code" value="${oauth.code}">
                <input class="btn" name="accept" id="kc-login" type="submit" value="${msg("doYes")}" tabindex="3">
                <input class="btn-outline" name="cancel" id="kc-cancel" type="submit" value="${msg("doNo")}" tabindex="3">
                </form>
            </div>
        <div>
            <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
        </div>
    </#if>
</@layout.registrationLayout>
