﻿<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            If Request.QueryString("name") = Nothing Then
                lbl.Text = "Guest,"
            Else
                lbl.Text = StrConv(Request.QueryString("name") & ",", VbStrConv.ProperCase)
            End If
            'If Request.QueryString("familyName") = Nothing Then
            '    lbl.Text += ""
            'Else
            '    lbl.Text += StrConv(Request.QueryString("familyName") & ",", VbStrConv.ProperCase)
            'End If
        End If
    End Sub
</script>

<html lang="en">
<head>
<title>Thank You</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
  <link rel="icon" href="https://www.hotelmemberships.com/app/uploads/2017/10/icon.png" sizes="32x32" />
<link rel="icon" href="https://www.hotelmemberships.com/app/uploads/2017/10/icon.png" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="https://www.hotelmemberships.com/app/uploads/2017/10/icon.png" />

</head>
<body>

<div style="max-width:650px;" class="thankyou-cont">
  <div class="sub-bg">
    <div class="row">
      <div class="col-md-12"> 
      <div class="logo-landing">
      <img src="https://hotelmemberships.com/app/themes/hm-v03/assets/images/logo.png" class="img-responsive"> 
      </div>
      </div>
    </div>
  </div>

    <div class="row thankyou-body">
      <div class="col-md-12">
        <p><b>Dear
          <asp:Label ID="lbl" ForeColor="black" runat="server"/>
          </b></p>
        <p>Thank you for dropping your details and showing interest in a membership from a luxury hotel. Our Membership Specialist will call you within 24 working hours on the given contact details to help you get the best membership near you.</p>
        <p>For more details on the membership you may write to us at <a href="mailto:care@hyattdiningclub.com" style="color:#000;">care@hyattdiningclub.com</a>.</p>

        <%--<br />Website: <a href="http://clubmarriott.in/" style="color:#ffffff !important;">www.clubmarriott.in</a>--%>
        <p>Thank you,<br>
          <br>
          <b>Team Hotel Memberships</b><br>On behalf of Hyatt Dining Club<br>
          Phone: <a href="tel:1800 572 9000" style="color:#000 !important;">1800 572 9000</a><br>
          Email: <a href="mailto:care@hyattdiningclub.com" style="color:#000;"> care@hyattdiningclub.com </a></p>
      </div>
    </div>

  <div class="footer-cont"> <a href="http://www.hotelmemberships.com" target="_blank">Website</a><span> | </span><a href="https://hotelmemberships.com/privacy-policy/" target="_blank">Privacy Policy</a>
    <p>&copy; 2020 TLC<sup>&reg;</sup> Relationship Management Pvt. Ltd. All Rights Reserved.</p>
    <div class="thankyou-social">
      <ul>
        <li class="i-facebook"> <a href="https://www.facebook.com/hotelmemberships" target="_blank"></a> </li>
        <li class="i-twitter"> <a href="https://twitter.com/HotelMembership" target="_blank"></a> </li>
        <li class="i-whatsapp"> <a href="https://api.whatsapp.com/send?phone=+919650910000" target="_blank"></a> </li>
      </ul>
    </div>
  </div>
</div>
<img src='http://a.tribalfusion.com/ti.ad?client=521983&ev=1' width='1' height='1' border='0'> 
<!-- Facebook Pixel Code --> 
<script>
    !function (f, b, e, v, n, t, s) {
        if (f.fbq) return; n = f.fbq = function () {
            n.callMethod ?
            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
        }; if (!f._fbq) f._fbq = n;
        n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0;
        t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s)
    }(window,
    document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '1092257417490207');
    fbq('track', "PageView");
    fbq('track', 'ViewContent');
</script>
<noscript>
<img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1092257417490207&ev=PageView&noscript=1"
/>
</noscript>
<!-- End Facebook Pixel Code -->
    <script type="text/javascript">
        window.setTimeout(function () {
            debugger;
            //var url = "www.hotelmemberships.com";

            window.location.href = "https://www.hotelmemberships.com";
        }, 50000);
    </script>

</body>
</html>