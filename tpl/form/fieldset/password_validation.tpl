<div
        class="component__password-bar mt-2"
        role="progressbar"
        aria-label="[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_STRENGTH"}]"
        aria-valuemin="0"
        aria-valuemax="3"
        aria-valuenow="0"
></div>
<small
        class="component__password-label d-block mt-1"
        role="status"
        aria-live="polite"
        data-label-weak="[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_WEAK"}]"
        data-label-medium="[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_MEDIUM"}]"
        data-label-strong="[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_STRONG"}]"
></small>

<div class="bg-light p-3 mt-2">
    <div class="component__password-requirement d-flex align-items-center gap-2 mb-2" data-req="length">
        <span class="rounded-circle border d-flex align-items-center justify-content-center" aria-hidden="true"></span>
        <span>[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LENGTH" args=$oViewConf->getPasswordLength()}]</span>
    </div>
    <div class="component__password-requirement d-flex align-items-center gap-2 mb-2" data-req="uppercase">
        <span class="rounded-circle border d-flex align-items-center justify-content-center" aria-hidden="true"></span>
        <span>[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_UPPERCASE_LETTER"}]</span>
    </div>
    <div class="component__password-requirement d-flex align-items-center gap-2 mb-2" data-req="lowercase">
        <span class="rounded-circle border d-flex align-items-center justify-content-center" aria-hidden="true"></span>
        <span>[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_LOWERCASE_LETTER"}]</span>
    </div>
    <div class="component__password-requirement d-flex align-items-center gap-2 mb-2" data-req="number">
        <span class="rounded-circle border d-flex align-items-center justify-content-center" aria-hidden="true"></span>
        <span>[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_NUMBER"}]</span>
    </div>
    <div class="component__password-requirement d-flex align-items-center gap-2" data-req="special">
        <span class="rounded-circle border d-flex align-items-center justify-content-center" aria-hidden="true"></span>
        <span>[{oxmultilang ident="O3_FORM_VALIDATION_PASSWORD_SPECIAL_CHARACTER"}]</span>
    </div>
</div>