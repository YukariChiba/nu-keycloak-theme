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
                <p class="client-name">${msg("loginTitle",(realm.displayName!''))}</p>
            </div>
            <div>
                <h3>${msg("oauthGrantRequest")}</h3>
                <ul>
                    <#if oauth.claimsRequested??>
                        <li>
                            <span>
                                ${msg("personalInfo")}&nbsp;
                                <#list oauth.claimsRequested as claim>
                                    ${advancedMsg(claim)}<#if claim_has_next>,&nbsp;</#if>
                                </#list>
                            </span>
                        </li>
                    </#if>
                    <#if oauth.accessRequestMessage??>
                        <li>
                            <span>
                                ${oauth.accessRequestMessage}
                            </span>
                        </li>
                    </#if>
                    <#if oauth.realmRolesRequested??>
                        <#list oauth.realmRolesRequested as role>
                            <li>
                                <span><#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if></span>
                            </li>
                        </#list>
                    </#if>
                    <#if oauth.resourceRolesRequested??>
                        <#list oauth.resourceRolesRequested?keys as resource>
                            <#list oauth.resourceRolesRequested[resource] as clientRole>
                                <li>
                                    <span class="kc-role"><#if clientRole.roleDescription??>${advancedMsg(clientRole.roleDescription)}<#else>${advancedMsg(clientRole.roleName)}</#if></span>
                                    <span class="kc-resource">${msg("inResource")} <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong> </span>
                                </li>
                            </#list>
                        </#list>
                    </#if>
                </ul>
            </div> 
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.oauthAction}" method="post">
                    <input type="hidden" name="code" value="${oauth.code}">
                <input class="submit" type="submit" value="${msg("doYes")}" tabindex="3">
                </form>
            </div>
        <div>
            <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
        </div>
    </#if>
</@layout.registrationLayout>
