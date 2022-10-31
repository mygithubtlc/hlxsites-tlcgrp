<%@ Page Language="VB" Debug="true" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>


<script language="VB" runat="SERVER">
    Dim mailtoo, subjct, bodyy, programme As String

    Public Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Page.IsPostBack Then
            mailtoo = Request.QueryString("To")
            programme = Request.QueryString("programme")
            If programme = "" Then
                '  dlabel.Text = " our club and will not receive promotional emails."
            Else
                '  dlabel.Text = " the " & programme & " Network and will not receive promotional emails."
            End If

            If mailtoo = "" Then
                mailtoo = "unsubscribe@tlcgroup.com"
            End If

            subjct = Request.QueryString("subject")
            bodyy = Request.QueryString("body")
            Dim i As Integer = bodyy.IndexOf(" ")
            Dim strmailto As String = bodyy.Substring(6, i - 6)


            'Dim mailmsg As New MailMessage
            'mailmsg.From = mailtoo
            'mailmsg.To = mailtoo
            'mailmsg.Subject = subjct
            'mailmsg.Priority = MailPriority.Low
            'mailmsg.Body = bodyy
            'mailmsg.BodyFormat = MailFormat.Html
            'SmtpMail.Send(mailmsg)


            Dim mailprogram As MailMessage = New MailMessage()

            mailprogram.From = New MailAddress(mailtoo, mailtoo)
            mailprogram.To.Add(New MailAddress(mailtoo, mailtoo))
            mailprogram.CC.Add(New MailAddress("shailendra@tlcgroup.com", "shailendra@tlcgroup.com"))
            mailprogram.CC.Add(New MailAddress("drops@tlcgroup.com", "drops@tlcgroup.com"))
            mailprogram.Subject = subjct
            mailprogram.Body = bodyy
            mailprogram.IsBodyHtml = True

            Dim Smtp As New Net.Mail.SmtpClient()
            Smtp.EnableSsl = False
            Smtp.UseDefaultCredentials = False

            'Smtp.Credentials = New Net.NetworkCredential("info@MX1.crmmails1.com", "Fedyu394#@#78")
            'Smtp.Host = "MX1.crmmails1.com"
            ''Smtp.Host = "smtp8.net4india.com"
            'Smtp.Port = 587
            ''Smtp.Port = 25

            Smtp.Host = "relay-hosting.secureserver.net"
            Smtp.Port = 26


            Smtp.Send(mailprogram)
            Smtp = Nothing

            'InsertUnsubscribeRecord(strmailto, subjct, "Subscribe")

        End If

    End Sub

    Public Function InsertUnsubscribeRecord(mailtoo As String, programme As String, subjct As String) As String


        Dim constr As String = "Data Source=54.227.209.206;user id=sa;password=3Jk7x$Tkhd;initial catalog=MIDATA;"
        'Dim constr As String = "Data Source=202.71.128.144;user id=sa;password=tlcSLS@123;initial catalog=MIDATA;"
        'Dim constr As String = "Data Source=DESKTOP-D9E0CJL;Initial Catalog=tlcsecond;User ID=sa;Password=sls1234"

        Try

            Dim con As SqlConnection = New SqlConnection(constr)
            Dim cmd As SqlCommand = New SqlCommand()
            con.Open()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "insert_unsubscribe"
            cmd.Parameters.AddWithValue("@ToMail", mailtoo)
            cmd.Parameters.AddWithValue("@ProgramName", programme)
            cmd.Parameters.AddWithValue("@Subject", subjct)
            Dim i As Integer = cmd.ExecuteNonQuery()

        Catch ee As SqlException
            Throw New Exception(ee.Message + ee.StackTrace)
        End Try


        Return ""

    End Function
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>unsubscribe</title>
    <style type="text/css">
        @charset "utf-8";

        * {
            margin: 0;
            padding: 0;
        }

        html, ul, li, p, h1, h2, h3, h4, h5, h6, img, a, input, textarea, pre {
            padding: 0;
            margin: 0;
            list-style: none;
            border: none;
            outline: none;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #000;
            padding: 0;
            margin: 0;
            background: #fff;
        }

        .Content-width-page {
            width: 625px;
            margin: auto;
        }

            .Content-width-page img {
                margin-top: 5px;
            }
    </style>
</head>
<body>
    <form id="form1">
        <div class="Content-width-page">
            <img src="images/unsubs-img.jpg" alt="" />
        </div>
    </form>
</body>
</html>
