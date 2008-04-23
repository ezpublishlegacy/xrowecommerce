{* DO NOT EDIT THIS FILE! Use an override template instead. *}

<div id="main-wide">
<h1>My Account ({$userAccount.login})</h1>


<div class="block">
  <label>{"Username"|i18n("design/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$userAccount.login|wash}</p>
</div>

<div class="block">
  <label>{"E-mail"|i18n("design/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$userAccount.email|wash(email)}</p>
</div>

<div class="block">
  <label>{"Name"|i18n("design/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$userAccount.contentobject.name|wash}</p>
</div>

    <div class="buttonblock">
    <form action={concat($module.functions.edit.uri,"/",$userID)|ezurl} method="post" name="Edit">
        <input class="button" type="submit" name="EditButton" value="{'Edit profile'|i18n('design/standard/user')}" />
        <input class="button" type="submit" name="ChangePasswordButton" value="{'Change password'|i18n('design/standard/user')}" />
    </form>
    <div class="break"></div>
    </div>
    <div class="buttonblock">
    <form action={"recurringorders/list"|ezurl} method="post">
        <input class="rarrow-orange" type="submit" name="EditButton" value="{'Recurring order'|i18n('design/standard/user')}" />
    </form>
        <div class="break"></div>
    </div>
    <div class="buttonblock">
     <form action={"order/history"|ezurl} method="get">
       <input class="rarrow-orange" type="submit" name="EditButton" value="{'Order History and Invoices'|i18n('design/standard/user')}" />
    </form>
    <div class="break"></div>
    </div>
</div>

