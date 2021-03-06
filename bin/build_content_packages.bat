@echo on
cd C:\workspace\shop
RMDIR /S /Q var\storage\packages\eZ-systems
RMDIR /S /Q var\storage\packages\local
php ezpm.php -s ezwebin_site_admin create xrowecommerce_classes "xrowecommerce classes" 1.1-0 install
php ezpm.php -s ezwebin_site_admin add xrowecommerce_classes ezcontentclass xrow_product_category,xrow_product_review,xrow_product,manufacturer,coupon,client,xrow_package
php ezpm.php -s ezwebin_site_admin set xrowecommerce_classes type contentclass
php ezpm.php -s ezwebin_site_admin set xrowecommerce_classes 'vendor' 'xrow GmbH'
php ezpm.php -s ezwebin_site_admin set xrowecommerce_classes 'state' 'stable'
php ezpm.php -s ezwebin_site_admin create xrowecommerce_content "xrowecommerce content" 1.1-0 install
php ezpm.php -s ezwebin_site_admin set xrowecommerce_content type contentobject
php ezpm.php -s ezwebin_site_admin set xrowecommerce_content 'vendor' 'xrow GmbH'
php ezpm.php -s ezwebin_site_admin set xrowecommerce_content 'state' 'stable'
php ezpm.php -s ezwebin_site_admin add xrowecommerce_content ezcontentobject --exclude-classes --exclude-templates --current-version "democontent/*" "manufacturer/*" "shop2" "news/*" "beer/*" "coupons/*" "packages/*" "products/*"
RMDIR /S /Q var\storage\packages\local\xrowecommerce_classes\.cache
RMDIR /S /Q var\storage\packages\local\xrowecommerce_content\.cache
cd C:\svn\xrowecommerce\trunk\packages
svn rm xrowecommerce_content
svn rm xrowecommerce_classes
RMDIR /S /Q xrowecommerce_classes
RMDIR /S /Q xrowecommerce_content
svn commit -m"remove packages"
XCOPY /Y /E /I C:\workspace\shop\var\storage\packages\local\xrowecommerce_classes C:\svn\xrowecommerce\trunk\packages\xrowecommerce_classes
XCOPY /Y /E /I C:\workspace\shop\var\storage\packages\local\xrowecommerce_content C:\svn\xrowecommerce\trunk\packages\xrowecommerce_content
svn add xrowecommerce_content
svn add xrowecommerce_classes
svn commit -m"add packages"