<%@ Page Language="VB" %>

<%@ Import Namespace="System.Net" %>
<!DOCTYPE html>
<script runat="server">
    Dim strBrandName As String = String.Empty
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        txtName.Focus()
        Dim name As String = Request.QueryString("name")
        Dim email As String = Request.QueryString("email")
        Dim mobile As String = Request.QueryString("mobile")
        Dim strcity As String = Request.QueryString("city")
        
        If Not IsPostBack Then
            If Not IsNothing(strcity) Then
                txtCity.Text = strcity
            End If
            If Not IsNothing(name) Then
                txtName.Text = name
            End If
            If Not IsNothing(email) Then
                txtEmailID1.Text = email
            End If
            If Not IsNothing(mobile) Then
                txtMobile.Text = mobile
            End If
            
        End If
        
    End Sub
    Sub SendToBothEmail(ByVal sClientName As String, ByVal sClientEmail As String)
        Dim strRac As String = Request.QueryString("val")
        Dim strRacCty As String = Request.QueryString("val2")
        Try
            '-----------------User Email-------------------------------------------
            Dim Message As New Net.Mail.MailMessage()
            Dim mailID As String = sClientEmail
            Dim FromEmail As New Net.Mail.MailAddress("contactus@hotelmemberships.com ", "contactus@hotelmemberships.com")
            Message.From = FromEmail
            Message.To.Add(New Net.Mail.MailAddress(mailID))
            Message.IsBodyHtml = True
            Message.Subject = "Thank You"
          
            Dim messageToSendUser As String = String.Empty
            messageToSendUser += "<html>"
            messageToSendUser += "<head>"
            messageToSendUser += "<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>"
            messageToSendUser += "<meta content='MSHTML 6.00.2800.1106' name='GENERATOR'>"
            messageToSendUser += "</head> "
            messageToSendUser += "<body> "
            messageToSendUser += "<div align='center'>	"
            messageToSendUser += "<table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#fff' style='color:#333;' > "
            messageToSendUser += "<tr 'bgcolor='#273745' style='width:100%; padding=20px;'>"
            messageToSendUser += "<td align='center'style='color:#333;padding:10px; background:#273745;'>"
            messageToSendUser += "<a href='http://hotelmemberships.com/' target='_blank'><img src='https://hotelmemberships.com/app/themes/hm-v03/assets/images/logo.png' style='border='0' alt='Hotel Memberships'></a>"
            messageToSendUser += "</td>"
            messageToSendUser += "</tr>"
           
            messageToSendUser += "<tr><td>&nbsp;</td></tr>"
            messageToSendUser += "<tr>"
            messageToSendUser += "<td align='left' style='color:#333;padding-left:10px;padding-right:10px; '>	"
            messageToSendUser += "<font face='Arial, Helvetica, sans-serif'><b>Dear " & StrConv(sClientName.Trim, VbStrConv.ProperCase) & ",</b></font>"
            messageToSendUser += "</td>"
            messageToSendUser += "</tr>"
            messageToSendUser += "<tr>"
            messageToSendUser += "<td style='text-align: justify;color:#333;padding-left:10px;padding-right:10px; line-height:23px;'> "
            messageToSendUser &= "<font face='Arial, Helvetica, sans-serif'><br />Thank you for dropping your details and showing interest in becoming a member of a luxury hotel. Our Membership Process Executive will call you within 24 working hours on the given contact details to help you get the best membership near you."
            messageToSendUser += "</font>"
            messageToSendUser += "</td>	"
            messageToSendUser += "</tr>	"
            messageToSendUser += "<tr><td>&nbsp;</td></tr>"
            messageToSendUser += "<tr>"
            messageToSendUser += "<td style='text-align: justify;color:#333;padding-left:10px;padding-right:10px;'> "
            messageToSendUser += "<font face='Arial, Helvetica, sans-serif'>For more details on the membership you may write to us at contactus@hotelmemberships.com."
            messageToSendUser += "</font> "
            messageToSendUser += "</td>	 "
            messageToSendUser += "</tr>"
            messageToSendUser += "<tr><td>&nbsp;</td></tr>"
           
            messageToSendUser += "<tr><td style='text-align: justify;color:#333;padding-left:10px;padding-right:10px;'><font face='Arial, Helvetica, sans-serif'>Thank you,</font> </td></tr><br>"
            messageToSendUser += "<tr> "
            messageToSendUser += "<td style='text-align: justify;color:#333;padding-left:10px;padding-right:10px;'>	"

            messageToSendUser += "<font face='Arial, Helvetica, sans-serif'><b>Team Hotel Memberships</b><br>Phone: <a style='color:#333;' href='tel:1800 103 4985'>1800 103 4985</a><br>E-mail: <a href='mailto:contactus@hotelmemberships.com' style='color:#333;'>contactus@hotelmemberships.com</a><br><br>"
            messageToSendUser += "</font> "

            messageToSendUser += "</td>"
            messageToSendUser += "</tr>	"
            messageToSendUser += "</table> "
			
			messageToSendUser += "<div class=' column left'  style=' width:100%; display:inline-block; vertical-align:middle; max-width:600px; background:#283744; padding-top:10px;' >"
			messageToSendUser += "<table width='600' bgcolor='#273745' style='max-width:600px; background:#273745;'  >"
messageToSendUser += "<tbody>"
messageToSendUser += "<tr>"
messageToSendUser += "<td style='text-align:center;padding-top:10px;padding-bottom: 10px;'>"
messageToSendUser += "<a href='https://www.facebook.com/sharer/sharer.php?u=http%3A//www.hotelmemberships.com' style='padding-right:10px; padding-left:10px; display: inline-block; vertical-align: middle; margin: 0 auto;' target='_blank'>"
messageToSendUser += "<img alt='Facebook' src='http://hotelmemberships.com/social-thanku-ico/facebook.png' style='border-width:0;Margin: 0 auto;display: inline-block;vertical-align: middle;height: auto;' title='Share on Facebook' width='32' style='padding-right:10px; padding-left:10px;'></a>"
messageToSendUser += "<a href='https://twitter.com/intent/tweet?text=Visit%20www.hotelmemberships.com%20to%20find%20the%20memberships%20of%20your%20choice,%20compare%20benefits%20and%20book%20a%20call.%20http://www.hotelmemberships.com' style='padding-right:10px; padding-left:10px; display: inline-block; vertical-align: middle; margin: 0 auto;' target='_blank'>"
messageToSendUser += "<img alt='Twitter' src='http://hotelmemberships.com/social-thanku-ico/twtr.png' style='border-width:0;Margin: 0 auto; style='padding-right:10px; padding-left:10px;'display: inline-block;vertical-align: middle;height: auto;' title='Share on Twitter' width='32'></a>"
messageToSendUser += "<a style='padding-right:10px;' href='https://api.whatsapp.com/send?phone=919650910000' target='_blank'><img alt='Whatsapp' src='http://hotelmemberships.com/social-thanku-ico/whtsap.png' style='border-width:0;Margin: 0 auto;display: inline-block;padding:10px;vertical-align: middle;height: auto;' title='Share on Whatsapp' width='32'></a></td>"
messageToSendUser += "</tr>"
messageToSendUser += "<tr>"
messageToSendUser += "<td style='color: #222;font-size: 16px;line-height: 18px;text-align:center;padding-top: 0;'><a href='http://hotelmemberships.com/' style='padding:5px; color: #ffffff; text-decoration: none; font-family: inherit;' target='_blank'>Website</a> <span style='color:#fff;'>| </span><a href='http://hotelmemberships.com/privacy-policy/' style=' color: #ffffff; text-decoration: none; font-family: inherit;' target='_blank'> Privacy Policy</a></p></td>"
messageToSendUser += "</tr>"
messageToSendUser += "<tr>"
messageToSendUser += "<td style='margin-top:20px; color: #fff;font-size: 16px;line-height: 18px;text-align:center;padding-top: 0;'><p style='font-size: 12px;line-height: 22px;text-decoration: none;color: #ffffff;font-family: 'Source Serif Pro', 'Raleway', 'Proxima Nova', 'Roboto', Helvetica Neue, Helvetica, Arial, sans-serif;text-align: center;font-style: normal;margin-bottom: 0;padding: 0;'>© 2019 TLC® Relationship Management Pvt. Ltd. All Rights Reserved.</p></td>"
messageToSendUser += "</tr>"
messageToSendUser += "</tbody>"
messageToSendUser += "</table>"
  messageToSendUser += "</div>"



		  
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
            Dim TLCmailID As String = "contactus@hotelmemberships.com "
            'Dim TLCmailID As String = "brijesh.gupta@tlcgroup.com"
            Dim TLCFromEmail As New Net.Mail.MailAddress("contactus@hotelmemberships.com", "contactus@hotelmemberships.com")
            TLCMessage.From = TLCFromEmail
            TLCMessage.To.Add(New Net.Mail.MailAddress(TLCmailID))
            
            'tlcmessage.cc.add(new net.mail.mailaddress("shailendra@tlcgroup.com", "shailendra@tlcgroup.com"))
            'tlcmessage.cc.add(new net.mail.mailaddress("kamini.sharma@tlcgroup.com", "kamini.sharma@tlcgroup.com"))
            
            TLCMessage.CC.Add(New Net.Mail.MailAddress("namrata.jain@tlcgroup.com", "namrata.jain@tlcgroup.com"))
            
            TLCMessage.CC.Add(New Net.Mail.MailAddress("manisha.malhotra@hotelmemberships.com ", "manisha.malhotra@hotelmemberships.com "))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("mahima.dewan@tlcgroup.com", "mahima.dewan@tlcgroup.com"))
            
            TLCMessage.IsBodyHtml = True
            TLCMessage.Subject = "Request a Call – HM Email Campaign - May 2019"
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
            'TLCstr &= "<tr>"
            'TLCstr &= "<td>For Property"
            'TLCstr &= "</td>"
            'TLCstr &= " <td class='auto-style1'>Orchid Hotel"
            'TLCstr &= "</td></tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>Name"
            TLCstr &= "</td>"
            TLCstr &= " <td class='auto-style1'>" & StrConv(txtName.Text.Trim, VbStrConv.ProperCase)
            TLCstr &= "</td>"
            TLCstr &= "</tr>"
            
            TLCstr &= "<tr>"
            TLCstr &= "<td>Email</td>"
            TLCstr &= "<td class='auto-style1'>" & txtEmailID1.Text & "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>Mobile</td>"
            TLCstr &= "<td class='auto-style1'>" & txtMobile.Text & "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>City</td>"
            TLCstr &= "<td class='auto-style1'>" & StrConv(txtCity.Text.Trim, VbStrConv.ProperCase) & "</td>"
            TLCstr &= "</tr>"
			
             TLCstr &= "<tr style='text-align:center;'>"
                TLCstr &= "<td colspan='2'>Preferred Brand</td>"
                TLCstr &= "<td></td>"
                TLCstr &= "</tr>"
           
            If (chkAccor.Checked) Then
                TLCstr &= "<tr>"
            	TLCstr &= "<td></td>"
                TLCstr &= "<td class='auto-style1'>" & StrConv(chkAccor.Text.Trim, VbStrConv.ProperCase) & "</td>"
				TLCstr &= "</tr>"
               
            End If
			If (chkRadisson.Checked) Then
                TLCstr &= "<tr>"
                TLCstr &= "<td></td>"
                TLCstr &= "<td class='auto-style1'>" & StrConv(chkRadisson.Text.Trim, VbStrConv.ProperCase) & "</td>"
                TLCstr &= "</tr>"
            End If
            If (chkITC.Checked) Then
                 TLCstr &= "<tr>"
                TLCstr &= "<td></td>"
                TLCstr &= "<td class='auto-style1'>" & StrConv(chkITC.Text.Trim, VbStrConv.ProperCase) & "</td>"
               TLCstr &= "</tr>"
            End If
            If (chkMarr.Checked) Then
                TLCstr &= "<tr>"
                TLCstr &= "<td></td>"
                TLCstr &= "<td class='auto-style1'>" & StrConv(chkMarr.Text.Trim, VbStrConv.ProperCase) & "</td>"
                TLCstr &= "</tr>"
            End If
            If (chkleela.Checked) Then
               TLCstr &= "<tr>"
               TLCstr &= "<td></td>"
               TLCstr &= "<td class='auto-style1'>" & StrConv(chkleela.Text.Trim, VbStrConv.ProperCase) & "</td>"
               TLCstr &= "</tr>"
            End If
            If (chkTaj.Checked) Then
                 TLCstr &= "<tr>"
                TLCstr &= "<td></td>"
                TLCstr &= "<td class='auto-style1'>" & StrConv(chkTaj.Text.Trim, VbStrConv.ProperCase) & "</td>"
               TLCstr &= "</tr>"
            End If
            
            TLCstr &= "<tr>"
            TLCstr &= "<td>Internet details</td>"
            TLCstr &= "<td class='auto-style1'>" & Request.ServerVariables("REMOTE_ADDR") & " - " & DateTime.Now.Date.ToString("dd MMM yyyy") & " & " & DateTime.Now.TimeOfDay.Hours.ToString() & ":" & DateTime.Now.TimeOfDay.Minutes.ToString() & "</td>"
            TLCstr &= "</tr>"
            
            If Not IsNothing(strRac) Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>" & strRac.Trim() & "</td>"
                TLCstr &= "</tr>"
            
            End If
            
            If strRac = "1" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Lucknow Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data -  Lucknow Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "2" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Varanasi Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data -  Varanasi Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "3" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Chandigarh Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data -  Chandigarh Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "4" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Kolkata Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data -  Kolkata Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "5" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Hyderabad Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data - Hyderabad Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "6" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Chennai Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data - Chennai Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "7" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Mumbai Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data - Mumbai Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "8" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Gurgaon  Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data - Gurgaon  Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "9" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Delhi  Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data - Delhi  Mailer</td>"
                TLCstr &= "</tr>"
            End If
            If strRac = "10" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>FB Leads - Amritsar  Mailer</td>"
                TLCstr &= "</tr>"
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 2</td>"
                TLCstr &= "<td class='auto-style1'>HP Data - Amritsar  Mailer</td>"
                TLCstr &= "</tr>"
            End If
            
 	 If strRac = "22" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>Valentine Day</td>"
                TLCstr &= "</tr>"
            End If


 	 If strRac = "23" Then
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source 1</td>"
                TLCstr &= "<td class='auto-style1'>HM Mailer - Follow Us</td>"
                TLCstr &= "</tr>"
            End If


            If strRac = "11" And Not IsNothing(strRacCty) Then
                
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>HM Birthday Mailer_" +strRacCty.trim() +"</td>"
                TLCstr &= "</tr>"
               
            End If
			If strRac = "12" Then
                
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>HM Mailer</td>"
                TLCstr &= "</tr>"
               
            End If
            If strRac = "13" Then
                
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>FB Organic</td>"
                TLCstr &= "</tr>"
               
            End If

            If strRac = "14" Then
                
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>HM Birthday Mailer - FB Leads</td>"
                TLCstr &= "</tr>"
               
            End If

            If strRac = "15" Then
                
                TLCstr &= "<tr>"
                TLCstr &= "<td>Source</td>"
                TLCstr &= "<td class='auto-style1'>HM Birthday Mailer - HM Leads</td>"
                TLCstr &= "</tr>"
               
            End If
            
            TLCstr &= "<tr>"
            TLCstr &= "<td>&nbsp; &nbsp;</td>"
            TLCstr &= "<td class='auto-style1'>&nbsp; &nbsp;</td>"
            TLCstr &= " </tr>"
            TLCstr &= "</table>"
            TLCstr &= "<br />"
            TLCstr &= "Team Hotel Memberships<br /><br />"
            TLCstr &= "Note: This e-mail is automatically generated by our system on above profile contact request. "
            TLCstr &= "</body>"
            TLCstr &= "</html>"
            TLCMessage.Body = TLCstr
            
            Dim SmtpTLCClient As New Net.Mail.SmtpClient()
            SmtpTLCClient.EnableSsl = False
            SmtpTLCClient.UseDefaultCredentials = False
            
            SmtpTLCClient.Credentials = New Net.NetworkCredential("mail@tlc.in", "tlcgroup")
            SmtpTLCClient.Host = "smtpauth.tlc.in"
            'SmtpTLCClient.Host = "smtp8.net4india.com"
            SmtpTLCClient.Port = 587
            
            SmtpTLCClient.Send(TLCMessage)
            SmtpTLCClient.Send(Message)
            SmtpTLCClient = Nothing
            
            ''DropDetailsToDatabase for insert website details in database
            Dim strSubject As String = "Request a Call – HM Email Campaign 1"
            Dim strProperty As String = "Hotel Membership"
            Dim strSource As String = String.Empty
            If Not IsNothing(strRac) Then
                If strRac = "12" Then
                    strSource = "HM Mailer"
                End If
            End If
            If Not IsNothing(strRac) Then
                If strRac = "14" Then
                    strSource = "HM Mailer"
                End If
            End If
            If Not IsNothing(strRac) Then
                If strRac = "15" Then
                    strSource = "HM Mailer"
                End If
            End If

            
            If chkAccor.Checked Then
                strBrandName = chkAccor.Text
            End If
            If chkITC.Checked Then
                strBrandName = chkITC.Text
            End If
            If chkleela.Checked Then
                strBrandName = chkleela.Text
            End If
            If chkMarr.Checked Then
                strBrandName = chkMarr.Text
            End If
            If chkRadisson.Checked Then
                strBrandName = chkRadisson.Text
            End If
            If chkTaj.Checked Then
                strBrandName = chkTaj.Text
            End If
            
            Dim strHostName As String = System.Net.Dns.GetHostName()
            Dim strIPAddress As String = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()
            Dim strUrl As String = "http://tlc.in/postpack/UserInformation.aspx?" + "Property=" + strProperty + "&FirstName=" + txtName.Text + "&Mobile=" + txtMobile.Text + "&Email=" + txtEmailID1.Text + "&IPAddress=" + strIPAddress + "&DropSubject=" + strSubject + "&Source=" + strSource.Trim() + "&City=" + txtCity.Text + "&Company=BrandName-" + strBrandName

            Dim myWebClient = New WebClient()
            Dim resultStr As String = myWebClient.DownloadString(strUrl)

            ''
        Catch ex As Exception
            Response.Write("Check SMTP server. Please Contact with Admin")
        End Try
    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        If IsNothing(txtName.Text) Or txtName.Text = "" Then
            txtName.BorderColor = System.Drawing.Color.Red
            'ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please enter Name.');", True)
            Exit Sub
        Else
            txtName.BorderColor = System.Drawing.Color.White
        End If
        
        
        If IsNothing(txtEmailID1.Text) Or txtEmailID1.Text = "" Then
            txtEmailID1.BorderColor = System.Drawing.Color.Red
            'ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please enter Name.');", True)
            Exit Sub
        Else
            txtEmailID1.BorderColor = System.Drawing.Color.White
            If Not IsEmail(txtEmailID1.Text) Then
                txtEmailID1.BorderColor = System.Drawing.Color.Red
            Else
                txtEmailID1.BorderColor = System.Drawing.Color.White
            End If
        End If
        If IsNothing(txtMobile.Text) Or txtMobile.Text = "" Then
            txtMobile.BorderColor = System.Drawing.Color.Red
            'ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please enter Name.');", True)
            Exit Sub
        Else
            txtMobile.BorderColor = System.Drawing.Color.White
            If Not CheckPhoneNumber(txtMobile.Text) Then
                txtMobile.BorderColor = System.Drawing.Color.Red
            Else
            txtMobile.BorderColor = System.Drawing.Color.White
            End If
        End If
        If IsNothing(txtCity.Text) Or txtCity.Text = "" Then
            txtCity.BorderColor = System.Drawing.Color.Red
            'ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please enter Name.');", True)
            Exit Sub
        Else
            txtCity.BorderColor = System.Drawing.Color.White
        End If
        
        'Dim count As Integer = 0
       
        '    If chkAccor.Checked = False or chkITC.Checked = False or chkleela.Checked = False or chkMarr.Checked = False or chkRadisson.Checked = False or chkTaj.Checked = False Then
        '        chkAccor.BorderColor = System.Drawing.Color.Red
        '        Exit Sub
        '    Else
        '        count = count + 1
        '        chkAccor.BorderColor = System.Drawing.Color.White
        '    End If
            
       
        If Page.IsValid Then
            Dim name As String = txtName.Text
            SendToBothEmail(txtName.Text.Trim, txtEmailID1.Text.Trim)
            Response.Redirect("Thankyou.aspx?name=" & Convert.ToString(Me.txtName.Text))
        End If
    End Sub
   Public Function IsEmail(ByVal email As String) As Boolean
        Static emailExpression As New Regex("^[_a-z0-9-]+(.[a-z0-9-]+)@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$")

        Return emailExpression.IsMatch(email)
    End Function
    Public Function CheckPhoneNumber(ByVal strPhoneNumber As String) As Boolean
        Dim MatchPhoneNumberPattern As String = "(\d{1,2})?\-?\d{10}"
        If strPhoneNumber IsNot Nothing Then
            Return Regex.IsMatch(strPhoneNumber, MatchPhoneNumberPattern)
        Else
            Return False
        End If
    End Function
</script>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Membership Landing page</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" type="text/css" rel="stylesheet">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-97477922-6"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-97477922-6');
</script>

    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.ui.draggable.js"></script>
    <script src="js/jquery.alerts.js"></script>
    <link href="css/jquery.alerts.css" rel="stylesheet" />

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
                jAlert('Please enter your name.');
                name.focus();
                return false;
            }
           
            //name = document.getElementById('txtfamilyname');
            //if (name.value == "") {
            //    jAlert('Please enter your last name.');
            //    name.focus();
            //    return false;
            //}
            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtName').value;
            if (namelength.length == 0) {
                jAlert('Please enter your name.');
                document.getElementById('txtName').focus();
                return false;
            }
            //namelength = document.getElementById('txtfamilyname').value;
            //if (namelength.length == 0) {
            //    jAlert('Please enter your last name.');
            //    document.getElementById('txtName').focus();
            //    return false;
            //}
            //if (!validatecharacter(namelength)) {
            //    jAlert('Please enter a vaild Character.');
            //    document.getElementById('txtName').focus();
            //    return false;
            //}

 

            namelength = document.getElementById('txtEmailID1').value;
            if (namelength.length == 0) {
                jAlert('Please enter Email ID.');
                document.getElementById('txtEmailID1').focus();
                return false;
            }

            namelength = document.getElementById('txtMobile').value;
            if (namelength.length == 0) {
                jAlert('Please enter Mobile Number.');
                document.getElementById('txtMobile').focus();
                return false;
            }


            Mobile = document.getElementById('txtMobile');
            if (Mobile.value == "") {
                jAlert('Please enter Mobile Number.');
                Mobile.focus();
                return false;
            }

            if (Mobile.value != "") {
              
                if (Mobile.value.length >= 10) {

                }
                else {
                    jAlert('Please enter valid Mobile Number.');
                    Mobile.focus();
                    return false;
                }

            }

           
            email = document.getElementById('txtEmailID1');
            if (email.value == "") {
                jAlert('Please enter Email ID.');
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

            txtCity = document.getElementById('txtCity');
            if (txtCity.value == "") {
                jAlert('Please enter city.');
                txtCity.focus();
                return false;
            }

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
            var chk = $('input[type="checkbox"]:checked');
            if (chk.length == 0) {
                jAlert("Please select at least one preferred hotel brand of your choice.");
                return false;
            }
            else {
                if (chk.length == 1) {
                    return true;
                }
                else {
                    jAlert("Please select only one preferred hotel brand of your choice.");
                    return false;
                }
            }
            //var ret;
            //var c = document.getElementsByTagName('input');
           
            //for (var i = 0; i < c.length; i++) {
            //    if (c[i].type == 'checkbox' && c[i].checked == true) {
            //        //At least one checkbox IS checked
            //        console.log(c[i]);
            //        return false;
                  
                    
            //        //ret = true;
            //    }
            //}

            ////Nothing has been checked   
            
            //return false;


        }
        function DisableButton() {
            document.getElementById("<%=btnSubmit.ClientID%>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
    </script>
  </head>
  <body>
    
      <div class="col-sm-6 col-xs-12 col-md-5 bg col-centered">
<div class="logo-landing">
<a href="https://hotelmemberships.com/" target="_blank">
<img src="img/logo.png" alt="Hotel Memberships">
</a>
</div>
  <div class="panel-shadow">
    <div class="panel-heading">Annual membership from luxury hotels</div>
      <form runat="server">
        <div class="form-group">
            <asp:TextBox ID="txtName" runat="server" placeholder="Name"  MaxLength="50" style="text-transform:capitalize" onkeypress="return isNameAlphabet(event);" class="form-control"></asp:TextBox>
          
        </div>
        <div class="form-group">
          <asp:TextBox ID="txtEmailID1" runat="server" placeholder="Email"  onkeypress="return isemailAlphanumeric(event);" MaxLength="50" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
          <asp:TextBox ID="txtMobile" runat="server" placeholder="Mobile" MaxLength="12" onkeypress="return isNumberKey(event);" class="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
          <asp:TextBox ID="txtCity" runat="server" placeholder="City" style="text-transform:capitalize" onkeypress="return isNameAlphabet(event);" class="form-control"></asp:TextBox>
        </div>
        
        <div class="row">
        <div class="col-md-12">
        <h3 class="col-md-2 title-color no-pading">Preferred Brand</h3>
        <div class="col-md-10 no-pading">
        <div class="form-group">        
          <div class="col-md-6 col-sm-12 col-xs-12 no-pading">
              <asp:CheckBox runat="server" ID="chkAccor" Text="Accor Hotels" />
              <%--<input class="col-sm-3" name="" type="checkbox">--%>
               <%--<label>Accor Hotels</label>--%>

          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 no-pading">
              <asp:CheckBox runat="server" ID="chkRadisson" Text="Radisson Hotels" />
              <%--<input class=" " name="" type="checkbox"> --%>
              <%--<label>Radisson Hotels</label>--%>

          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 no-pading">
              <asp:CheckBox runat="server"  ID="chkITC" Text="ITC Hotels" />
              <%--<label>ITC Hotels</label>--%>

          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 no-pading">
              <asp:CheckBox runat="server" ID="chkMarr" Text="Marriott Hotels" />
              <%--<label>Marriott Hotels</label>--%>

          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 no-pading">
          
              <asp:CheckBox runat="server"  ID="chkleela" Text="The Leela Palaces, Hotels and Resorts" />
              <%--<label>The Leela Palaces, Hotels and Resorts</label>--%>
              

          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 no-pading">
          
              <asp:CheckBox runat="server" ID="chkTaj" Text="Taj Hotels Palaces Resorts Safaris" />
               <%--<label>Taj Hotels Palaces Resorts Safaris</label>--%>

          

          </div>
        </div>
        </div>
        </div>
        </div>
          
        <div class="form-group frm_submit">
            <asp:Button ID="btnSubmit" runat="server" Text="Request Details" OnClick="btnSubmit_Click"  OnClientClick="javascript:return Validate();" class="form-control" />
          <%--<input class="form-control" name="" type="button" value="Request Details">--%>
        </div>

      </form>
  </div>
</div>

  </body>
</html>