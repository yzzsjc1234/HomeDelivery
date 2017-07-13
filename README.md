# HomeDelivery
This is a JaveEE Home Delivery Business &amp; Operation System based on Struts2/Spring/Hibernate and html/css/js.

HomeDelivery system contains mainstream functions such like user login, courier/region/subarea/decidedzone setting, system management, etc.

Summary:
1. Used Git as version control software.
2. User login contains MD5 encoding module and verification code.<br>
![image](https://github.com/yzzsjc1234/HomeDelivery/blob/master/Intro/login.png)
3. Used JQuery EasyUI to do page design like Ztree, Tabs, According, Datagrid and used Ajax/Json to display data on pages.
![image](https://github.com/yzzsjc1234/HomeDelivery/blob/master/Intro/easyui.png)
4. Used Apache POI to write/read excel files in order to implements upload/import and download/export functions between client and server.
5. Used session to do privilege control.
6. Used Apache Hessian to provide RMI function to invoke methods of connection between couriers & customers from CRM system(see from crm repository, url: https://github.com/yzzsjc1234/crm).
7. Used PowerDesigner to design database model and then export sql files.
8. Database contains 5 tables. More details please refer to /HomeDelivery/Database/homedelivery.sql
