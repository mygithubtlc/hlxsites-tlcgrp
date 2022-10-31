<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net.Mime" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Net.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE html>
<script runat="server">
Dim strPath1 As [String] = String.Empty
Dim strPath2 As [String] = String.Empty
Dim dv As New DataView()
Dim strEmailaddress As String = String.Empty
Dim strHelpdeskNo As String = String.Empty
Dim strProgramManager As String = String.Empty
Dim strHotelValue As String = String.Empty
Dim strHotelName As String = String.Empty
Dim strBenefitUrl As String = String.Empty
Dim tblxml As New DataTable("Hotel")
Protected Sub Page_Load(sender As Object, e As EventArgs)
'txtName.Focus()
Dim name As String = Request.QueryString("name")
Dim mobile As String = Request.QueryString("mobile")
Dim Email As String = Request.QueryString("Email")
If Not IsPostBack Then
txtName.Text = name
''txtLandline.Text = familyname
txtMobile.Text = mobile
txtEmailID1.Text = Email
End If
'txtEmail.Focus()
'If Not IsNothing(Request.QueryString("htl")) Then
'    strHotelValue = Request.QueryString("htl")
'    Session("strHotelValue") = strHotelValue
'    ' LoadCMHotelXML(strHotelValue)
'    txtCity.Text = strHotelName
'End If
End Sub
Public Sub LoadCMHotelXML(sHotel As String)
Try
Dim filePath As String = Server.MapPath("cmhotel.xml")
tblxml.Columns.Add("HID", GetType(System.String))
tblxml.Columns.Add("Name", GetType(System.String))
tblxml.Columns.Add("PropertyCode", GetType(System.String))
tblxml.Columns.Add("EmailLogoPath", GetType(System.String))
tblxml.Columns.Add("HotelWebsite", GetType(System.String))
tblxml.Columns.Add("EmailAddress", GetType(System.String))
tblxml.Columns.Add("HelpdeskNo", GetType(System.String))
tblxml.Columns.Add("ProgramManagerAddress", GetType(System.String))
'tblxml.Columns.Add("Benefitesurl", GetType(System.String))
tblxml.ReadXml(filePath)
dv.Table = tblxml
dv.RowFilter = "HID ='" + sHotel + "'"
strHotelName = DirectCast(dv(0)("Name"), String)
strPath1 = DirectCast(dv(0)("EmailLogoPath"), String)
strPath2 = DirectCast(dv(0)("HotelWebsite"), String)
strHelpdeskNo = DirectCast(dv(0)("HelpdeskNo"), String)
strEmailaddress = DirectCast(dv(0)("EmailAddress"), String)
strProgramManager = DirectCast(dv(0)("ProgramManagerAddress"), String)
'strProgramManager = DirectCast(dv(0)("Benefitesurl"), String)
Catch ex As Exception
Throw New Exception(ex.Message)
End Try
End Sub
Sub SendToBothEmail(ByVal sClientName As String, ByVal sClientEmail As String)
Dim strRac As String = Request.QueryString("val")
Try

'-----------------User Email-------------------------------------------
Dim Message As New Net.Mail.MailMessage()
Dim mailID As String = sClientEmail
Dim FromEmail As New Net.Mail.MailAddress("care@hyattdiningclub.com", "Hyatt Dining Club")
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
        messageToSendUser += "<div align='center'>  "
            messageToSendUser += "<table cellspacing='0' cellpadding='0' width='610' border='0'> "
                messageToSendUser += "<tr>  "
                    messageToSendUser += "<td align='center' style='padding: 10px 0px 0px 0px;'>  "
                        'messageToSendUser += "<img src=" + strLogoPath + " alt='' style='float: left'> "
                    messageToSendUser += "</td>                                                  "
                messageToSendUser += "</tr>"
                messageToSendUser += "<tr> "
                    messageToSendUser += "<td colspan='' align='center'> "
                        messageToSendUser += "<table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#FFF' style='color:#000;'> "
                            messageToSendUser &= "<tr>"
                                messageToSendUser &= "<td align='center' width='600'>"
                                    messageToSendUser &= "<a href='https://www.hyattdiningclub.com/' target='_blank'><img src='https://tlcgroup.com/tlc/landing_page/HDC/HyattCentricCandolimGoa/images/logo.png' style='width:'200' border='0' alt=''></a>"
                                messageToSendUser &= "</td>"
                            messageToSendUser &= "</tr>"
                            messageToSendUser += "<tr>"
                                messageToSendUser += "<td style='padding-top:20px;' align='center' colspan='2'>"
                                    messageToSendUser &= "<img src='https://tlcgroup.com/tlc/landing_page/HDC/HyattCentricCandolimGoa/images/Header.jpg' style='width:'600' border='0' alt=''>"
                                messageToSendUser &= "</td>"
                            messageToSendUser &= "</tr>"
                            messageToSendUser &= "<tr>"
                                messageToSendUser &= "<td colspan='3'>"
                                    messageToSendUser &= "<center>"
                                    messageToSendUser &= "<table cellspacing='0' cellpadding='0' border='0' width='650' style='font-size: 14px; text-align: justify;'>"
                                        messageToSendUser &= "<tr>"
                                            messageToSendUser &= "<td align='left' style='color:#000;'>"
                                                messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'><br><b>Dear " & StrConv(sClientName.Trim, VbStrConv.ProperCase) & ","
                                            messageToSendUser &= "</font></td>"
                                        messageToSendUser &= "</tr>"
                                        messageToSendUser &= "<tr>"
                                            messageToSendUser &= "<td style='text-align: justify;color:#000; padding-top: 15px;'>"
                                                messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'>Thank you for your interest in Hyatt Dining Club."
                                                messageToSendUser &= "</font>"
                                            messageToSendUser &= "</td>"
                                        messageToSendUser &= "</tr>"
                                        messageToSendUser &= "<tr>"
                                            messageToSendUser &= "<td style='text-align: justify;color:#000; padding-top: 15px;'>"
                                                messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'>One of our Associates will call you within 24 working hours on the given contact details."
                                                messageToSendUser &= "</font> "
                                            messageToSendUser &= "</td>"
                                        messageToSendUser &= "</tr>"
                                        messageToSendUser &= "<tr>"
                                            messageToSendUser &= "<td style='text-align: justify;color:#000; padding-top: 15px;'>"
                                                messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'>We look forward to welcoming you to our hotels."
                                                messageToSendUser &= "</font> "
                                            messageToSendUser &= "</td>"
                                        messageToSendUser &= "</tr> "
                                        messageToSendUser &= "<tr>   "
                                            messageToSendUser &= "<td style='text-align: justify;color:#000; padding-top: 15px;'>"
                                                messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'>Thank you,<br />"
                                                messageToSendUser &= "<br />"
                                                messageToSendUser &= "<b>Team Hyatt Dining Club</b>"
                                                messageToSendUser &= "<br>"
                                                messageToSendUser &= "<br>"
                                                messageToSendUser &= "Phone: 1800 572 9000"
                                                
                                                messageToSendUser &= "<br>"
                                                messageToSendUser &= "Email: <a href='mailto:care@hyattdiningclub.com' style='color:#000; text-decoration:none;'>care@hyattdiningclub.com</a>"
                                                messageToSendUser &= "</font>"
                                            messageToSendUser &= "</table>"
                                            messageToSendUser &= "</center>"
                                        messageToSendUser &= "</td>"
                                    messageToSendUser &= "</tr>"
                                messageToSendUser &= "</table>"
                                messageToSendUser &= "<table cellspacing='0' cellpadding='0' border='0' width='650' bgcolor='#FFF' style='color:#000;'>"
                                    messageToSendUser &= "<tr> "
                                        messageToSendUser &= "<td style='TEXT-ALIGN: justify; font-size: 10px;' align='justify' width='600'>"
                                            messageToSendUser &= "<p align='justify' style='font-size: 10px;color:#000;'>   "
                                                messageToSendUser &= "<font face='arial'>"
                                                messageToSendUser &= "<br><b>Disclaimer</b><br>  "
                                                messageToSendUser &= "This message is intended solely for the addressee. If you are not the intended recipient, please delete this email and inform the Sender immediately. This message is not guaranteed to be complete or error free and no liability is assumed for any errors and / or omissions in the contents of this message.</font>"
                                            messageToSendUser &= "</p>"
                                        messageToSendUser &= "</td>"
                                    messageToSendUser &= "</tr>"
                                messageToSendUser &= "</table>"
                            messageToSendUser &= "</center></td>"
                        messageToSendUser &= "</tr>"
                    messageToSendUser &= "</table> "
                messageToSendUser &= "</td>"
            messageToSendUser &= "</tr>"
        messageToSendUser &= "</table>"
    messageToSendUser &= "</div>"
messageToSendUser &= "</body>"
messageToSendUser &= "</html>"
Message.Body = messageToSendUser
'----------------------------------------------------------------------
'-----------------TLC Email-------------------------------------------
Dim TLCMessage As New Net.Mail.MailMessage()
Dim TLCmailID As String = "care@hyattdiningclub.com" ' tlc Email id

Dim TLCFromEmail As New Net.Mail.MailAddress("care@hyattdiningclub.com", "Hyatt Dining Club")
TLCMessage.From = TLCFromEmail
TLCMessage.To.Add(New Net.Mail.MailAddress(TLCmailID))

TLCMessage.CC.Add(New Net.Mail.MailAddress("kamini.sharma@tlcgroup.com", "kamini.sharma@tlcgroup.com"))

TLCMessage.CC.Add(New Net.Mail.MailAddress("krishna.adhikari@tlcgroup.com", "krishna.adhikari@tlcgroup.com"))
TLCMessage.CC.Add(New Net.Mail.MailAddress("vijay.bisht@tlcgroup.com", "vijay.bisht@tlcgroup.com"))
TLCMessage.CC.Add(New Net.Mail.MailAddress("drops@tlcgroup.com", "drops@tlcgroup.com"))
TLCMessage.CC.Add(New Net.Mail.MailAddress("priyanka.titus@tlcgroup.com", "priyanka.titus@tlcgroup.com"))
TLCMessage.CC.Add(New Net.Mail.MailAddress("poonam.sareen@tlcgroup.com", "poonam.sareen@tlcgroup.com"))


TLCMessage.IsBodyHtml = True
TLCMessage.Subject = "Hyatt Dining Club - Request A Call - Hyatt Regency Thrissur"
Dim TLCstr As String = " "

TLCstr = " <head>"
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
        TLCstr &= " <td class='auto-style1'>Hyatt Regency Thrissur"
        TLCstr &= "</td>"
        TLCstr &= "<tr>"
            TLCstr &= "<td>Name"
            TLCstr &= "</td>"
            TLCstr &= " <td class='auto-style1'>" & txtName.Text
            TLCstr &= "</td>"
        TLCstr &= "</tr>"
        'TLCstr &= "<tr>"
            'TLCstr &= "<td>Last Name"
            'TLCstr &= "</td>"
            'TLCstr &= " <td class='auto-style1'>" & txtLandline.Text
            'TLCstr &= "</td>"
        'TLCstr &= "</tr>"
        TLCstr &= "<tr>"
            TLCstr &= "<td>Email</td>"
            TLCstr &= "<td class='auto-style1'>" & txtEmailID1.Text & "</td>"
        TLCstr &= "</tr>"
        TLCstr &= "<tr>"
            TLCstr &= "<td>Mobile</td>"
            TLCstr &= "<td class='auto-style1'>" & txtMobile.Text & "</td>"
        TLCstr &= "</tr>"
        
        'TLCstr &= "<tr>"
            'TLCstr &= "<td>Hotel Name</td>"
            'TLCstr &= "<td class='auto-style1'> " & txtCity.Text & "</td>"
        'TLCstr &= "</tr>"
        
        TLCstr &= "<tr>"
            TLCstr &= "<td>Internet details</td>"
            TLCstr &= "<td class='auto-style1'>" & Request.ServerVariables("REMOTE_ADDR") & " - " & DateTime.Now.Date.ToString("dd MMM yyyy") & " & " & DateTime.Now.TimeOfDay.Hours.ToString() & ":" & DateTime.Now.TimeOfDay.Minutes.ToString() & "</td>"
        TLCstr &= "</tr>"
        If strRac = "1" Then
        TLCstr &= "<tr>"
            TLCstr &= "<td>Source</td>"
            TLCstr &= "<td class='auto-style1'>Hyatt Dining Club Mailer – October 2020</td>"
        TLCstr &= "</tr>"
        End If
        If strRac = "2" Then
        TLCstr &= "<tr>"
            TLCstr &= "<td>Source</td>"
            TLCstr &= "<td class='auto-style1'></td>"
        TLCstr &= "</tr>"
        End If
        If strRac = "3" Then
        TLCstr &= "<tr>"
            TLCstr &= "<td>Source</td>"
            TLCstr &= "<td class='auto-style1'></td>"
        TLCstr &= "</tr>"
        End If
        If strRac = "4" Then
        TLCstr &= "<tr>"
            TLCstr &= "<td>Source</td>"
            TLCstr &= "<td class='auto-style1'></td>"
        TLCstr &= "</tr>"
        End If
        If strRac = "5" Then
        TLCstr &= "<tr>"
            TLCstr &= "<td>Source</td>"
            TLCstr &= "<td class='auto-style1'></td>"
        TLCstr &= "</tr>"
        End If
        TLCstr &= "<tr>"
            TLCstr &= "<td>&nbsp; &nbsp;</td>"
            TLCstr &= "<td class='auto-style1'>&nbsp; &nbsp;</td>"
        TLCstr &= " </tr>"
    TLCstr &= "</table>"
    TLCstr &= "<br />"
    TLCstr &= "Team Hyatt Dining Club<br /><br />"
    TLCstr &= "Note: This e-mail is automatically generated by our system on above profile contact request. "
TLCstr &= "</body>"
TLCstr &= "</html>"
TLCMessage.Body = TLCstr
Dim SmtpTLCClient As New Net.Mail.SmtpClient()
SmtpTLCClient.EnableSsl = False
SmtpTLCClient.UseDefaultCredentials = False

SmtpTLCClient.Host = "relay-hosting.secureserver.net"
SmtpTLCClient.Port = 25

'SmtpTLCClient.Credentials = New Net.NetworkCredential("info@MX1.crmmails1.com", "Fedyu394#@#78")
'SmtpTLCClient.Host = "51.77.27.42"
'SmtpTLCClient.Host = "smtp8.net4india.com"
'SmtpTLCClient.Port = 587
''DropDetailsToDatabase for insert website details in database
Dim strSubject As String = "Hyatt Dining Club - Request A Call - Hyatt Regency Thrissur"
Dim strSource As String = String.Empty
If Not IsNothing(strRac) Then
strSource = strRac.Trim()
End If
Dim strHostName As String = System.Net.Dns.GetHostName()
Dim strIPAddress As String = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()
Dim strUrl As String = "http://tlc.in/postpack/UserInformation.aspx?" + "Property=Hyatt Regency Thrissur&FirstName=" + txtName.Text + "&Mobile=" + txtMobile.Text + "&Email=" + txtEmailID1.Text + "&IPAddress=" + strIPAddress + "&DropSubject=" + strSubject + "&Source=" + strSource
'Dim myWebClient = New WebClient()
'Dim resultStr As String = myWebClient.DownloadString(strUrl)
''
SmtpTLCClient.Send(Message)
SmtpTLCClient.Send(TLCMessage)
SmtpTLCClient = Nothing
Catch ex As Exception
Response.Write("Check SMTP server. Please Contact with Admin")
End Try
End Sub
Protected Sub btnSUbmit_Click(sender As Object, e As EventArgs)
If Page.IsValid Then
Dim name As String = txtName.Text
SendToBothEmail(txtName.Text.Trim, txtEmailID1.Text.Trim)
Response.Redirect("Thankyou.aspx?name=" & Convert.ToString(Me.txtName.Text))
End If
End Sub
</script>
<html lang="en">
<head>
    <title>Hyatt Dining Club | Hyatt Regency Thrissur</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<link rel="apple-touch-icon" sizes="180x180" href="https://www.tlcgroup.com/tlc/landing_page/HDC/HyattHyderabad/images/apple-touch-icon.png">
<link rel="icon" type="image/png" href="https://www.tlcgroup.com/tlc/landing_page/HDC/HyattHyderabad/images/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="https://www.tlcgroup.com/tlc/landing_page/HDC/HyattHyderabad/images/favicon-16x16.png" sizes="16x16">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <link href="bootstrap.min.css" rel="stylesheet">
    <link href="ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="jquery-1.10.2.min.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.ui.draggable.js"></script>
    <script src="js/jquery.alerts.js"></script>
    <link href="css/jquery.alerts.css" rel="stylesheet" />
    <script type="text/javascript">

            $(document).ready(function () {
            $('#txtMobile').bind('copy paste cut', function (e) {
                e.preventDefault(); //disable cut,copy,paste
                //alert('cut,copy & paste options are disabled !!');
            });
        });

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
    jAlert("Please Enter Only Numeric Value:");
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
    function validatecharacter(strCh)       // w3school.com
    {
    var pattern = /^([a-zA-Z])+/;
    if (pattern.test(strCh)) {
    return true;
    } else {
    return false;
    }
    }
    function Validate() {
    debugger;
    var name = document.getElementById('txtName');
    if (name.value == "") {
    jAlert('Please enter Name.');
    name.focus();
    return false;
    }
    //Landline = document.getElementById('txtLandline');
    //if (Landline.value == "") {
    //    jAlert('Please enter Landline Number.');
    //    Landline.focus();
    //    return false;
    //}
    //if (Landline.value != "") {
    //    if (Landline.value.length >= 11) {
    //    }
    //    else {
    //        jAlert('Please enter valid Landline Number.');
    //        Landline.focus();
    //        return false;
    //    }
    //}
    //vaildation for Name(For Issue on IE 8 & Chorme  )
    namelength = document.getElementById('txtName').value;
    if (namelength.length == 0) {
    jAlert('Please enter Name.');
    document.getElementById('txtName').focus();
    return false;
    }
    //Landline1 = document.getElementById('txtLandline');
    //if (Landline1.value == "") {
    //    jAlert('Please enter Landline Number.');
    //    Landline1.focus();
    //    return false;
    //}
    //if (Landline1.value != "") {
    //    if (Landline1.value.length >= 11) {
    //    }
    //    else {
    //        jAlert('Please enter valid Landline Number.');
    //        Landline1.focus();
    //        return false;
    //    }
    //}
    //if (!validatecharacter(namelength)) {
    //    alert('Please enter a vaild Character.');
    //    document.getElementById('txtName').focus();
    //    return false;
    //}
    namelength = document.getElementById('txtEmailID1').value;
    if (namelength.length == 0) {
    jAlert('Please enter E-mail Id.');
    document.getElementById('txtEmailID1').focus();
    return false;
    }
    namelength = document.getElementById('txtMobile').value;
    if (namelength.length == 0) {
    jAlert('Please enter Mobile Number.');
    document.getElementById('txtMobile').focus();
    return false;
    }
    email = document.getElementById('txtEmailID1');
    if (email.value == "") {
    jAlert('Please enter E-mail Id.');
    email.focus();
    return false;
    }
    //check for Valid Primary Email ID
    if (email.value != "") {
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test(email.value) == false) {
    jAlert('Please enter a valid E-mail Id.');
    email.focus();
    return false;
    }
    }


                Mobile = document.getElementById('txtMobile');
            if (Mobile.value == "") {
                jAlert('Please enter Mobile Number.');
                Mobile.focus();
                return false;
            }

            if (Mobile.value != "") {
                if (Mobile.value.length >= 10) {
                    var regex = /^[0-9]\d{9}$|^[0-9]\d{10}$|^[0-9]\d{11}$/;
                    if (regex.test(Mobile.value)) {
                    }
                    else {
                        jAlert('Please enter valid Mobile Number.');
                        Mobile.focus();
                        return false;
                    }
                }
                else {
                    jAlert('Please enter valid Mobile Number.');
                    Mobile.focus();
                    return false;
                }
            }
   
   
    //txtCity = document.getElementById('txtCity');
    //if (txtCity.value == "") {
    //    jAlert('Please enter City.');
    //    txtCity.focus();
    //    return false;
    //}
    //check for dropdownlist
    //var e = document.getElementById("ddlSelect");
    //var strddl = e.options[e.selectedIndex].text;
    ////jAlert(strddl);
    //if (strddl == "Select Hotel")
    //{
    //    jAlert("Please Select Hotel.");
    //    document.getElementById("ddlSelect").focus();
    //    return false;
    //}
    // check for Retpye Email ID is blank
    // email1 = document.getElementById('txtEmail');
    //if (email1.value == "") {
    //    jAlert('Please Retype your Email Id.');
    //    email1.focus();
    //    return false;
    //}
    //check for Valid Retype  Email ID
    //if (email1.value != "") {
    //    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    //    if (reg.test(email1.value) == false) {
    //        jAlert('Please Retype your Email Id.');
    //        email1.focus();
    //        return false;
    //    }
    //}
    //check for  Email ID is mismatch
    //if (trimStr(email1.value.toLowerCase()) != trimStr(email.value.toLowerCase())) {
    //    jAlert("Email Id Mismatch, Please Retype your Email Id.");
    //    email1.focus();
    //    return false;
    //}
    // Check  for checbox
    var c = document.getElementsByTagName('input');
    for (var i = 0; i < c.length; i++) {
    if (c[i].type == 'checkbox' && c[i].checked == true) {
    //At least one checkbox IS checked
    return true;
    }
    }
    //Nothing has been checked
    jAlert("Please accept Privacy Terms.");
    return false;
    }
    function DisableButton() {
    document.getElementById("<%=btnSubmit.ClientID%>").disabled = true;
    }
    window.onbeforeunload = DisableButton;
    </script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-97477922-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-97477922-3');
</script>


</head>
<body>
    <div class="container" style="max-width: 600px; border: 1px solid black; padding: 0px 0px 20px 0px;">
        <div class="row">
            <div class="col-md-12">
                
            </div>
        </div>
        <div class="row pad">
            <table max-width="650" align="center" cellpadding="5" cellspacing="0" style="margin:0 auto;">
                <tr style="text-align: left;">
                    <td  style="text-align: center;">
                        <a href="https://www.hyattdiningclub.com/" target="_blank">
                            <img src="images/logo.png" width="200" style="max-width:100%; display: inline-block; min-width: 73px;">
                        </a>
                    </td>
                    <!--
                    <td style=" text-align: right; width:325px;">
                        <a href="https://www.theleela.com/en_us/hotels-in-mumbai/the-leela-mumbai-hotel/" target="_blank">
                            <img src="images/leela-mumbai.jpg" width="105" style="max-width:100%; display: inline-block;">
                        </a>
                    </td>
                    -->
                </tr>               
            </table>
            </div>
            <table max-width="650" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto; font-family:Georgia; color:rgb(85, 85, 85); text-align:justify;" border="0">
            <tr>
              <td width="650" style="max-width: 100%; padding-top: 15px;  text-align: center;"><img src="images/Header.jpg" style="max-width:100%;" alt="" />
              </td>
            </tr>
            </table>
            <div class="row pad">
            <div class="">
                <div class="row">
                    <%-- <div class="col-md-6">
                        <p>Hyatt Dining Club is your key to <b>more</b>. Much more. More tantalizing your taste buds, more indulging your senses and more entertaining your guests. As a Club Marriott member, you can enjoy these privileges - <b>and more</b> - even if you are not staying at our hotels.</p>
                        <ul>
                            <li>30% off on the food and beverage bill.</li>
                            <li>Group dining offers for your special occasions.</li>
                            <li>Special accommodation rates and one night stay.</li>
                            <li>Access to a range of select hotel leisure facilities.</li>
                            <li>Up to a 20% discount on food and beverage bill at over 100 participating Marriott International hotels in Asia Pacific.</li>
                        </ul>
                        <p>As a Marriott Rewards<sup>®</sup> Member, we have a special offer for you to enroll in our 12-month Club Marriott membership. Sign up by December 2016 to receive two additional vouchers - One offering a 50% discount on your food bill and the other offering a 50% discount on the beverage bill, each valid on a table of up to 10 guests at any participating hotel of Marriott International in India.</p>
                        <p>This offer is valid only for new Club Marriott membership enrollments at participating hotels of Marriott International in India.</p>
                        <p>Please quote your offer code as METTINDIA and your Marriott Rewards number at the time of enrollment.</p>
                        <p>Please provide your details in the form below and one of our Associates will call you. Alternatively, please call us on 1800 1212 004 or visit <a href="http://www.clubmarriott.in/" style="color:#c99700 !important;">www.clubmarriott.in</a> for more information.</p>
                    </div>--%>
                    <div class="col-md-1">
                        &nbsp;
                    </div>
                    <div class="col-md-10">
                        <div class="pad-top">
                            <!--
                            <h3 style="margin-bottom: 05px; margin: 20px 0 15px 0; text-align: center;">Request A Call Back</h3>
                            -->
                            <form id="Form1" runat="server">
                                <div class="form-group">
                                    <label for="FirstName">Name</label>
                                <asp:TextBox ID="txtName" style="text-transform:capitalize" runat="server" MaxLength="50" TabIndex="1" placeholder="Name" onkeypress="return isNameAlphabet(event);" class="form-control"></asp:TextBox>
                            </div>
                            <%--  <div class="form-group">
                                <label for="Family">Landline No</label>
                            <asp:TextBox ID="txtLandline" runat="server" MaxLength="11" TabIndex="2" placeholder="Landline No" onkeypress="return isNumberKey(event);" class="form-control"></asp:TextBox>
                        </div>--%>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                        <asp:TextBox ID="txtEmailID1" runat="server" placeholder="Email" onkeypress="return isemailAlphanumeric(event);" TabIndex="2" MaxLength="50" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="Mobile Number">Mobile Number</label>
                    <asp:TextBox ID="txtMobile" runat="server" placeholder="Mobile Number" MaxLength="12" TabIndex="2" onkeypress="return isNumberKey(event);" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <div class="checkbox" TabIndex="5">
                            <label style="padding-left: 5px;">
                                <input type="checkbox">
                                I agree to the <a href="http://www.privacypolicy.co.in/" style="color: #151e72 !important;" target="_blank">Privacy Terms</a>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group text-center" style="padding-top: 15px;">
                    <div class="col-sm-12">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" TabIndex="6" OnClick="btnSubmit_Click" OnClientClick="javascript:return Validate();" class="btn btn-default" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>