Imports System
Imports System.Web
Imports System.Web.UI.Control
Imports System.Web.Services
Imports System.Collections.Generic

Partial Public Class ReferForm
    Inherits System.Web.UI.Page
#Region "Global Varriable"

    Dim objInvitedata As InviteData
#End Region

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Try

            objInvitedata = New InviteData()
            txtFName1.Focus()
            Dim name As String = Request.QueryString("name")
            Dim mobile As String = Request.QueryString("mobile")
            Dim Email As String = Request.QueryString("Email")
            If Not IsPostBack Then

                'txtLName.Text = name
                txtMobile1.Text = mobile

            End If

        Catch ex As Exception
            Throw New Exception((ex.Message))
        End Try

        'txtEmail.Focus()
    End Sub
    'Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
    '    If Page.IsValid Then
    '        Dim name As String = txtFName1.Text

    '        'If txtMobile.Text.Trim.Length < 10 Then
    '        '    lblError.Text = "Please enter a valid Mobile Number."
    '        '    lblError.ForeColor = Drawing.Color.Red
    '        '    Return
    '        'End If

    '        'If chkAccept.Checked = False Then
    '        '    lblError.Text = "Please accept Terms & Conditions."
    '        '    lblError.ForeColor = Drawing.Color.Red
    '        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "alert('Please accept Terms & Conditions.');", True)
    '        '    Return
    '        'End If

    '        SendToBothEmail()


    '    End If
    'End Sub

    ''' <summary>
    ''' Validation to check Letter
    ''' </summary>
    ''' <param name="letter"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared Function OnlyLetters(letter As String) As Boolean
        Try

            Dim expression As String = "^[a-zA-Z .'’]*$"

            Dim match As Match = Regex.Match(letter, expression, RegexOptions.IgnoreCase)
            If match.Success Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Throw New Exception((ex.Message))
        End Try

    End Function


    ''' <summary>
    ''' WebMethod DynamicallySendMailToBoth which is called from aspx on ajax
    ''' </summary>
    ''' <param name="strJsonObj1"></param>
    ''' <param name="count"></param>
    ''' <param name="strJsonObj2"></param>
    ''' <remarks></remarks>

    <System.Web.Services.WebMethod()> _
    Public Shared Sub DynamicallySendMailToBoth(strJsonObj1 As String, count As Integer, strJsonObj2 As String) ''As String
        Try

            Dim objInvitedata As InviteData = New InviteData()
            objInvitedata.Flag = objInvitedata.SendToBothEmail(strJsonObj1, count, strJsonObj2)

            ''Return objInvitedata.Flag
        Catch ex As Exception
            Throw New Exception((ex.Message))
        End Try


    End Sub


End Class


''' <summary>
''' InviteData class
''' </summary>
''' <remarks></remarks>
Partial Public Class InviteData
    Inherits System.Web.UI.Page

#Region "Global Varriable"
    Dim strJson1 As String = String.Empty
    Dim strJson2 As String = String.Empty
    Dim intCount As Integer = 0
    Dim list1 As List(Of String) = New List(Of String)()
    Dim list2 As List(Of String) = New List(Of String)()
    Dim strip As String = Context.Request.ServerVariables("REMOTE_ADDR")

#End Region

#Region "Properties"

    Private _fName1 As String
    Public Property FName1() As String
        Get
            Return _fName1
        End Get
        Set(ByVal value As String)
            _fName1 = value
        End Set
    End Property

    Private _Mobile1 As String
    Public Property Mobile1() As String
        Get
            Return _Mobile1
        End Get
        Set(ByVal value As String)
            _Mobile1 = value
        End Set
    End Property

    Private _Email1 As String
    Public Property Email1() As String
        Get
            Return _Email1
        End Get
        Set(ByVal value As String)
            _Email1 = value
        End Set
    End Property

    Private _ReEmail1 As String
    Public Property ReEmail1() As String
        Get
            Return _ReEmail1
        End Get
        Set(ByVal value As String)
            _ReEmail1 = value
        End Set
    End Property

    Private _Batch1 As String
    Public Property Batch1() As String
        Get
            Return _Batch1
        End Get
        Set(ByVal value As String)
            _Batch1 = value
        End Set
    End Property

    Private _select1 As String
    Public Property selectPro1() As String
        Get
            Return _select1
        End Get
        Set(ByVal value As String)
            _select1 = value
        End Set
    End Property

    Private _fName2 As String
    Public Property FName2() As String
        Get
            Return _fName2
        End Get
        Set(ByVal value As String)
            _fName2 = value
        End Set
    End Property

    Private _Mobile2 As String
    Public Property Mobile2() As String
        Get
            Return _Mobile2
        End Get
        Set(ByVal value As String)
            _Mobile2 = value
        End Set
    End Property

    Private _Email2 As String
    Public Property Email2() As String
        Get
            Return _Email2
        End Get
        Set(ByVal value As String)
            _Email2 = value
        End Set
    End Property

    Private _ReEmail2 As String
    Public Property ReEmail2() As String
        Get
            Return _ReEmail2
        End Get
        Set(ByVal value As String)
            _ReEmail2 = value
        End Set
    End Property

    Private _Batch2 As String
    Public Property Batch2() As String
        Get
            Return _Batch2
        End Get
        Set(ByVal value As String)
            _Batch2 = value
        End Set
    End Property

    Private _select2 As String
    Public Property selectPr2() As String
        Get
            Return _select2
        End Get
        Set(ByVal value As String)
            _select2 = value
        End Set
    End Property

    Private _flag As String
    Public Property Flag() As String
        Get
            Return _flag
        End Get
        Set(ByVal value As String)
            _flag = value
        End Set
    End Property

    Private _fName As String
    Public Property FName() As String
        Get
            Return _fName
        End Get
        Set(ByVal value As String)
            _fName = value
        End Set
    End Property

    Private _Mobile As String
    Public Property Mobile() As String
        Get
            Return _Mobile
        End Get
        Set(ByVal value As String)
            _Mobile = value
        End Set
    End Property

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Private _ReEmail As String
    Public Property ReEmail() As String
        Get
            Return _ReEmail
        End Get
        Set(ByVal value As String)
            _ReEmail = value
        End Set
    End Property

    Private _Batch As String
    Public Property Batch() As String
        Get
            Return _Batch
        End Get
        Set(ByVal value As String)
            _Batch = value
        End Set
    End Property

    Private _select As String
    Public Property selectPro() As String
        Get
            Return _select
        End Get
        Set(ByVal value As String)
            _select = value
        End Set
    End Property

    
#End Region

    ''' <summary>
    ''' sending mail to both  SendToBothEmail
    ''' </summary>
    ''' <param name="strJson1"></param>
    ''' <param name="intCount"></param>
    ''' <remarks></remarks>
    Public Function SendToBothEmail(strJson1 As String, intCount As Integer, strJson2 As String) As String

        Try

            Dim strArr2() As String
            Dim ct2 As Integer
            strArr2 = strJson2.Split("&")
            If strArr2.Length > 1 Then

                For ct2 = 0 To strArr2.Length - 1
                    list2.Add(strArr2(ct2))
                Next
            End If


            Dim strArr1() As String
            Dim ct1 As Integer
            strArr1 = strJson1.Split("&")
            If strArr1.Length > 1 Then

                For ct1 = 0 To strArr1.Length - 1
                    list1.Add(strArr1(ct1))

                Next
            End If

            

            '-----------------User Email-------------------------------------------
            Dim Message As New Net.Mail.MailMessage()
            Dim mailID As String = String.Empty
            If Not String.IsNullOrEmpty(list2(2)) Then
                mailID = list2(2)
            End If

            Dim FromEmail As New Net.Mail.MailAddress("ghc@tlcgroup.com", "Global Hospitality Conclave 2019")
            Message.From = FromEmail
            Message.To.Add(New Net.Mail.MailAddress(mailID))
            Message.IsBodyHtml = True
            Message.Subject = "Thank You"
            Dim retlist As List(Of String) = New List(Of String)
            Dim str As String = String.Empty
            str = "<html>"
            str &= "<head>"
            str &= "<meta charset='utf-8'>"
            str &= "</head>"
            str &= "<body>"


            str &= "<div align='center'>"
            str &= "<center>"
            str &= "<table cellspacing='8' cellpadding='0' border='0' width='430'>"
            str &= "<tr>"
            str &= "<td style='text-align: justify' align='center'> "
            str &= "<center><img src='http://tlc.in/tlc/ghctlc/images/logo.jpg' align='center' style='max-width:100%;'></center>"
            str &= "</font> "
            str &= "</td> "
            str &= "</tr>"
            str &= "<tr>"
            str &= "<td style='text-align: justify'> "
            str &= "<font face='Arial, Helvetica, sans-serif'>Thank you for referring friends & colleagues for GHC 2019.<br /><br />We shall contact them and send them the details.<br /><br />Thank you again for your support.<br/><br/><b>Organizing Committee <br />GHC 2019</b>"
            str &= "</font> "
            str &= "</td>	"
            str &= "</tr>"
            str &= "</table> "
            str &= "</center>"
            str &= "</div>"
            str &= "</body>"
            str &= "</html>"

            Message.Body = str

            '----------------------------------------------------------------------            

            '-----------------TLC Email-------------------------------------------

            Dim TLCMessage As New Net.Mail.MailMessage()
            Dim TLCmailID As String = "ghc@tlcgroup.com"
            'Dim TLCmailID As String = "brijesh.gupta@tlcgroup.com" ' tlc Email id 
            Dim TLCFromEmail As New Net.Mail.MailAddress("ghc@tlcgroup.com", "Global Hospitality Conclave 2019.")

            TLCMessage.From = TLCFromEmail
            TLCMessage.To.Add(New Net.Mail.MailAddress(TLCmailID))

            TLCMessage.CC.Add(New Net.Mail.MailAddress("drops@tlcgroup.com"))
            'TLCMessage.CC.Add(New Net.Mail.MailAddress("sudhir@tlcgroup.com"))
            'TLCMessage.CC.Add(New Net.Mail.MailAddress("sharoni.sharma@theleela.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("kamini.sharma@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("mahima.dewan@tlcgroup.com"))
            TLCMessage.CC.Add(New Net.Mail.MailAddress("saurabh.dey@tlcgroup.com"))

            TLCMessage.CC.Add(New Net.Mail.MailAddress("sunita.handoo@tlcgroup.com"))

            'TLCMessage.CC.Add(New Net.Mail.MailAddress("shailendra@tlcgroup.com"))
            'TLCMessage.CC.Add(New Net.Mail.MailAddress("sonal.sharma@tlcgroup.com"))

            TLCMessage.IsBodyHtml = True
            TLCMessage.Subject = "Global Hospitality Conclave 2019 - Refer a friend"
            Dim TLCstr As String = String.Empty
            Dim strFull As String = String.Empty
            Dim count As Integer = 0
            TLCstr = "<head>"
            TLCstr &= "<title>Thank You</title>"
            TLCstr &= "<style type=text/css'>"
            TLCstr &= ".auto-style1 {"
            TLCstr &= "width: 246px;"
            TLCstr &= "}"
            TLCstr &= "</style>"
            TLCstr &= "</head>"
            TLCstr &= "<body>"
            TLCstr &= "<table border='1' width='500px'>"
            TLCstr &= "<tr style='text-align:center; line-height:26px;'><td colspan='2'><strong>Global Hospitality Conclave 2019 Refer Friends Details.</strong></td> </tr>"


            If (intCount <= 2) Then
                If Not String.IsNullOrEmpty(list2(0)) Then
                    TLCstr &= "<tr><td>Name</td>"
                    TLCstr &= " <td class='auto-style1'>" & list2(0)
                    TLCstr &= "</td>"
                    TLCstr &= "</tr>"
                End If

               
                
                If Not String.IsNullOrEmpty(list2(2)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Email</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(2)
                    TLCstr &= "</td></tr>"
                End If



                
                If Not String.IsNullOrEmpty(list2(1)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Mobile</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(1) ''& obj.Mobile '' txtMobile1.Text & "</td>"
                    TLCstr &= "</td></tr>"
                End If



               
                If Not String.IsNullOrEmpty(list2(4)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Batch</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(4) ''& obj.Batch '' txtBatch1.Text & "</td>"
                    TLCstr &= "</td></tr>"
                End If


                
                If Not String.IsNullOrEmpty(list2(5)) And list2(5) <> "Select" Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Select</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(5) '' & obj.selectPro '' ddlselect1.SelectedItem.Text & "</td>"
                    TLCstr &= "</td></tr>"
                End If


                
                If Not String.IsNullOrEmpty(list2(6)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Name"
                    TLCstr &= "</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(6) ''& obj.FName2 '' txtFName2.Text.Trim()
                    TLCstr &= "</td>"
                    TLCstr &= "</tr>"
                End If

               
               
                If Not String.IsNullOrEmpty(list2(8)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Email</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(8)  ''& obj.Email2 '' txtEmail2.Text & "</td>"
                    TLCstr &= "</td>"
                    TLCstr &= "</tr>"
                End If

               
                If Not String.IsNullOrEmpty(list2(7)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Mobile</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(7)  ''& obj.Mobile2 '' txtMobile2.Text & "</td>"
                    TLCstr &= "</td>"
                    TLCstr &= "</tr>"
                End If



               
                If Not String.IsNullOrEmpty(list2(10)) Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Batch</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(10) ''& obj.Batch2 '' txtBatch2.Text & "</td>"
                    TLCstr &= "</td>"
                    TLCstr &= "</tr>"
                End If


                
                If Not String.IsNullOrEmpty(list2(11)) And list2(11) <> "Select" Then
                    TLCstr &= "<tr>"
                    TLCstr &= "<td>Select</td>"
                    TLCstr &= "<td class='auto-style1'>" & list2(11) ''& obj.selectPr2 '' ddlSelect2.SelectedItem.Text & "</td>"
                    TLCstr &= "</td>"
                    TLCstr &= "</tr>"
                End If



            End If
            
            TLCstr &= "<tr>"
            TLCstr &= "<td>Internet details</td>"
            TLCstr &= "<td class='auto-style1'>" & strip & "-" & DateTime.Now.Date.ToString("dd MMM yyyy") & " & " & DateTime.Now.TimeOfDay.Hours.ToString() & ":" & DateTime.Now.TimeOfDay.Minutes.ToString() & "</td>"
            TLCstr &= "</tr>"
            TLCstr &= "<tr>"
            TLCstr &= "<td>&nbsp; &nbsp;</td>"
            TLCstr &= "<td class='auto-style1'>&nbsp; &nbsp;</td>"
            TLCstr &= " </tr>"
            TLCstr &= "</table>"
            TLCstr &= "<br />"
            TLCstr &= "Global Hospitality Conclave 2019<br /><br />"
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
            SmtpTLCClient.Send(Message)
            SmtpTLCClient.Send(TLCMessage)
            SmtpTLCClient = Nothing

            ''Response.Redirect("Thanku_Frnd.aspx")

        Catch ex As Exception
            Throw New Exception((ex.Message), (ex.InnerException))
            'Response.Write("Check SMTP server. Please Contact with Admin")
        End Try

        Return "success"


        '' begin for dynamically generating mailer
        ''Dim i As Integer = intCount
        ''While i > 2

        'If intCount > 2 And intCount <= 4 Then

        '    If Not String.IsNullOrEmpty(list2(0)) Then
        '        TLCstr &= " <td class='auto-style1'>" & list2(0)
        '    End If

        '    TLCstr &= "</td>"
        '    TLCstr &= "</tr>"
        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Email</td>"
        '    If Not String.IsNullOrEmpty(list2(2)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(2)
        '    End If

        '    TLCstr &= "</tr>"

        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Mobile</td>"
        '    If Not String.IsNullOrEmpty(list2(1)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(1) ''& obj.Mobile '' txtMobile1.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"

        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Batch</td>"
        '    If Not String.IsNullOrEmpty(list2(4)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(4) ''& obj.Batch '' txtBatch1.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"
        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Select</td>"
        '    If Not String.IsNullOrEmpty(list2(5)) And list2(5) <> "Select" Then

        '        TLCstr &= "<td class='auto-style1'>" & list2(5) '' & obj.selectPro '' ddlselect1.SelectedItem.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"
        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Name"
        '    TLCstr &= "</td>"
        '    If Not String.IsNullOrEmpty(list2(6)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(6) ''& obj.FName2 '' txtFName2.Text.Trim()
        '    End If
        '    TLCstr &= " <td class='auto-style1'>"
        '    TLCstr &= "</td>"
        '    TLCstr &= "</tr>"
        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Email</td>"
        '    If Not String.IsNullOrEmpty(list2(8)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(8)  ''& obj.Email2 '' txtEmail2.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"

        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Mobile</td>"
        '    If Not String.IsNullOrEmpty(list2(7)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(7)  ''& obj.Mobile2 '' txtMobile2.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"

        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Batch</td>"
        '    If Not String.IsNullOrEmpty(list2(10)) Then
        '        TLCstr &= "<td class='auto-style1'>" & list2(10) ''& obj.Batch2 '' txtBatch2.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"
        '    TLCstr &= "<tr>"
        '    TLCstr &= "<td>Select</td>"
        '    If Not String.IsNullOrEmpty(list2(11)) And list2(11) <> "Select" Then

        '        TLCstr &= "<td class='auto-style1'>" & list2(11) ''& obj.selectPr2 '' ddlSelect2.SelectedItem.Text & "</td>"
        '    End If

        '    TLCstr &= "</tr>"
        '    'For Each item As String In list1
        '    If list1.Count <= 7 Then
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Name"
        '        TLCstr &= "</td>"
        '        If Not String.IsNullOrEmpty(list1(0)) Then
        '            TLCstr &= " <td class='auto-style1'>" & list1(0)
        '        End If

        '        TLCstr &= "</td>"
        '        TLCstr &= "</tr>"
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Email</td>"
        '        If Not String.IsNullOrEmpty(list1(2)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(2)
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Mobile</td>"
        '        If Not String.IsNullOrEmpty(list1(1)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(1) ''& obj.Mobile '' txtMobile1.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Batch</td>"
        '        If Not String.IsNullOrEmpty(list1(4)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(4) ''& obj.Batch '' txtBatch1.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Select</td>"
        '        If Not String.IsNullOrEmpty(list1(5)) And list1(5) <> "Select" Then

        '            TLCstr &= "<td class='auto-style1'>" & list1(5) '' & obj.selectPro '' ddlselect1.SelectedItem.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"
        '    End If
        '    If list1.Count > 7 And list1.Count <= 13 Then
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Name"
        '        TLCstr &= "</td>"
        '        If Not String.IsNullOrEmpty(list1(0)) Then
        '            TLCstr &= " <td class='auto-style1'>" & list1(0)
        '        End If

        '        TLCstr &= "</td>"
        '        TLCstr &= "</tr>"
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Email</td>"
        '        If Not String.IsNullOrEmpty(list1(2)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(2)
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Mobile</td>"
        '        If Not String.IsNullOrEmpty(list1(1)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(1) ''& obj.Mobile '' txtMobile1.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Batch</td>"
        '        If Not String.IsNullOrEmpty(list1(4)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(4) ''& obj.Batch '' txtBatch1.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Select</td>"
        '        If Not String.IsNullOrEmpty(list1(5)) And list1(5) <> "Select" Then

        '            TLCstr &= "<td class='auto-style1'>" & list1(5) '' & obj.selectPro '' ddlselect1.SelectedItem.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Name"
        '        TLCstr &= "</td>"
        '        If Not String.IsNullOrEmpty(list1(6)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(6) ''& obj.FName2 '' txtFName2.Text.Trim()
        '        End If
        '        TLCstr &= " <td class='auto-style1'>"
        '        TLCstr &= "</td>"
        '        TLCstr &= "</tr>"
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Email</td>"
        '        If Not String.IsNullOrEmpty(list1(8)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(8)  ''& obj.Email2 '' txtEmail2.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Mobile</td>"
        '        If Not String.IsNullOrEmpty(list1(7)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(7)  ''& obj.Mobile2 '' txtMobile2.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"

        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Batch</td>"
        '        If Not String.IsNullOrEmpty(list1(10)) Then
        '            TLCstr &= "<td class='auto-style1'>" & list1(10) ''& obj.Batch2 '' txtBatch2.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"
        '        TLCstr &= "<tr>"
        '        TLCstr &= "<td>Select</td>"
        '        If Not String.IsNullOrEmpty(list1(11)) And list1(11) <> "Select" Then

        '            TLCstr &= "<td class='auto-style1'>" & list1(11) ''& obj.selectPr2 '' ddlSelect2.SelectedItem.Text & "</td>"
        '        End If

        '        TLCstr &= "</tr>"
        '    End If



        '    ''Next
        'End If

        '' i = i - 1
        '' End While

        '' end


    End Function

End Class


