<div class="shop-basket">
<h2>My Account</h2>
    <br />
    <div style="width: 100%;  color: #565969; font-size: 12px; font-weight: bold; background-color: #EBEEEF; float: left; padding-top: 5px; padding-bottom: 5px; padding-left: 5px;">
    <div style="float: left;">1. Cart</div>
    <div style="float: left; padding-left: 10px; color: #308d9d;">2. Billing, Shipping and Coupons</div>
    <div style="float: left; padding-left: 30px;">3. Confirmation</div>
    <div style="float: left; padding-left: 30px;">4. Payment info</div>
    <div style="float: left; padding-left: 30px;">5. Order completed</div>
    <div style="float: left; padding-left: 30px;">6. Review reciept</div>
    </div>
    <div class="break"></div>
    <br />
<div style="width: 335px; float: left;">{* LEFT COL START *}
<div style="border: 1px solid #d3d5d6; padding: 12px;">
<span class="headingur">Billing Information</span><br /><p>
Please enter your billing address exactly as it appears on your credit card statement.
<span class="required">* Required field</span></p>
{section show=$input_error}
<br />
<div class="warning">
<p>
<b>- Input did not validate, all fields marked with <span class="required">*</span> must be filled in.</b>
</p>
<br />
</div>

{/section}

<form method="post" action={"/alcone/userregister/"|ezurl} name='register'>
<div class="block">
	<div style="width: 160px; display: inline; float: left;">
    	<label><span class="required">*</span>First name</label>
    	<div class="labelbreak"></div>
    	<input type="text" name="FirstName" value="{$first_name|wash}" style="width: 150px;" />
    </div>

	<div style="width: 35px; display: inline; float: left;">
    	<label>MI</label>
    	<div class="labelbreak"></div>
    	<input class="halfbox" type="text" name="MI" size="2" value="{$mi|wash}" style="width: 25px;" />
    </div>

    <div style="width: 140px; display: inline; float: left;">
    	<label><span class="required">*</span>Last name</label>
    	<div class="labelbreak"></div>
    	<input type="text" name="LastName" value="{$last_name|wash}" style="width: 132px;" />
    </div>

	<div class="block">
		<label><span class="required">*</span>Address 1</label>
		<div class="labelbreak"></div>
		<input class="box" type="text" name="Address1" size="20" value="{$address1|wash}" />
	</div>

	<div class="block">
		<label>Address 2</label>
		<div class="labelbreak"></div>
		<input class="box" type="text" name="Address2" size="20" value="{$address2|wash}" />
	</div>


	<div style="width: 240px; display: inline; float: left;">
    	<label><span class="required">*</span>City / Town</label>
    	<div class="labelbreak"></div>
    	<input type="text" name="City" value="{$city|wash}" style="width: 230px;" />
    </div>

    <div style="width: 90px; display: inline; float: left;">
    	<label><span class="required">*</span>State / Province</label>
    	<div class="labelbreak"></div>
	    <select name="State" style="width: 80px;">
	    <option value=""></option>
	    	<optgroup label="USA">
    			<option  {if eq($state,'AL')} selected {/if} >AL</option>
    			<option  {if eq($state,'AK')} selected {/if} >AK</option>
    			<option  {if eq($state,'AS')} selected {/if} >AS</option>
    			<option  {if eq($state,'AZ')} selected {/if} >AZ</option>
    			<option  {if eq($state,'AR')} selected {/if} >AR</option>
    			<option  {if eq($state,'CA')} selected {/if} >CA</option>
    			<option  {if eq($state,'CO')} selected {/if} >CO</option>
    			<option  {if eq($state,'CT')} selected {/if} >CT</option>
    			<option  {if eq($state,'DE')} selected {/if} >DE</option>
    			<option  {if eq($state,'DC')} selected {/if} >DC</option>
    			<option  {if eq($state,'FM')} selected {/if} >FM</option>
    			<option  {if eq($state,'FL')} selected {/if} >FL</option>
    			<option  {if eq($state,'GA')} selected {/if} >GA</option>
    			<option  {if eq($state,'GU')} selected {/if} >GU</option>
    			<option  {if eq($state,'HI')} selected {/if} >HI</option>
    			<option  {if eq($state,'ID')} selected {/if} >ID</option>
    			<option  {if eq($state,'IL')} selected {/if} >IL</option>
    			<option  {if eq($state,'IN')} selected {/if} >IN</option>
    			<option  {if eq($state,'IA')} selected {/if} >IA</option>
    			<option  {if eq($state,'KS')} selected {/if} >KS</option>
    			<option  {if eq($state,'KY')} selected {/if} >KY</option>
    			<option  {if eq($state,'LA')} selected {/if} >LA</option>
    			<option  {if eq($state,'ME')} selected {/if} >ME</option>
    			<option  {if eq($state,'MH')} selected {/if} >MH</option>
    			<option  {if eq($state,'MD')} selected {/if} >MD</option>
    			<option  {if eq($state,'MA')} selected {/if} >MA</option>
    			<option  {if eq($state,'MI')} selected {/if} >MI</option>
    			<option  {if eq($state,'MN')} selected {/if} >MN</option>
    			<option  {if eq($state,'MS')} selected {/if} >MS</option>
    			<option  {if eq($state,'MO')} selected {/if} >MO</option>
    			<option  {if eq($state,'MT')} selected {/if} >MT</option>
    			<option  {if eq($state,'NE')} selected {/if} >NE</option>
    			<option  {if eq($state,'NV')} selected {/if} >NV</option>
    			<option  {if eq($state,'NH')} selected {/if} >NH</option>
    			<option  {if eq($state,'NJ')} selected {/if} >NJ</option>
    			<option  {if eq($state,'NM')} selected {/if} >NM</option>
    			<option  {if eq($state,'NY')} selected {/if} >NY</option>
    			<option  {if eq($state,'NC')} selected {/if} >NC</option>
    			<option  {if eq($state,'ND')} selected {/if} >ND</option>
    			<option  {if eq($state,'MP')} selected {/if} >MP</option>
    			<option  {if eq($state,'OH')} selected {/if} >OH</option>
    			<option  {if eq($state,'OK')} selected {/if} >OK</option>
    			<option  {if eq($state,'OR')} selected {/if} >OR</option>
    			<option  {if eq($state,'PW')} selected {/if} >PW</option>
    			<option  {if eq($state,'PA')} selected {/if} >PA</option>
    			<option  {if eq($state,'PR')} selected {/if} >PR</option>
    			<option  {if eq($state,'RI')} selected {/if} >RI</option>
    			<option  {if eq($state,'SC')} selected {/if} >SC</option>
    			<option  {if eq($state,'SD')} selected {/if} >SD</option>
    			<option  {if eq($state,'TN')} selected {/if} >TN</option>
    			<option  {if eq($state,'TX')} selected {/if} >TX</option>
    			<option  {if eq($state,'UT')} selected {/if} >UT</option>
    			<option  {if eq($state,'VT')} selected {/if} >VT</option>
    			<option  {if eq($state,'VI')} selected {/if} >VI</option>
    			<option  {if eq($state,'VA')} selected {/if} >VA</option>
    			<option  {if eq($state,'WA')} selected {/if} >WA</option>
    			<option  {if eq($state,'WV')} selected {/if} >WV</option>
    			<option  {if eq($state,'WI')} selected {/if} >WI</option>
    			<option  {if eq($state,'WY')} selected {/if} >WY</option>
			 </optgroup>
		     <optgroup label="Canada">
		        <option  {if eq($state,'AB')} selected {/if} >AB</option>
		        <option  {if eq($state,'BC')} selected {/if} >BC</option>
    			<option  {if eq($state,'MB')} selected {/if} >MB</option>
    			<option  {if eq($state,'NB')} selected {/if} >NB</option>
		        <option  {if eq($state,'NF')} selected {/if} >NF</option>
		        <option  {if eq($state,'NS')} selected {/if} >NS</option>
		        <option  {if eq($state,'NT')} selected {/if} >NT</option>
    			<option  {if eq($state,'ON')} selected {/if} >ON</option>
		        <option  {if eq($state,'PE')} selected {/if} >PE</option>
    			<option  {if eq($state,'PQ')} selected {/if} >PQ</option>
    			<option  {if eq($state,'SK')} selected {/if} >SK</option>
    			<option  {if eq($state,'YT')} selected {/if} >YT</option>
		     </optgroup>
		     <optgroup label="Mexico">
		        <option  {if eq($state,'AG')} selected {/if} >AG</option>
		        <option  {if eq($state,'BC')} selected {/if} >BC</option>
    			<option  {if eq($state,'BS')} selected {/if} >BS</option>
    			<option  {if eq($state,'CH')} selected {/if} >CH</option>
		        <option  {if eq($state,'CL')} selected {/if} >CL</option>
		        <option  {if eq($state,'CM')} selected {/if} >CM</option>
		        <option  {if eq($state,'CO')} selected {/if} >CO</option>
    			<option  {if eq($state,'CS')} selected {/if} >CS</option>
		        <option  {if eq($state,'DF')} selected {/if} >DF</option>
    			<option  {if eq($state,'DG')} selected {/if} >DG</option>
    			<option  {if eq($state,'GR')} selected {/if} >GR</option>
    			<option  {if eq($state,'GT')} selected {/if} >GT</option>
    			<option  {if eq($state,'HG')} selected {/if} >HG</option>
		        <option  {if eq($state,'JA')} selected {/if} >JA</option>
    			<option  {if eq($state,'MI')} selected {/if} >MI</option>
    			<option  {if eq($state,'MO')} selected {/if} >MO</option>
		        <option  {if eq($state,'MX')} selected {/if} >MX</option>
		        <option  {if eq($state,'NA')} selected {/if} >NA</option>
		        <option  {if eq($state,'NL')} selected {/if} >NL</option>
    			<option  {if eq($state,'OA')} selected {/if} >OA</option>
		        <option  {if eq($state,'PU')} selected {/if} >PU</option>
    			<option  {if eq($state,'QR')} selected {/if} >QR</option>
    			<option  {if eq($state,'QT')} selected {/if} >QT</option>
    			<option  {if eq($state,'SI')} selected {/if} >SI</option>
    			<option  {if eq($state,'SL')} selected {/if} >SL</option>
		        <option  {if eq($state,'SO')} selected {/if} >SO</option>
    			<option  {if eq($state,'TB')} selected {/if} >TB</option>
    			<option  {if eq($state,'TL')} selected {/if} >TL</option>
		        <option  {if eq($state,'TM')} selected {/if} >TM</option>
		        <option  {if eq($state,'VE')} selected {/if} >VE</option>
		        <option  {if eq($state,'YU')} selected {/if} >YU</option>
    			<option  {if eq($state,'ZA')} selected {/if} >ZA</option>
		     </optgroup>
	    </select>
    </div>
    <div class="break"></div>

<div style="width: 90px; display: inline; float: left;">
    <label><span class="required">*</span>Zip / Postcode</label>
    <div class="labelbreak"></div>
    <input type="text" name="Zip" value="{$zip|wash}" style="width: 80px;"/>
</div>
    <div class="break"></div>

<div style="width: 180px; display: inline; float: left;">
    <label><span class="required">*</span>Country</label>
    <div class="labelbreak"></div>

    {def $country_default_ini=ezini( 'ShopAccountHandlerDefaults', 'DefaultCountryCode', 'site.ini' )}
    {def $country_default=''}
    {def $country_list_item_code=''}

    {def $is_set=is_set($country)}
    {if $is_set}{if $country|ne('')}{def $country=$country|wash()}{else}{def $country=$country_default_ini}{/if}{else}{def $country=$country_default_ini}{/if}
    {def $countries=wrap_user_func('getCountryList', array(false, false))}
            <select name="Country" id="country" style="width: 170px;" onchange="shipping(this.value);">
                <option value=""></option>
                {foreach $countries as $country_list_item}
                 {if $country_list_item.Alpha3|eq('')}{set $country_list_item_code=$country_list_item.Alpha2}{else}{set $country_list_item_code=$country_list_item.Alpha3}{/if}
                 <option value="{$country_list_item_code}"{if eq( $country, $country_list_item_code )} selected="selected"{/if}>{$country_list_item.Name}</option>
                {/foreach}
            </select>
</div>
    <div class="break"></div>



<div class="block">
	<label><span class="required">*</span>Phone</label>
	<div class="labelbreak"></div>
	<input class="box" type="text" name="Phone" style="width: 170px;" value="{$phone|wash}" />
</div>

<div class="block">
	<label><span class="required">*</span>E-mail</label>
	<div class="labelbreak"></div>
	<input class="box" type="text" name="EMail" value="{$email|wash}" style="width: 170px;" />
</div>
    <div class="break"></div>

<div class="block">
	<label><span class="required">*</span>Shipping </label>
	<div class="labelbreak"></div>
	<select name="ShippingType">
	<!--
    <option value="0"{if eq($shippingtype,0)} selected {/if}>Standard Shipping (deprecated)</option>
	<option value="1"{if eq($shippingtype,1)} selected {/if}>Next Day Service (deprecated)</option>
	<option value="2"{if eq($shippingtype,2)} selected {/if}>2nd Day Service (deprecated)</option>
	-->
	<option value="3"{if eq($shippingtype,3)} selected {/if}>UPS Ground (USA only)</option>
	<option value="4"{if eq($shippingtype,4)} selected {/if}>UPS Next Business Day Air (USA only)</option>
	<option value="5"{if eq($shippingtype,5)} selected {/if}>UPS 2nd Business Day Air (USA only)</option>
	<option value="6"{if eq($shippingtype,6)} selected {/if}>USPS Express Mail International (EMS) (Intl. only)</option>
	<option value="7"{if eq($shippingtype,7)} selected {/if}>USPS Global Express Guaranteed (Intl. only)</option>
	</select>
</div>
    <div class="break"></div>
    </div>
</div>

<div style="border: 1px solid #d3d5d6;  padding: 12px; margin-top:1em;">

<span class="headingur">Coupon</span>
<p>Please enter your coupon code exactly as it appears on your promotion.</p>
<div class="block">
	<label>Coupon</label>
	<div class="labelbreak"></div>
	<input class="box" type="text" name="coupon_code" value="{$coupon_code|wash}" size="20" />
</div>
</div>

</div> {*LEFT COL END*}

<script type="text/javascript">
function change(status)
{ldelim}
if (status)
    {ldelim}
        document.register.sik_firstname.value = document.register.sfirstname.value;
        document.register.sfirstname.value = '';
        document.register.sik_lastname.value = document.register.slastname.value;
        document.register.slastname.value = '';
        document.register.sik_mi.value = document.register.smi.value;
        document.register.smi.value = '';
        document.register.sik_zip.value = document.register.szip.value;
        document.register.szip.value = '';
        document.register.sik_phone.value = document.register.sphone.value;
        document.register.sphone.value = '';
        document.register.sik_email.value = document.register.semail.value;
        document.register.semail.value = '';
        document.register.sik_address1.value = document.register.saddress1.value;
        document.register.saddress1.value = '';
        document.register.sik_address2.value = document.register.saddress2.value;
        document.register.saddress2.value = '';
        document.register.sik_city.value = document.register.scity.value;
        document.register.scity.value = '';
        document.register.sik_state.value = document.register.sstate.value;
        document.register.sstate.value = '';
        document.register.sik_country.value = document.register.scountry.value;
        document.register.scountry.value = '';

        document.getElementById("shippinginfo").style.display = 'none';
    {rdelim}
    else
    {ldelim}
        document.register.sfirstname.value = document.register.sik_firstname.value;
        document.register.sik_firstname.value = '';
        document.register.slastname.value = document.register.sik_lastname.value;
        document.register.sik_lastname.value = '';
        document.register.smi.value = document.register.sik_mi.value;
        document.register.sik_mi.value = '';
        document.register.szip.value = document.register.sik_zip.value;
        document.register.sik_zip.value = '';
        document.register.sphone.value = document.register.sik_phone.value;
        document.register.sik_phone.value = '';
        document.register.semail.value = document.register.sik_email.value;
        document.register.sik_email.value = '';
        document.register.saddress1.value = document.register.sik_address1.value;
        document.register.sik_address1.value = '';
        document.register.saddress2.value = document.register.sik_address2.value;
        document.register.sik_address2.value = '';
        document.register.scity.value = document.register.sik_city.value;
        document.register.sik_city.value = '';
        document.register.sstate.value = document.register.sik_state.value;
        document.register.sik_state.value = '';
        document.register.scountry.value = document.register.sik_country.value;
        document.register.sik_country.value = '';
        document.getElementById("shippinginfo").style.display = 'block';
    {rdelim}
{rdelim}

function shipping(status)
{ldelim}
if (document.register.Shipping.checked == false)
    {ldelim}
        status = document.register.scountry.value;
    {rdelim}
    
    if (status == "USA")
    {ldelim}
        for (i = 0; i < document.register.ShippingType.length; ++i)
        {ldelim}
            if ( document.register.ShippingType[i].value >= 6  &&  document.register.ShippingType[i].value <= 7 )
                document.register.ShippingType.options[i].disabled = true;
            else document.register.ShippingType.options[i].disabled = false;
        {rdelim}
        if (document.register.ShippingType.selectedIndex+3 >=6 && document.register.ShippingType.selectedIndex+3 <=7)
            document.register.ShippingType.options[0].selected = true;
    {rdelim}
    else
    {ldelim}
        for (i = 0; i < document.register.ShippingType.length; ++i)
        {ldelim}
            if ( document.register.ShippingType[i].value >= 3  &&  document.register.ShippingType[i].value <= 5 )
                document.register.ShippingType.options[i].disabled = true;
            else document.register.ShippingType.options[i].disabled = false;
        {rdelim}
        if (document.register.ShippingType.selectedIndex+3 >=3 && document.register.ShippingType.selectedIndex+3 <=5)
            document.register.ShippingType.options[3].selected = true;
    {rdelim}
{rdelim}
</script>
{* right column *}
<div style="border: 1px solid #d3d5d6; width: 335px; padding: 12px; float: left; margin-left: 15px;">
<span class="headingur">Shipping Information</span><br /><p>
<table border="0">
        <tr>
        <td>
            <input name="Shipping" value="1" type="checkbox" {$shipping|choose( '', 'checked="checked"' )}
            onchange="change(this.checked); shipping(document.register.country.value);"
            />
        </td>
        <td>
            <p>
            My billing and shipping addresses are identical <b>(please leave form blank below)</b>. <span class="required">* Required field</span>
        </p>
        </td>
        </tr>
{*
        <tr>
        <td>
            <input name="SaveShopAccountToUser" value="1" type="checkbox" {$saveaddress|choose( '', 'checked="checked"' )} />
        </td>
        <td>
            <p>Save changes to my address(es) into my account for use <i>next</i> order.</p>
        </td>
        </tr>
*}
        </table>{section show=$input_error}
<br />
<div class="warning">
<p>
<b>- Input did not validate, all fields marked with <span class="required">*</span> must be filled in.</b>
</p>
<br />
</div>

{/section}

<div class="block" id="shippinginfo" name="shippinginfo" {$shipping|choose( "style='display: block;'", "style='display: none;'")}>

	<div style="width: 160px; display: inline; float: left;">
    	<label><span class="required">*</span>First name</label>
    	<div class="labelbreak"></div>
    	<input type="text" name="s_FirstName" id="sfirstname" value="{$s_first_name|wash}" style="width: 150px;" />
    	<input type="hidden" name="sik_firstname" id="sik_firstname" value="" />
    </div>

	<div style="width: 35px; display: inline; float: left;">
    	<label>MI</label>
    	<div class="labelbreak"></div>
    	<input class="halfbox" type="text" name="s_MI" id="smi" size="2" value="{$s_mi|wash}" style="width: 25px;" />
    	<input type="hidden" name="sik_mi" id="sik_mi" value="" />
    </div>

    <div style="width: 140px; display: inline; float: left;">
    	<label><span class="required">*</span>Last name</label>
    	<div class="labelbreak"></div>
    	<input type="text" name="s_LastName" id="slastname" value="{$s_last_name|wash}" style="width: 132px;" />
    	<input type="hidden" name="sik_lastname" id="sik_lastname" value="" />
    </div>

	<div class="block">
		<label><span class="required">*</span>Address 1</label>
		<div class="labelbreak"></div>
		<input class="box" type="text" name="s_Address1" id="saddress1" size="20" value="{$s_address1|wash}" />
		<input type="hidden" name="sik_address1" id="sik_address1" value="" />
	</div>

	<div class="block">
		<label>Address 2</label>
		<div class="labelbreak"></div>
		<input class="box" type="text" name="s_Address2" size="20" id="saddress2" value="{$s_address2|wash}" />
		<input type="hidden" name="sik_address2" id="sik_address2" value="" />
	</div>


	<div style="width: 240px; display: inline; float: left;">
    	<label><span class="required">*</span>City / Town</label>
    	<div class="labelbreak"></div>
    	<input type="text" name="s_City" value="{$s_city|wash}" id="scity" style="width: 230px;" />
    	<input type="hidden" name="sik_city" id="sik_city" value="" />
    </div>

    <div style="width: 90px; display: inline; float: left;">
    	<label><span class="required">*</span>State / Province</label>
    	<div class="labelbreak"></div>
    	<input type="hidden" name="sik_state" id="sik_state" value="" />
	    <select name="s_State" id="sstate" style="width: 80px;">
            <option value=""></option>
	    	<optgroup label="USA">
    			<option  {if eq($s_state,'AL')} selected {/if} >AL</option>
    			<option  {if eq($s_state,'AK')} selected {/if} >AK</option>
    			<option  {if eq($s_state,'AS')} selected {/if} >AS</option>
    			<option  {if eq($s_state,'AZ')} selected {/if} >AZ</option>
    			<option  {if eq($s_state,'AR')} selected {/if} >AR</option>
    			<option  {if eq($s_state,'CA')} selected {/if} >CA</option>
    			<option  {if eq($s_state,'CO')} selected {/if} >CO</option>
    			<option  {if eq($s_state,'CT')} selected {/if} >CT</option>
    			<option  {if eq($s_state,'DE')} selected {/if} >DE</option>
    			<option  {if eq($s_state,'DC')} selected {/if} >DC</option>
    			<option  {if eq($s_state,'FM')} selected {/if} >FM</option>
    			<option  {if eq($s_state,'FL')} selected {/if} >FL</option>
    			<option  {if eq($s_state,'GA')} selected {/if} >GA</option>
    			<option  {if eq($s_state,'GU')} selected {/if} >GU</option>
    			<option  {if eq($s_state,'HI')} selected {/if} >HI</option>
    			<option  {if eq($s_state,'ID')} selected {/if} >ID</option>
    			<option  {if eq($s_state,'IL')} selected {/if} >IL</option>
    			<option  {if eq($s_state,'IN')} selected {/if} >IN</option>
    			<option  {if eq($s_state,'IA')} selected {/if} >IA</option>
    			<option  {if eq($s_state,'KS')} selected {/if} >KS</option>
    			<option  {if eq($s_state,'KY')} selected {/if} >KY</option>
    			<option  {if eq($s_state,'LA')} selected {/if} >LA</option>
    			<option  {if eq($s_state,'ME')} selected {/if} >ME</option>
    			<option  {if eq($s_state,'MH')} selected {/if} >MH</option>
    			<option  {if eq($s_state,'MD')} selected {/if} >MD</option>
    			<option  {if eq($s_state,'MA')} selected {/if} >MA</option>
    			<option  {if eq($s_state,'MI')} selected {/if} >MI</option>
    			<option  {if eq($s_state,'MN')} selected {/if} >MN</option>
    			<option  {if eq($s_state,'MS')} selected {/if} >MS</option>
    			<option  {if eq($s_state,'MO')} selected {/if} >MO</option>
    			<option  {if eq($s_state,'MT')} selected {/if} >MT</option>
    			<option  {if eq($s_state,'NE')} selected {/if} >NE</option>
    			<option  {if eq($s_state,'NV')} selected {/if} >NV</option>
    			<option  {if eq($s_state,'NH')} selected {/if} >NH</option>
    			<option  {if eq($s_state,'NJ')} selected {/if} >NJ</option>
    			<option  {if eq($s_state,'NM')} selected {/if} >NM</option>
    			<option  {if eq($s_state,'NY')} selected {/if} >NY</option>
    			<option  {if eq($s_state,'NC')} selected {/if} >NC</option>
    			<option  {if eq($s_state,'ND')} selected {/if} >ND</option>
    			<option  {if eq($s_state,'MP')} selected {/if} >MP</option>
    			<option  {if eq($s_state,'OH')} selected {/if} >OH</option>
    			<option  {if eq($s_state,'OK')} selected {/if} >OK</option>
    			<option  {if eq($s_state,'OR')} selected {/if} >OR</option>
    			<option  {if eq($s_state,'PW')} selected {/if} >PW</option>
    			<option  {if eq($s_state,'PA')} selected {/if} >PA</option>
    			<option  {if eq($s_state,'PR')} selected {/if} >PR</option>
    			<option  {if eq($s_state,'RI')} selected {/if} >RI</option>
    			<option  {if eq($s_state,'SC')} selected {/if} >SC</option>
    			<option  {if eq($s_state,'SD')} selected {/if} >SD</option>
    			<option  {if eq($s_state,'TN')} selected {/if} >TN</option>
    			<option  {if eq($s_state,'TX')} selected {/if} >TX</option>
    			<option  {if eq($s_state,'UT')} selected {/if} >UT</option>
    			<option  {if eq($s_state,'VT')} selected {/if} >VT</option>
    			<option  {if eq($s_state,'VI')} selected {/if} >VI</option>
    			<option  {if eq($s_state,'VA')} selected {/if} >VA</option>
    			<option  {if eq($s_state,'WA')} selected {/if} >WA</option>
    			<option  {if eq($s_state,'WV')} selected {/if} >WV</option>
    			<option  {if eq($s_state,'WI')} selected {/if} >WI</option>
    			<option  {if eq($s_state,'WY')} selected {/if} >WY</option>
			 </optgroup>
		     <optgroup label="Canada">
		        <option  {if eq($s_state,'AB')} selected {/if} >AB</option>
		        <option  {if eq($s_state,'BC')} selected {/if} >BC</option>
    			<option  {if eq($s_state,'MB')} selected {/if} >MB</option>
    			<option  {if eq($s_state,'NB')} selected {/if} >NB</option>
		        <option  {if eq($s_state,'NF')} selected {/if} >NF</option>
		        <option  {if eq($s_state,'NS')} selected {/if} >NS</option>
		        <option  {if eq($s_state,'NT')} selected {/if} >NT</option>
    			<option  {if eq($s_state,'ON')} selected {/if} >ON</option>
		        <option  {if eq($s_state,'PE')} selected {/if} >PE</option>
    			<option  {if eq($s_state,'PQ')} selected {/if} >PQ</option>
    			<option  {if eq($s_state,'SK')} selected {/if} >SK</option>
    			<option  {if eq($s_state,'YT')} selected {/if} >YT</option>
		     </optgroup>
		     <optgroup label="Mexico">
		        <option  {if eq($s_state,'AG')} selected {/if} >AG</option>
		        <option  {if eq($s_state,'BC')} selected {/if} >BC</option>
    			<option  {if eq($s_state,'BS')} selected {/if} >BS</option>
    			<option  {if eq($s_state,'CH')} selected {/if} >CH</option>
		        <option  {if eq($s_state,'CL')} selected {/if} >CL</option>
		        <option  {if eq($s_state,'CM')} selected {/if} >CM</option>
		        <option  {if eq($s_state,'CO')} selected {/if} >CO</option>
    			<option  {if eq($s_state,'CS')} selected {/if} >CS</option>
		        <option  {if eq($s_state,'DF')} selected {/if} >DF</option>
    			<option  {if eq($s_state,'DG')} selected {/if} >DG</option>
    			<option  {if eq($s_state,'GR')} selected {/if} >GR</option>
    			<option  {if eq($s_state,'GT')} selected {/if} >GT</option>
    			<option  {if eq($s_state,'HG')} selected {/if} >HG</option>
		        <option  {if eq($s_state,'JA')} selected {/if} >JA</option>
    			<option  {if eq($s_state,'MI')} selected {/if} >MI</option>
    			<option  {if eq($s_state,'MO')} selected {/if} >MO</option>
		        <option  {if eq($s_state,'MX')} selected {/if} >MX</option>
		        <option  {if eq($s_state,'NA')} selected {/if} >NA</option>
		        <option  {if eq($s_state,'NL')} selected {/if} >NL</option>
    			<option  {if eq($s_state,'OA')} selected {/if} >OA</option>
		        <option  {if eq($s_state,'PU')} selected {/if} >PU</option>
    			<option  {if eq($s_state,'QR')} selected {/if} >QR</option>
    			<option  {if eq($s_state,'QT')} selected {/if} >QT</option>
    			<option  {if eq($s_state,'SI')} selected {/if} >SI</option>
    			<option  {if eq($s_state,'SL')} selected {/if} >SL</option>
		        <option  {if eq($s_state,'SO')} selected {/if} >SO</option>
    			<option  {if eq($s_state,'TB')} selected {/if} >TB</option>
    			<option  {if eq($s_state,'TL')} selected {/if} >TL</option>
		        <option  {if eq($s_state,'TM')} selected {/if} >TM</option>
		        <option  {if eq($s_state,'VE')} selected {/if} >VE</option>
		        <option  {if eq($s_state,'YU')} selected {/if} >YU</option>
    			<option  {if eq($s_state,'ZA')} selected {/if} >ZA</option>
		     </optgroup>
	    </select>
    </div>
    <div class="break"></div>

<div style="width: 90px; display: inline; float: left;">
    <label><span class="required">*</span>Zip / Postcode</label>
    <div class="labelbreak"></div>
    <input type="text" name="s_Zip" id="szip" value="{$s_zip|wash}" style="width: 80px;"/>
    <input type="hidden" name="sik_zip" id="sik_zip" value="" />
</div>
    <div class="break"></div>

<div style="width: 180px; display: inline; float: left;">
    <label><span class="required">*</span>Country</label>
    <div class="labelbreak"></div>


    {def $country_default=''}
    {def $is_set=is_set($s_country)}
    {if $is_set}{if $s_country|ne('')}{def $s_country=$country|wash()}{else}{def $s_country=$country_default_ini}{/if}{else}{def $s_country=$country_default_ini}{/if}

    {def $countries=wrap_user_func('getCountryList', array(false, false))}
    <input type="hidden" name="sik_country" id="sik_country" value="" />
            <select name="s_Country" id="scountry" style="width: 170px;" onchange="shipping(document.register.country.value);">
                <option value=""></option>
                {foreach $countries as $country_list_item}
                 {if $country_list_item.Alpha3|eq('')}{def $country_list_item_code=$country_list_item.Alpha2}{else}{def $country_list_item_code=$country_list_item.Alpha3}{/if}
                 <option value="{$country_list_item_code}"{if eq( $s_country, $country_list_item_code )} selected="selected"{/if}>{$country_list_item.Name}</option>
                {/foreach}
            </select>
</div>
    <div class="break"></div>

<div class="block">
	<label><span class="required">*</span>Phone</label>
	<div class="labelbreak"></div>
	<input class="box" type="text" id="sphone" name="s_Phone" style="width: 170px;" value="{$s_phone|wash}" />
	<input type="hidden" name="sik_phone" id="sik_phone" value="" />
</div>

<div class="block">
	<label><span class="required">*</span>E-mail</label>
	<div class="labelbreak"></div>
	<input class="box" type="text" name="s_EMail" id="semail" value="{$s_email|wash}" style="width: 170px;" />
	<input type="hidden" name="sik_email" id="sik_email" value="" />
</div>
    <div class="break"></div>

    </div>
    {* <br /> *}

  <br />
<div class="buttonblock">
<table border=0" width="100%">
<tr>
 <td align="left"><input type="image" src={"images/cancel_small.gif"|ezdesign()} name="CancelButton" value="Cancel" /></td>
 <td align="right"><input type="image" src={"images/continue_small.gif"|ezdesign()} name="StoreButton" value="Continue" /></td>
</tr>
</table>
</div>

    {*
    <div class="buttonblock">
    <input type="image" src={"images/cancel_small.gif"|ezdesign()} name="CancelButton" value="Cancel" />
    <input type="image" src={"images/continue_small.gif"|ezdesign()} name="StoreButton" value="Continue" />
    </div>
    *}
<br />
{* / left column *}
</div>
{literal}
<script type="text/javascript">
    if (document.register.Shipping.checked == false)
        {
            country = document.register.scountry.value;
        }
    if (document.register.Shipping.checked == true)
        {
            country = document.register.Country.value;
        }
    if (country == "USA")
    {
        for (i = 0; i < document.register.ShippingType.length; ++i)
        {
            if ( document.register.ShippingType[i].value >= 6  &&  document.register.ShippingType[i].value <= 7 )
                document.register.ShippingType.options[i].disabled = true;
            else document.register.ShippingType.options[i].disabled = false;
        }
        if (document.register.ShippingType.selectedIndex+3 >=6 && document.register.ShippingType.selectedIndex+3 <=7)
            document.register.ShippingType.options[0].selected = true;
    }
    else
    {
        for (i = 0; i < document.register.ShippingType.length; ++i)
        {
            if ( document.register.ShippingType[i].value >= 3  &&  document.register.ShippingType[i].value <= 5 )
                document.register.ShippingType.options[i].disabled = true;
            else document.register.ShippingType.options[i].disabled = false;
        }
            if (document.register.ShippingType.selectedIndex+3 >=3 && document.register.ShippingType.selectedIndex+3 <=5)
                document.register.ShippingType.options[3].selected = true;
    }
</script>
{/literal}
</form>
