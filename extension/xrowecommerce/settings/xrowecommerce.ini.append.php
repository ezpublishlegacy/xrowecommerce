<?php /* #?ini charset="utf-8"?

[Settings]
ShowColumnPosition=enabled
ShowColumnTax=enabled
ShowColumnRemove=enabled
#States of fields can be disabled, enabled, not_required
Captcha=disabled
Coupon=disabled
Catalogueorder=disabled
CompanyName=disabled
CompanyAdditional=disabled
Address2=enabled
NoPartialDelivery=enabled
Reference=enabled
Message=enabled
State=enabled
MI=not_required
State=not_required
TaxID=disabled
Fax=enabled
ConditionsOfService=enabled
CountryWithStatesList[]
#CountryWithStatesList[]=USA
#CountryWithStatesList[]=MEX
#CountryWithStatesList[]=CAN
ShopUserClassList[]=client
# Please use an override instead

[ShippingSettings]
#fields can be disabled / enabled in the shipping information
DisplayFax=enabled

#[MerchantLocations]
# Use ISO 3 letter country locales
#Location[]=USA
#Location[]=DEU
#USA[]=CT
#USA[]=NY

[TaxSettings]
CountryIndentifier=country
CompanyNameIndentifier=company_name

[MailSettings]
#define the receiver of the order confirmation mail
Email=
#Define if mail should be send out on checkout
SendOrderEmail=enabled
HTMLEmail=disabled

# one ore more bcc receiver of the order confirmation
EmailBCCReceiver[]

[BasketInformation]
DisplayTax=disabled
DisplayLogin=enabled
DisplayShipping=enabled
DisplayPaymentmethod=enabled
HazardousItems=disabled

[InvoiceSettings]
ShowFooter=enabled
CompanyName=Example Inc
#CompanyAddress[]
CompanyWebsite=http://www.example.com/
CompanyPhone=+1 555 123456

[EPaymentSettings]
# Payments should be capture right away or later
# values are AUTH_ONLY or AUTH_AND_CAPTURE
PaymentRequestType=AUTH_AND_CAPTURE
# Wheater the gateways should store or not store payment information in the order
StorePaymentInformation=enabled
#List of active creditcards
#ActiveCreditcards[]
#ActiveCreditcards[2]=Visa
#ActiveCreditcards[1]=MasterCard
#ActiveCreditcards[4]=American Express
#ActiveCreditcards[3]=Discover

[StatusSettings]
# Show payment status
ShowPaymentStatus=enabled

# Relate a Status to a type of xrowOrderStatusDefault
# StatusTypeList[3]=xrowOrderStatusPaid
# StatusTypeList[1000]=xrowOrderStatusCancel
StatusTypeList[]
# Define which status can`t we switched to
#
# StatusDisallowList-1000[]
# StatusDisallowList-1000[]=1
# StatusDisallowList-1000[]=2
#


* */ ?>
