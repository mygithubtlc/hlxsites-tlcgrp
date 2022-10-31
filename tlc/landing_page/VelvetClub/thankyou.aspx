<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            If Request.QueryString("name") = Nothing Then
                lbl.Value = "Guest,"
            Else
                lbl.Value = StrConv(Request.QueryString("name") & " " & Request.QueryString("lname") & ",", VbStrConv.ProperCase)
            End If
        End If
    End Sub
</script>


<html lang="en">
<head>
<title>Thank You</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" />
    
<!--[if IE 8 ]> <html class="ie8"> <![endif]-->
<!--
 <script type="text/javascript">
     window.setTimeout(function () {
         window.location.href = "http://clubatthehyatt.com/";
     }, 5000);
    </script>
-->
    <style type="text/css">
@charset "utf-8";
/* CSS Document */
* {margin: 0;padding: 0;}
html, ul, li, p, h1, h2, h3, h4, h5, h6, img, a, input, textarea, pre{padding:0; margin:0; list-style:none; border:none; outline:none;}
body {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#000; padding:0; margin:0; background:#fff;}
.Align-center{text-align:center;}
.Align-left{text-align:left;}
.Aligh-right{text-align:right;}
.Float-left{float:left;}
.Float-right{float:right;}
.Clear{clear:both; width:0px; height:0px;}
.Layout-width{width:800px; margin:auto;}
div.header {width:746px; margin:auto;}
div.section {width:746px; margin:auto;}
.Logo{float:left;}
.Top-nav{float:right; text-align:center;}
.Top-nav a{
  color:#7e7e7e; 
  float:left;
  text-decoration:none;
  margin:16px 2px;
  border-right:1px solid #7e7e7e;
  padding:0 17px;
}
.Top-nav a:link{
  color:#7e7e7e; 
  float:left;
  text-decoration:none;
  margin:16px 2px;
  border-right:1px solid #7e7e7e;
  padding:0 17px;
}
.Top-nav a:hover{
  color:#7e7e7e; 
  text-decoration:none;
}
.Top-nav a img{}
.Top-nav a p{float:none !important; clear:both;}
.Header-pic{background:#fff; border-radius:8px; box-shadow: 0 0 5px #888888; padding:11px;margin-top:4px;}
.Header-pic1{background:#fff; padding:11px;margin-top:4px;}
div.section .margin{padding:18px 10px; margin:0 4px;}
div.section .margin p{font-weight:bold; margin:15px 0;}
div.section .margin p a{color:#0303ff; text-decoration:underline;}
div.section .margin p a:link{color:#0303ff; text-decoration:underline;}
div.section .margin p a:hover{color:#0303ff; text-decoration:none;}
div.section .margin span{float:left; clear:both; width:150px; line-height:18px; color:#000 !important; font-weight:normal !important;}

div.section div.article{margin:20px 15px;}
div.section div.article .Form{

}
div.section div.article .Form h1{font-size:18px; text-transform:uppercase; font-style:italic; color:#4b4b4b; line-height:40px; text-align:center;}
div.section div.article .Form label{float:left; width:180px; text-align:left; font-size:12px; line-height:22px; color:#000;}
div.section div.article .Form input{background:#fff; width:250px; padding:0px 10px; height:22px; border:1px solid #CCCCCC; border-radius:3px; float:left; border:1px solid #ccc;}
.Form-margin{padding:4px 0;}
.Form-margin .Checkbox-div{float:left; width:88px;}
.Form-margin .Checkbox-div p{line-height:22px; font-size:11px;}
.Form-margin .Checkbox-div p input[type=checkbox] {
  float:left;
  width:16px !important;
  margin-right:5px;
  box-shadow:none !important;
  padding:0 !important;
  border:none !important;
  }
.Form-margin .Checkbox-div p a{
    background: #818181;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5a5a5', endColorstr='#818181');
    background: -webkit-gradient(linear, left top, left bottom, from(#a5a5a5), to(#818181));
    background: -moz-linear-gradient(top,  #a5a5a5,  #818181);
    font-family:Arial, Helvetica, sans-serif;
    font-size:13px;
    text-decoration:none;
    padding:5px 20px;
    color:#fff;
    border-radius:4px;
    border:1px solid #4a4a4a;
}
.Form-margin .Checkbox-div p a:link{
    background: #818181;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5a5a5', endColorstr='#818181');
    background: -webkit-gradient(linear, left top, left bottom, from(#a5a5a5), to(#818181));
    background: -moz-linear-gradient(top,  #a5a5a5,  #818181);
    font-family:Arial, Helvetica, sans-serif;
    font-size:13px;
    text-decoration:none;
    padding:5px 20px;
    color:#fff;
    border-radius:4px;
    border:1px solid #4a4a4a;
}
.Form-margin .Checkbox-div p a:hover{
    background: #818181;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#818181', endColorstr='#a5a5a5');
    background: -webkit-gradient(linear, left top, left bottom, from(#818181), to(#a5a5a5));
    background: -moz-linear-gradient(top,  #818181,  #a5a5a5);
    text-decoration:none;
    color:#fff;
}
div.article .Card_div{margin-top:15px;}
div.article .Card_div h2{color:#454545; font-family:Arial, Helvetica, sans-serif; font-size:18px; font-weight:bold; line-height:30px; text-align:center;}
div.article .Card_div p{line-height:20px; text-align:justify;}
/*div.article .Card_div ul{list-style:none; margin:25px 0; padding:0;}
div.article .Card_div li{float:left; border:1px solid #ccc; width:226px;}
*/
div.article .Card_div li h3{font-family:"Trebuchet MS", Arial, Helvetica, sans-serif; font-size:14px; font-weight:bold; text-align:center; line-height:30px;}
div.article .Card_div li h4{font-size:13px; font-weight:bold; text-align:center; line-height:30px;}
div.article .Card_div li a{color:#755723; font-size:12px; text-decoration:underline; float:left; clear:both; text-align:center; padding-bottom:10px; width:226px;}
div.article .Card_div li a:link{color:#755723; font-size:12px; text-decoration:underline; float:left; clear:both; text-align:center; padding-bottom:10px;width:226px;}
div.article .Card_div li a:hover{color:#755723; text-decoration:none;}
div.article .Card_div img{text-align:center; clear:both; margin:10px 37px;}
.Help-desk {
    margin: 10px 0;
}
.Help-desk label{
    float:left; 
     line-height:16px !important;
     width:auto !important;
     padding:8px 0px !important;
     margin-right:9px !important;
     font-weight:bold;  
     font-size:14px; 
}
.Help-desk p{float:left; line-height:30px !important;}
div.section div.article .Form .submitbutton {
    padding-left:180px;
    clear:both;
    float:left;
}
div.section div.article .Form .submitbutton p input{
    background: #818181 !important;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5a5a5', endColorstr='#818181');
    background: -webkit-gradient(linear, left top, left bottom, from(#a5a5a5), to(#818181));
    background: -moz-linear-gradient(top,  #a5a5a5,  #818181);
    font-family:Arial, Helvetica, sans-serif;
    font-size:13px;
    text-decoration:none !important;
    padding:0px 20px !important;
    color:#fff;
    border-radius:4px !important;
    border:1px solid #4a4a4a;
        width:78px !important;
        height:26px;
        box-shadow:none !important;
}
.stdcode{
         margin-left:3px;
} 
/*--------------- Change --------------------*/
@charset "utf-8";
/* CSS Document */
* {margin: 0;padding: 0;}
html, ul, li, p, h1, h2, h3, h4, h5, h6, img, a, input, textarea, pre{padding:0; margin:0; list-style:none; border:none; outline:none;}
.Align-center{text-align:center;}
.Align-left{text-align:left;}
.Aligh-right{text-align:right;}
.Float-left{float:left;}
.Float-right{float:right;}
.Clear{clear:both; width:0px; height:0px;}
.Layout-width{width:800px; margin:auto;}
header {width:746px; margin:auto;}
section {margin:auto;}
.Logo{float:left;}
.Top-nav{float:right;}
.Top-nav a{
  color:#000; 
  float:left;
  text-decoration:none;
  margin:16px 2px;
  border-right:1px solid #000;
  padding:0 17px;
  font-family:"Times New Roman", Times, serif;
  font-size:13px;
}
.Top-nav a:link{
  color:#000; 
  float:left;
  text-decoration:none;
  margin:16px 2px;
  border-right:1px solid #000;
  padding:0 17px;
  font-family:"Times New Roman", Times, serif;
  font-size:13px;
}
.Top-nav a:hover{
  color:#000; 
  text-decoration:none;
}
.Top-nav a img{margin-left:8px;}
.Top-nav a p{float:none !important; clear:both;}
.Header-pic{background:#fff; border-radius:8px; box-shadow: 0 0 5px #888888; padding:11px;}
section .margin{padding:18px 10px; margin:0 4px;}
section .margin p{font-weight:bold; margin:15px 0;}
section .margin p a{color:#0303ff; text-decoration:underline;}
section .margin p a:link{color:#0303ff; text-decoration:underline;}
section .margin p a:hover{color:#0303ff; text-decoration:none;}
section .margin span{float:left; clear:both; width:150px; line-height:18px; color:#676767 !important; font-weight:normal !important;}

section article{margin:20px 0px;}
section article .Form{
  border-bottom:1px solid #c8c8c8;
  padding-bottom:15px;
  margin:0 18px;
}
section article .Form h1{font-size:18px; text-transform:uppercase; font-style:italic; color:#4b4b4b; line-height:40px; text-align:center;}
section article .Form label{float:left; width:180px; text-align:left; font-size:12px; line-height:22px; color:#000;}
section article .Form input{background:#fff; width:250px; padding:0px 10px; height:22px;border:1px solid #CCCCCC; border-radius:3px; float:left;}
.Form-margin{padding:4px 0;}
/*.Form-margin .Checkbox-div{float:left; width:504px;}
*/
.Form-margin .Checkbox-div p{line-height:22px; font-size:11px;}
.Form-margin .Checkbox-div p input[type=checkbox] {
  float:left;
  width:16px;
  margin-right:5px;
  box-shadow:none !important;
  }
.Form-margin .Checkbox-div p a{
    background: #818181;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5a5a5', endColorstr='#818181');
    background: -webkit-gradient(linear, left top, left bottom, from(#a5a5a5), to(#818181));
    background: -moz-linear-gradient(top,  #a5a5a5,  #818181);
    font-family:Arial, Helvetica, sans-serif;
    font-size:13px;
    text-decoration:none;
    padding:5px 20px;
    color:#fff;
    border-radius:4px;
    border:1px solid #4a4a4a;
}
.Form-margin .Checkbox-div p a:link{
    background: #818181;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5a5a5', endColorstr='#818181');
    background: -webkit-gradient(linear, left top, left bottom, from(#a5a5a5), to(#818181));
    background: -moz-linear-gradient(top,  #a5a5a5,  #818181);
    font-family:Arial, Helvetica, sans-serif;
    font-size:13px;
    text-decoration:none;
    padding:5px 20px;
    color:#fff;
    border-radius:4px;
    border:1px solid #4a4a4a;
}
.Form-margin .Checkbox-div p a:hover{
    background: #818181;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#818181', endColorstr='#a5a5a5');
    background: -webkit-gradient(linear, left top, left bottom, from(#818181), to(#a5a5a5));
    background: -moz-linear-gradient(top,  #818181,  #a5a5a5);
    text-decoration:none;
    color:#fff;
}
article .Card_div{margin-top:15px;}
article .Card_div h2{color:#454545; font-family:Arial, Helvetica, sans-serif; font-size:18px; font-weight:bold; line-height:30px; text-align:center;}
article .Card_div p{line-height:20px; text-align:justify;}
article .Card_div ul{list-style:none; margin:0px 0; padding:20px 0 0;}
article .Card_div li{float:left; border:1px solid #ccc; width:199px; text-align:center;}
article .Card_div li h3{ font-family: tahoma,sans-serif;
    font-size: 14px;
    font-weight: normal;
    line-height: 30px;
    text-align: center;
    text-transform: uppercase;}
article .Card_div li h4{font-size:13px; font-weight:normal; text-align:center; line-height:30px; font-family:Tahoma,Geneva,sans-serif;}
/*article .Card_div li a{color:#755723; font-size:12px; text-decoration:underline; clear:both; text-align:center; padding-bottom:10px;}
article .Card_div li a:link{color:#755723; font-size:12px; text-decoration:underline; clear:both; text-align:center; padding-bottom:10px;}
article .Card_div li a:hover{color:#755723; text-decoration:none;}*/
article .Card_div img{text-align:center; clear:both; margin:10px 0;}


.Top-card{}
.Top-card-left{width:464px; float:right; border-left:1px solid #ccc;}
.Top-card-left .Center{text-align:center; padding:10px;}
.Top-card-right{float:left;}
.Top-card h3{font-family:tahoma, sans-serif; font-size:14px; font-weight:normal; text-transform:uppercase; text-align:center; line-height:30px;}
.Top-card .gray-div{float:left; width:130px; padding:8px; border:1px solid #e6e6e6; background:#f3f3f3;}
.Top-card .gray-div h6{font-family:Tahoma, Geneva, sans-serif; font-size:13px; color:#000; font-weight:normal; text-align:center; line-height:20px; min-height:40px;}

.Top-card .gray-div a{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold; text-transform:none;}
.Top-card .gray-div a:link{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;text-transform:none;}
.Top-card .gray-div a:hover{color:#b37f25; text-decoration:none;}

.Top-card-right .Center{text-align:center; padding:10px;}


.gray-div2{padding:5px; margin:5px 5px 10px 5px; border:1px solid #e6e6e6; background:#f3f3f3;}


.gray-div2 a{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;}
.gray-div2 a:link{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;}
.gray-div2 a:hover{color:#b37f25; text-decoration:none;}
.Bottom-list{border-top:1px solid #CCCCCC; width:800px;}
.Bottom-list .left{width:199px; float:left; text-align:center !important;}
.Bottom-list .right{float:right; width:600px; border-left:1px solid #ccc; text-align:center;}

.Bottom-list h3 {
    font-family: tahoma,sans-serif;
    font-size: 14px;
    font-weight: normal;
    line-height: 30px;
    text-align: center;
    text-transform: uppercase;
}
.Bottom-list img {
    clear: both !important;
    margin: 10px 0;
    text-align: center;
}

.Bottom-list .left .gray-div {
    background: none repeat scroll 0 0 #F3F3F3;
    border: 1px solid #E6E6E6;
    padding: 8px;
  margin:0 5px;
}
.Bottom-list .right .gray-div {
    background: none repeat scroll 0 0 #F3F3F3;
    border: 1px solid #E6E6E6;
    padding: 8px;
  float:left;
  width:101px;
}
.Bottom-list h6 {
    font-family: Tahoma,Geneva,sans-serif;
    font-size: 13px;
    font-weight: normal;
    text-align: center;
  min-height:68px;
}
.Bottom-list a{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;}
.Bottom-list a:link{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;}
.Bottom-list a:hover{color:#b37f25; text-decoration:none;}

.Top-card .gray-div3{float:left; width:139px; padding:8px; border:1px solid #e6e6e6; background:#f3f3f3;}

.Top-card .gray-div3 h6 {
    color: #000000;
    font-family: Tahoma,Geneva,sans-serif;
    font-size: 13px;
    font-weight: normal;
    line-height: 20px;
    min-height: 40px;
    text-align: center;
}

.Top-card .gray-div3 a{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold; text-transform:none;}
.Top-card .gray-div3 a:link{color:#b37f25; font-size:11px; text-decoration:underline; line-height:20px; font-family:Arial, Helvetica, sans-serif; font-weight:bold;text-transform:none;}
.Top-card .gray-div3 a:hover{color:#b37f25; text-decoration:none;}
/*-------------------------------------- Vacation Club Css ---------------------------------------------------------------------------*/
.Vacation{margin:10px 0px;}
.Vacation-Top{}
.Vacation-Top ul{list-style:none; margin:0; padding:0;}
.Vacation-Top li{line-height:18px; margin:5px 0 0 15px; list-style:disc;}
.Hotel-List{margin:10px 0;border:1px solid #a3a3a3;}
.Hotel-List h1{float:left; width:170px; text-align:center; line-height:35px; font-size:12px; font-weight:bold; background:#d9d9d9; border-left:1px solid #a3a3a3;}
.Table-div{border-top:1px solid #a3a3a3; min-height:26px; background:#f4f4f4;}
.Table-div ul{list-style:none; margin:0; padding:0;}
.Table-div li{float:left; width:170px; line-height:26px; border-left:1px solid #a3a3a3; text-align:center;}
.Vacation-Bottom-top{margin:20px 0;}
.Vacation-Bottom-top p{font-size:14px;line-height:26px !important; font-weight:bold; text-align:center !important; color:#9B6529 !important;}
.Vacation-Bottom-top p strong{font-weight:bold;}
.Vacation-Bottom-top p a{text-decoration:underline; color:#9B6529; font-size:14px;}
.Vacation-Bottom-top p a:link{text-decoration:underline; color:#9B6529; font-size:14px;}
.Vacation-Bottom-top p a:hover{text-decoration:none; color:#9B6529;}
.Term-condition{background:#fff; border-radius:5px; box-shadow:0px 0px 3px #888888;}
.Term-condition p{padding:10px; line-height:18px; text-align:justify;}
.Term-condition ul{list-style:none; margin:0; padding:0;}
.Term-condition li{list-style:disc; line-height:12px; margin:5px 10px 0 29px;font-size:11px;}
.Vacation-Bottom{}
.ie8 .Header-pic{background:#fff; border-radius:8px; border:1px solid #888888; padding:11px;}
.ie8 .Term-condition{background:#fff; border-radius:5px; border:1px solid #888888;}


hr{border:1px solid #ccc; margin:20px 0;}
.Dear{margin:0 15px;}
.Dear p{font-weight: bold;
    margin: 15px 0;
}
.Dear p.font{
    font-weight: normal !important;
}
.Dear p span{clear: both;
    color: #000 !important;
    float: left;
    font-weight: normal !important;
    line-height: 18px;
    /*width:280px;*/
}
.Dear p.font input{
    font-size: 12px !important;
    border:none;
    background:none; 
  font-family:font-family: 'Gotham Book' !important;
}
@font-face {
        font-family: "Gotham Book";
        src: url('768005372-Gotham-Book.eot');
        src: url('768005372-Gotham-Book.eot?#iefix') format('embedded-opentype'),
        url('768005372-Gotham-Book.svg#Gotham Book') format('svg'),
        url('768005372-Gotham-Book.woff') format('woff'),
        url('768005372-Gotham-Book.ttf') format('truetype');
        font-weight: normal;
        font-style: normal;
    }
</style>
</head>
<body>
  <div class="Layout-width">
      <div class="header">
           <div class="Header-pic1" align="center">
              <img src="images/referallogo-cc.jpg" alt="" style="border:0;"/>
            </div>
            
        </div>
               <div class="section">
          <div class="article Top_form_margin" style="margin:20px 0px;">
              <!-- Add On Content -->
                  <div class="Dear">
                      <p style="font-weight:bold !important;" class="font">Dear <input type="text" id="lbl" runat="server" style="width: 350px; font-family: 'arial' !important; font-size: 12px !important;font-weight:bold !important;"/></p>
                        <p class="font">Thank you for your interest in <strong style="font-weight:normal;">Velvet Club</strong>   !</p>
                        <p class="font">One of our Associates will call you within 24 hours on the given contact details.</p>
                        <p class="font">Thank you,</p>
                        <p class="font">                        
                           <span style="font-weight:bold !important;width:400px;">Team Velvet Club</span>
                           <br />
                           <br />
                    <span style="margin-bottom:6px;">Phone :+91 40 6681 5999 </span>
                    <span>E-mail  : <a href="mailto:velvetclub@tlcgroup.com">velvetclub@tlcgroup.com</a></span>
                </p>
                <div class="Clear"></div>
                    </div>
                <!-- Add On Content -->
                <hr/>
               <div class="Header-pic" style="">
                <img src="images/banner.jpg" width="100%" alt=''>
                </div>
            </div>
            <!-- Bottom Content Goes here -->
        </div>
    </div>
    <img src='http://a.tribalfusion.com/ti.ad?client=521983&ev=1' width='1' height='1' border='0'>
    <!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');

fbq('init', '1092257417490207');
fbq('track', "PageView");
fbq('track', 'ViewContent');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1092257417490207&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
</body>
</html>