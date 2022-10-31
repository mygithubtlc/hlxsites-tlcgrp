<%@ Page Language="VB" %>

<%@ Import Namespace="System.Net" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>

<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        'txtName.Focus()
        'Dim name As String = Request.QueryString("name")
        'Dim mobile As String = Request.QueryString("mobile")
        'Dim Email As String = Request.QueryString("Email")
        'If Not IsPostBack Then
        '    txtName.Text = name
        '    txtMobile.Text = mobile
        '    txtEmailID1.Text = Email
        'End If
        'txtEmail.Focus()
    End Sub
    Sub SendToBothEmail(ByVal sClientName As String, ByVal sClientEmail As String)
        Dim strRac As String = Request.QueryString("val")
        Try
            '-----------------User Email-------------------------------------------
            Dim Message As New Net.Mail.MailMessage()
            Dim mailID As String = sClientEmail
            Dim FromEmail As New Net.Mail.MailAddress("cath.parkhyatthyd@tlcgroup.com", "Club at the Hyatt ")
            Message.From = FromEmail
            Message.To.Add(New Net.Mail.MailAddress(mailID))
            Message.IsBodyHtml = True
            Message.Subject = "Thank You"
          
            Dim messageToSendUser As String = String.Empty
            messageToSendUser = "<!DOCTYPE>"
            messageToSendUser += "<html>"
            messageToSendUser += "<head>"
            messageToSendUser += "<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>"
            messageToSendUser += "<meta content='MSHTML 6.00.2800.1106' name='GENERATOR'>"
            messageToSendUser += "</head> "
            messageToSendUser += "<body> "
            messageToSendUser += "<div align='center'>	"
            messageToSendUser += "<table cellspacing='0' cellpadding='0' width='650' border='0'> "
            messageToSendUser += "<tr>	"
            messageToSendUser += "<td> "
            messageToSendUser += "<img src='http://tlc.in/tlc/landing_page/hyatt/images/hayatt_650.jpg' border='0' alt=''>"
            messageToSendUser += "</td>	  "
            messageToSendUser += "</tr>	"
            messageToSendUser += "<tr>	"
            messageToSendUser += "<td align='center' style='padding: 10px 0px 0px 0px;'>  "
            'messageToSendUser += "<img src=" + strLogoPath + " alt='' style='float: left'>	"
            messageToSendUser += "</td>													 "
            messageToSendUser += "</tr>"
            messageToSendUser += "<tr> "
            messageToSendUser += "<td colspan='' align='center'> "
            messageToSendUser += "<table cellspacing='0' cellpadding='0' width='650' border='0'> "
            messageToSendUser += "<tr>	"
            messageToSendUser += "<td colspan='3'>	"
            messageToSendUser += "<center>	"
            messageToSendUser += "<table cellspacing='0' cellpadding='8' border='0' width='650' style='font-size: 14px; text-align: justify;'>"
            messageToSendUser += "<tr> "
            messageToSendUser += "<td align='left'>	"
            messageToSendUser += "<font face='Arial, Helvetica, sans-serif'><b>Dear " & StrConv(sClientName.Trim, VbStrConv.ProperCase) & " " & StrConv(txtFamilyName.Text.Trim, VbStrConv.ProperCase) & ",</b>"
            messageToSendUser += "</font></td>	"
            messageToSendUser += "</tr>	"
            messageToSendUser += "<tr> "
            messageToSendUser += "<td style='text-align: justify'> "
            messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'><br />Thank you for your interest in <strong style='font-weight:normal;'>Club at the Hyatt</strong>."
            messageToSendUser += "</font>"
            messageToSendUser += "</td>	"
            messageToSendUser += "</tr>	"
            messageToSendUser += "<tr>	"
            messageToSendUser += "<td style='text-align: justify'> "
            messageToSendUser += "<font face='Arial, Helvetica, sans-serif'>One of our Associates will call you within 24 hours on the given contact details."
            messageToSendUser += "</font> "
            messageToSendUser += "</td>	 "
            messageToSendUser += "</tr>"            
            messageToSendUser += "<tr>"
            messageToSendUser += "<td style='text-align: justify'> "
            messageToSendUser += "<font face='Arial, Helvetica, sans-serif'>Thank you,<br />	"
            messageToSendUser += "<br /> "
            messageToSendUser += "<b>Team Club at the Hyatt   </b>"
            messageToSendUser += "<br>"
            messageToSendUser += "<br>"
            messageToSendUser += "Phone +91 40 6681 5999 "
            messageToSendUser += "<br>"
            messageToSendUser += "<br>"
            messageToSendUser += "E-mail <a href=""mailto:cath.parkhyatthyd@tlcgroup.com"">cath.parkhyatthyd@tlcgroup.com</a>"
            messageToSendUser += "</font> "
            messageToSendUser += "</table>"
            messageToSendUser += "</center>"
            messageToSendUser += "</td>	"
            messageToSendUser += "</tr>	"
            messageToSendUser += "</table>"
            messageToSendUser += "<br>"
            messageToSendUser += "<table cellspacing='8' cellpadding='0' border='0' width='650'>"
            messageToSendUser += "<tr> "
            messageToSendUser += "<td style='TEXT-ALIGN: justify; font-size: 10px;' align='justify' width='650'>"
            messageToSendUser += "<p align='justify' style='font-size: 10px;padding-left:10px;'>	"
            messageToSendUser += "<font face='arial' color='#4d4d4d'>"
            messageToSendUser += "<b>Disclaimer</b><br>	 "
            messageToSendUser += "This message is intended solely for the addressee. If you are not the intended recipient, please delete this email and inform the Sender immediately. This message is not guaranteed to be complete or error free and no liability is assumed for any errors and / or omissions in the contents of this message.</font>"
            messageToSendUser += "</p> "
            messageToSendUser += "</td>	"
            messageToSendUser += "</tr>	"
            messageToSendUser += "</table>	 "
            messageToSendUser += "</center></td> "
            messageToSendUser += "</tr>"
            messageToSendUser += "</table> "
            messageToSendUser += "</td>	"
            messageToSendUser += "</tr>	"
            messageToSendUser += "</table> "
            messageToSendUser += "</div> "
            messageToSendUser += "</body> "
            messageToSendUser += "</html>  "
            Message.Body = messageToSendUser
         
            '----------------------------------------------------------------------            
           
            '-----------------TLC Email-------------------------------------------
  
            Dim TLCMessage As New Net.Mail.MailMessage()
            Dim TLCmailID As String = "cath.parkhyatthyd@tlcgroup.com" ' tlc Email id 
            ''TLCmailID="shailendra@tlcgroup.com"
            Dim TLCFromEmail As New Net.Mail.MailAddress("cath.parkhyatthyd@tlcgroup.com", "Club at the Hyatt ")
            TLCMessage.From = TLCFromEmail
            TLCMessage.To.Add(New Net.Mail.MailAddress(TLCmailID))
            
            TLCMessage.CC.Add(New Net.Mail.MailAddress("rayees.khan@tlcgroup.com", "rayees.khan@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("mohammed.afzal@tlcgroup.com", "mohammed.afzal@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("digitaloffice@tlcgroup.com", "digitaloffice@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("kamini.sharma@tlcgroup.com", "kamini.sharma@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("drops@tlcgroup.com", "drops@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("shailendra@tlcgroup.com", "shailendra@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("sonal.sharma@tlcgroup.com", "sonal.sharma@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("poonam@tlcgroup.com", "poonam@tlcgroup.com"))
            
            TLCMessage.IsBodyHtml = True
            
            TLCMessage.Subject = "Request a call " + "-" + "  Park Hyatt Hyderabad"
            Dim TLCstr As String = String.Empty
            
            TLCstr = "  <head>"
            TLCstr &= "<title>Thank You</title>"
            TLCstr &= "<style type=text/css'>"
            TLCstr &= ".auto-style1 {"
            TLCstr &= "width: 246px;"
            TLCstr &= "}"
            TLCstr &= "</style>"
            TLCstr &= "</head>"
            TLCstr &= "<body>"
            TLCstr &= "<table border='1' width='500px'>"
            TLCstr &= "<tr style='text-align:center; line-height:26px;'><td colspan='2'><strong>Following profile is interested to know more details about your program. <br />Please contact him / her on below given details </strong></td> </tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>For Property"
            TLCstr &= "</td>"
            TLCstr &= " <td class='auto-style1'> Park Hyatt Hyderabad"
            TLCstr &= "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>Name"
            TLCstr &= "</td>"
            TLCstr &= " <td class='auto-style1'>" & txtName.Text
            TLCstr &= "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>Last Name"
            TLCstr &= "</td>"
            TLCstr &= " <td class='auto-style1'>" & txtFamilyName.Text
            TLCstr &= "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>Email</td>"
            TLCstr &= "<td class='auto-style1'>" & txtEmailID1.Text & "</td>"
            TLCstr &= "</tr>"
            'TLCstr &= "<tr>"
            'TLCstr &= "<td>Telephone Number</td>"
            'TLCstr &= " <td class='auto-style1'>" & txtStdCode.Text & "-" & txtDayTimeTelePhone.Text & "</td>"
            'TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>Mobile</td>"
            TLCstr &= "<td class='auto-style1'>" & txtMobile.Text & "</td>"
            TLCstr &= "</tr>"
            
            If Not IsNothing(strRac) Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>" & strRac.Trim() & "</td>"
                TLCstr &= "</tr>"
            End If
            
            TLCstr &= "<tr>"
            TLCstr &= "<td>Internet details</td>"
            TLCstr &= "<td class='auto-style1'>" & Request.ServerVariables("REMOTE_ADDR") & " - " & DateTime.Now.Date.ToString("dd MMM yyyy") & " & " & DateTime.Now.TimeOfDay.Hours.ToString() & ":" & DateTime.Now.TimeOfDay.Minutes.ToString() & "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "</table>"
            TLCstr &= "<br />"
            TLCstr &= "<b>Team Club at the Hyatt  </b>   <br /><br />"
            TLCstr &= "Note: This e-mail is automatically generated by our system on above profile contact request. "
            TLCstr &= "</body>"
            TLCstr &= "</html>"
            TLCMessage.Body = TLCstr
            
            Dim SmtpTLCClient As New Net.Mail.SmtpClient()
            SmtpTLCClient.EnableSsl = False
            SmtpTLCClient.UseDefaultCredentials = False
            SmtpTLCClient.Credentials = New Net.NetworkCredential("mail@tlc.in", "tlcgroup")
            SmtpTLCClient.Host = "smtpauth.tlc.in"
            SmtpTLCClient.Port = 587
             SmtpTLCClient.Send(TLCMessage)
            SmtpTLCClient.Send(Message)
           
            SmtpTLCClient = Nothing
            
            ''DropDetailsToDatabase for insert website details in database
            Dim strSubject As String = "Request a call " + "-" + "  Park Hyatt Hyderabad"
            Dim strProperty As String = "Park Hyatt Hyderabad"
            Dim strSource As String = String.Empty
            If Not IsNothing(strRac) Then
                strSource = strRac.Trim()
            
            End If
            
            Dim strHostName As String = System.Net.Dns.GetHostName()
            Dim strIPAddress As String = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()
            Dim strUrl As String = "http://tlc.in/postpack/UserInformation.aspx?" + "Property=" + strProperty + "&FirstName=" + txtName.Text.Trim() + "&LastName=" + txtFamilyName.Text.Trim() + "&Mobile=" + txtMobile.Text.Trim() + "&Email=" + txtEmailID1.Text.Trim() + "&IPAddress=" + strIPAddress + "&DropSubject=" + strSubject + "&Source=" + strSource.Trim()

            Dim myWebClient = New WebClient()
            Dim resultStr As String = myWebClient.DownloadString(strUrl)

            ''
            
        Catch ex As Exception
            Response.Write("Check SMTP server. Please Contact with Admin")
        End Try
    End Sub
    Protected Sub btnSUbmit_Click(sender As Object, e As EventArgs)
        If Page.IsValid Then
            Dim name As String = txtName.Text
            SendToBothEmail(txtName.Text.Trim, txtEmailID1.Text.Trim)
			
            Response.Redirect("Thankyou.aspx?name=" & Convert.ToString(Me.txtName.Text.Trim) & "&lname=" & Convert.ToString(Me.txtFamilyName.Text.Trim) & "")
            
        End If
        
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Request A Call</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/0dd1e4698e.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">

<!--[if IE 8 ]> <html class="ie8"> <![endif]-->
    <script type="text/javascript">
        function ltrim(str) {
            return str.replace(/^\s+/g, '');
        }
        function rtrim(str) {
            return str.replace(/\s+$/g, '');
        }
        function trimStr(str) {
            return str.replace(/^\s+|\s+$/g, '');
        }

        function isnumeric(evt)  // Key Press
        {
            var charCode = (evt.which) ? evt.which : event.keyCode;

            if ((charCode == 46 || charCode == 8 || charCode == 45 || charCode == 47) || (charCode >= 48 && charCode <= 57))
            { return true; }
            else { return false; }
        }

        function isNameAlphabet(evt) //alphabets Key Press
        {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode == 8) // Backspace
            { return true; }
            if (charCode == 32)
            { return true; }
            if (charCode == 39)
            { return true; }

            if (charCode > 31 && (charCode < 91 && charCode > 64))       //for alphabets
                return true;

            if (charCode > 31 && (charCode < 123 && charCode > 96))      // for alphabets
            { return true; }
            return false;
            return false;
        }
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert("Please Enter Only Numeric Value:");
                return false;
            }

            return true;
        }
        function isemailAlphanumeric(evt) //alphanumeric validations Key Press
        {
            var charCode = (evt.which) ? evt.which : event.keyCode

            if (charCode == 64 || charCode == 46 || charCode == 95 || charCode == 45)
            { return true; }

            if (charCode > 31 && (charCode < 91 && charCode > 64))      // for alphabets
            {

                return true;
            }
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                if (charCode > 31 && (charCode < 123 && charCode > 96))      // for alphanumeric validations
                { return true; }

                return false;
            }
            return true;
            return true;

        }
        function validatecharacter(strCh)		// w3school.com
        {
            var pattern = /^([a-zA-Z])+/;
            if (pattern.test(strCh)) {
                return true;
            } else {
                return false;
            }
        }

        function Validate() {

          
            name = document.getElementById('txtName');
            if (name.value == "") {
                alert('Please enter your first name.');
                name.focus();
                return false;
            }
           
            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtName').value;
            if (namelength.length == 0) {
                alert('Please enter your first name.');
                document.getElementById('txtName').focus();
                return false;
            }
            if (!validatecharacter(namelength)) {
                alert('Please enter a vaild Character.');
                document.getElementById('txtName').focus();
                return false;
            }

            name = document.getElementById('txtFamilyName');
            if (name.value == "") {
                alert('Please enter your Last Name.');
                name.focus();
                return false;
            }

            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtFamilyName').value;
            if (namelength.length == 0) {
                alert('Please enter your Last Name.');
                document.getElementById('txtFamilyName').focus();
                return false;
            }
            if (!validatecharacter(namelength)) {
                alert('Please enter a vaild Character.');
                document.getElementById('txtFamilyName').focus();
                return false;
            }


            //dayTimePhone = document.getElementById('txtDayTimeTelePhone');
            //stdcode = document.getElementById('txtStdCode');


            //if (stdcode.value == "") {
            //    alert('Please enter area Code.');
            //    stdcode.focus();
            //    return false;

            //}
            //if (dayTimePhone.value == "") {
            //    alert('Please enter your DayTime Telephone.');
            //    dayTimePhone.focus();
            //    return false;
            //}

            //if ((stdcode.value.length) + (dayTimePhone.value.length) <= 8) {
            //    alert('Please enter a valid DayTime Telephone.');
            //    document.getElementById('txtDayTimeTelePhone').focus();
            //    return false;
            //}

           


         
            //dayTimePhone = document.getElementById('txtDayTimeTelePhone');
            //stdcode = document.getElementById('txtStdCode');


            //if (dayTimePhone.value == "") {
            //    alert('Please enter your Telephone Number.');
            //    dayTimePhone.focus();
            //    return false;
            //}
            ////  When telephone have value but Std code is blank
            //if (dayTimePhone.value != "") {

            //    if (dayTimePhone.value.length < 8) {
            //        alert('Please enter a valid Telephone Number.');
            //        document.getElementById('txtDayTimeTelePhone').focus();
            //        return false;
            //    }
            //    stdcode = document.getElementById('txtStdCode');
            //    if (stdcode.value == "") {
            //        alert('Please enter STD Code.');
            //        document.getElementById('txtStdCode').focus();
            //        return false;
            //    }
            //    if (stdcode.value.length <= 1) {
            //        alert('Please enter a valid STD Code.');
            //        document.getElementById('txtStdCode').focus();
            //        return false;
            //    }
              


            //}

           // When  Std code have value but telephone number is blank
            //dayTimePhone = document.getElementById('txtDayTimeTelePhone');
            //stdcode = document.getElementById('txtStdCode');

            //if (stdcode.value != "") {
            //    daytime = document.getElementById('txtDayTimeTelePhone');

            //    if (stdcode.value.length <= 1) {
            //        alert('Please enter correct STD Code.');
            //        document.getElementById('txtStdCode').focus();
            //        return false;
            //    }

            //    if (daytime.value == "") {
            //        alert('Please enter your Telephone Number.');
            //        document.getElementById('txtDayTimeTelePhone').focus();
            //        return false;
            //    }
            //    if (dayTimePhone.value.length < 8) {
            //        alert('Please enter a valid Telephone Number.');
            //        document.getElementById('txtDayTimeTelePhone').focus();
            //        return false;
            //    }

            //}
            //Primary Email & Retype Email
            email = document.getElementById('txtEmailID1');
            if (email.value == "") {
                alert('Please enter your E-mail Id.');
                email.focus();
                return false;
            }
            //check for Valid Primary Email ID
            if (email.value != "") {
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if (reg.test(email.value) == false) {
                    alert('Please enter a valid E-mail Id.');
                    email.focus();
                    return false;
                }
            }
            //Mobile And Telephone Number
            Mobile = document.getElementById('txtMobile');
            if (Mobile.value == "") {
                alert('Please enter your Mobile Number.');
                Mobile.focus();
                return false;
            }

            if (Mobile.value != "") {
                //var reg = /^\d{12}$/;
                //var reg =^[1-9][0-9]{9}$;

                //if (reg.test(Mobile.value) == false) {
                //    alert('Please enter your valid Mobile Number.');
                //    Mobile.focus();
                //    return false;
                //}
                if (Mobile.value.length >= 10) {

                }
                else {
                    alert('Please enter your valid Mobile Number.');
                    Mobile.focus();
                    return false;
                }

            }

            //if (dayTimePhone.value != "") {
            //    var reg = /^\d+$/;
            //    if (reg.test(dayTimePhone.value) == false) {
            //        alert('Please enter a valid Telephone Number.');
            //        dayTimePhone.focus();
            //        return false;
            //    }
            //}

           
           // check for Retpye Email ID is blank
           // email1 = document.getElementById('txtEmail');
            //if (email1.value == "") {
            //    alert('Please Retype your Email Id.');
            //    email1.focus();
            //    return false;
            //}
            //check for Valid Retype  Email ID
            //if (email1.value != "") {
            //    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            //    if (reg.test(email1.value) == false) {
            //        alert('Please Retype your Email Id.');
            //        email1.focus();
            //        return false;
            //    }
            //}
            //check for  Email ID is mismatch
            //if (trimStr(email1.value.toLowerCase()) != trimStr(email.value.toLowerCase())) {
            //    alert("Email Id Mismatch, Please Retype your Email Id.");
            //    email1.focus();
            //    return false;
            //}

           
            // Check  for checbox
            //var c = document.getElementsByTagName('input');
            //for (var i = 0; i < c.length; i++) {
            //    if (c[i].type == 'checkbox' && c[i].checked == true) {
            //        // At least one checkbox IS checked       
            //        return true;
            //    }
            //}
            //// Nothing has been checked   
            //alert("Please accept Terms & Conditions.");
            //return false;
          
        }
    </script>
</head>
<body>
        <form id="Form1" runat="server" >

            <div class="container">
    
    <!-- header -->
      <div class="row marketing">
        <div class="col-md-12"><p>Welcome to CLUB AT THE HYATT, the preferred lifestyle program of Park Hyatt Hyderabad</p></div>
      </div>
      <!-- logo -->
      <div class="logo-detail">
        <div class="row">
          <div class="row">
              <div class="col-md-6 col-xs-6" style="width:50%; float:left;"><img src="images/haytt_logo.jpg" class="img-responsive" align="left"></div>
              <div class="col-md-6 col-xs-6" style="width:50%; padding:35px 13px 35px 0;"><img src="images/haytt_hyd.jpg" class="img-responsive pull-right"></div>
          </div>
      </div>
      </div>
      <!-- logo detail -->
    

    
        <!-- simple registration form -->

        <div class="simple-regist-form">
           
                  <div class="form-group">
                    <p>Simply register your details and our Associates will be in touch with you shortly.</p>
                    <label for="exampleInputEmail1">First Name</label>
                   <asp:TextBox ID="txtName" class="form-control" runat="server" placeholder="First name" MaxLength="50" TabIndex ="1" onkeypress="return isNameAlphabet(event);"></asp:TextBox>
                  </div>

                  <div class="form-group">
                    <label for="exampleInputEmail1">Last Name</label>
                    <asp:TextBox ID="txtFamilyName" class="form-control" runat="server" placeholder="Last Name" MaxLength="50" TabIndex ="2" onkeypress="return isNameAlphabet(event);"></asp:TextBox>
                  </div>

                   <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                    <asp:TextBox ID="txtEmailID1" class="form-control" TabIndex ="3" runat="server" placeholder="Email" onkeypress="return isemailAlphanumeric(event);"></asp:TextBox>
                  </div>

                  <div class="form-group">
                    <label for="exampleInputEmail1">Mobile Number</label>
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Mobile Number" MaxLength="10" TabIndex ="4"  onkeypress="return isNumberKey(event);"></asp:TextBox>
                  </div>
                   
                <asp:Button ID="Button1" runat="server" class="btn btn-danger pull-right" Text="I am interested" OnClick="btnSubmit_Click" OnClientClick="javascript:return Validate();" />
                  <%--<button type="submit" class="btn btn-danger pull-right">I am interested</button>--%>
            
        <div class="footer-detail">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <small>Privacy Policy <br>The information provided by you will be used as per our Privacy Policy detailed at <a href="http://www.privacypolicy.co.in/">www.privacypolicy.co.in</a></small><br>
              <small>* Terms & Conditions apply</small>              
            </div>
          </div>
        </div>
        </div>

    </div>

         </form>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-5120064-7']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>
<img src='http://a.tribalfusion.com/i.cid?c=521983&d=30&page=landingPage' width='1' height='1' border='0'>
</body>
</html>

