
Partial Class ThankuReg
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString("Fname") = Nothing Then
                lblFullName.Text = "Guest"
            Else
                lblFullName.Text = StrConv(Request.QueryString("Fname"), VbStrConv.ProperCase)
            End If
            If Request.QueryString("Lname") = Nothing Then
                lblFullName.Text += ","
            Else
                lblFullName.Text += " " & StrConv(Request.QueryString("Lname") & ",", VbStrConv.ProperCase)
            End If
        End If
    End Sub
End Class
