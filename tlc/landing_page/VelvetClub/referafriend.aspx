<%@ Page Language="VB" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
    End Sub
    
    Protected Sub Submit1_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs)
        '********* UrName and UrTel No**********
        System.Threading.Thread.Sleep(20000)
        Dim vUrName As Object = urname.Value
        Dim vUrTel1 As Object = urtel1.Value
        Dim vUrtel2 As Object = urtel2.Value
        Dim chkServerVal As Boolean = True
        
        
        If vUrName = "" And vUrTel1 = "" And vUrtel2 = "" Then
            lblUrName.Text = "Enter your name"
            lblUrTelNo.Text = "Enter your tel number"
            lblUrName.ForeColor = Drawing.Color.Red
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
        
        If vUrName <> "" And (vUrTel1 = "" Or vUrtel2 = "") Then
            
            lblUrName.Text = ""
            lblUrTelNo.Text = "Enter your tel number"
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vUrName <> "" And (vUrTel1 <> "" And vUrtel2 = "") Then
            lblUrName.Text = ""
            lblUrTelNo.Text = "Enter your tel number"
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vUrName <> "" And (vUrTel1 = "" And vUrtel2 <> "") Then
            lblUrName.Text = ""
            lblUrTelNo.Text = "Enter your tel number"
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vUrTel1 <> "" And vUrtel2 <> "") And vUrName = "" Then
            lblUrName.Text = "Enter your name"
            lblUrName.ForeColor = Drawing.Color.Red
            lblUrTelNo.Text = ""
            chkServerVal = False
            GoTo chk
        End If
              
        If vUrName = "" And (vUrTel1 <> "" And vUrtel2 = "") Then
            lblUrName.Text = "Enter your name"
            lblUrTelNo.Text = "Enter your tel number"
            lblUrName.ForeColor = Drawing.Color.Red
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vUrName = "" And (vUrTel1 = "" And vUrtel2 <> "") Then
            lblUrName.Text = "Enter your name"
            lblUrTelNo.Text = "Enter your tel number"
            lblUrName.ForeColor = Drawing.Color.Red
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vUrName <> "" And vUrTel1 <> "" And vUrtel2 <> "" Then
            lblUrName.Text = ""
            lblUrTelNo.Text = ""
        End If
        
        If Regex.IsMatch(urname.Value.Trim, "[0-9]+") = True Then
            lblUrName.Text = " Enter only alphabet"
            lblUrName.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
        If Regex.IsMatch(urtel1.Value, "[a-zA-Z]+") = True Or Regex.IsMatch(urtel2.Value, "[a-zA-Z]+") = True Then
            lblUrTelNo.Text = "Enter only digits "
            lblUrTelNo.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
                
        '********* Referal Name and Tel No1**********
              
        Dim vRef1 As Object = ref1.Value
        Dim vRef1tel1 As Object = ref1tel1.Value
        Dim vRef1tel2 As Object = ref1tel2.Value
           
        If vRef1 <> "" And (vRef1tel1 = "" Or vRef1tel2 = "") Then
            lblRef1.Text = ""
            lblRef1Tel.Text = "Enter Referral TelNo1"
            lblRef1Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef1 <> "" And (vRef1tel1 <> "" And vRef1tel2 = "") Then
            lblRef1.Text = ""
            lblRef1Tel.Text = "Enter Referral TelNo1"
            lblRef1Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef1 <> "" And (vRef1tel1 = "" And vRef1tel2 <> "") Then
            lblRef1.Text = ""
            lblRef1Tel.Text = "Enter Referral TelNo1"
            lblRef1Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef1tel1 <> "" And vRef1tel2 <> "") And vRef1 = "" Then
            lblRef1.Text = "Enter Referral Name1"
            lblRef1Tel.Text = ""
            lblRef1.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef1 = "" And (vRef1tel1 <> "" And vRef1tel2 = "") Then
            lblRef1.Text = "Enter Referral Name1"
            lblRef1Tel.Text = "Enter Referral TelNo1"
            lblRef1.ForeColor = Drawing.Color.Red
            lblRef1Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef1 = "" And (vRef1tel1 = "" And vRef1tel2 <> "") Then
            lblRef1.Text = "Enter Referral Name1"
            lblRef1Tel.Text = "Enter Referral TelNo1"
            lblRef1.ForeColor = Drawing.Color.Red
            lblRef1Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vRef1 <> "" And vRef1tel1 <> "" And vRef1tel2 <> "" Then
            lblRef1.Text = ""
            lblRef1Tel.Text = ""
        End If
        
        If Regex.IsMatch(ref1.Value.Trim, "[0-9]+") = True Then
            lblRef1.Text = " Enter only alphabet"
            lblRef1.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
        If Regex.IsMatch(vRef1tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef1tel2, "[a-zA-Z]+") = True Then
            lblRef1Tel.Text = "Enter only digits "
            lblRef1Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
 

        '********* Referal Name and Tel No2**********
        
        Dim vRef2 As Object = ref2.Value
        Dim vRef2tel1 As Object = ref2tel1.Value
        Dim vRef2tel2 As Object = ref2tel2.Value
        chkServerVal = True
      
        If vRef2 <> "" And (vRef2tel1 = "" Or vRef2tel2 = "") Then
            lblRef2.Text = ""
            lblRef2Tel.Text = "Enter Referral TelNo2"
            lblRef2Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef2 <> "" And (vRef2tel1 <> "" And vRef2tel2 = "") Then
            lblRef2.Text = ""
            lblRef2Tel.Text = "Enter Referral TelNo2"
            lblRef2Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef2 <> "" And (vRef2tel1 = "" And vRef2tel2 <> "") Then
            lblRef2.Text = ""
            lblRef2Tel.Text = "Enter Referral TelNo2"
            lblRef2Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef2tel1 <> "" And vRef2tel2 <> "") And vRef2 = "" Then
            lblRef2.Text = "Enter Referral Name2"
            lblRef2Tel.Text = ""
            lblRef2.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef2 = "" And (vRef2tel1 <> "" And vRef2tel2 = "") Then
            lblRef2.Text = "Enter Referral Name2"
            lblRef2Tel.Text = "Enter Referral TelNo2"
            lblRef2.ForeColor = Drawing.Color.Red
            lblRef2Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef2 = "" And (vRef2tel1 = "" And vRef2tel2 <> "") Then
            lblRef2.Text = "Enter Referral Name2"
            lblRef2Tel.Text = "Enter Referral TelNo2"
            lblRef2.ForeColor = Drawing.Color.Red
            lblRef2Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vRef2 <> "" And vRef2tel1 <> "" And vRef2tel2 <> "" Then
            lblRef2.Text = ""
            lblRef2Tel.Text = ""
        End If
        
        If Regex.IsMatch(ref2.Value.Trim, "[0-9]+") = True Then
            lblRef2.Text = " Enter only alphabet"
            lblRef2.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
        If Regex.IsMatch(vRef2tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef2tel2, "[a-zA-Z]+") = True Then
            lblRef2Tel.Text = "Enter only digits "
            lblRef2Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
        '********* Referal Name and Tel No3 **********
        
        Dim vRef3 As Object = ref3.Value
        Dim vRef3tel1 As Object = ref3tel1.Value
        Dim vRef3tel2 As Object = ref3tel2.Value
        chkServerVal = True
      
        If vRef3 <> "" And (vRef3tel1 = "" Or vRef3tel2 = "") Then
            lblRef3.Text = ""
            lblRef3Tel.Text = "Enter Referral TelNo3"
            lblRef3Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef3 <> "" And (vRef3tel1 <> "" And vRef3tel2 = "") Then
            lblRef3.Text = ""
            lblRef3Tel.Text = "Enter Referral TelNo3"
            lblRef3Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef3 <> "" And (vRef3tel1 = "" And vRef3tel2 <> "") Then
            lblRef3.Text = ""
            lblRef3Tel.Text = "Enter Referral TelNo3"
            lblRef3Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef3tel1 <> "" And vRef3tel2 <> "") And vRef3 = "" Then
            lblRef3.Text = "Enter Referral Name3"
            lblRef3Tel.Text = ""
            lblRef3.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef3 = "" And (vRef3tel1 <> "" And vRef3tel2 = "") Then
            lblRef3.Text = "Enter Referral Name3"
            lblRef3Tel.Text = "Enter Referral TelNo3"
            lblRef3.ForeColor = Drawing.Color.Red
            lblRef3Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef3 = "" And (vRef3tel1 = "" And vRef3tel2 <> "") Then
            lblRef3.Text = "Enter Referral Name3"
            lblRef3Tel.Text = "Enter Referral TelNo3"
            lblRef3.ForeColor = Drawing.Color.Red
            lblRef3Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
        If vRef3 <> "" And vRef3tel1 <> "" And vRef3tel2 <> "" Then
            lblRef3.Text = ""
            lblRef3Tel.Text = ""
        End If
        
        
        If Regex.IsMatch(ref3.Value.Trim, "[0-9]+") = True Then
            lblRef3.Text = " Enter only alphabet"
            lblRef3.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        

        
        If Regex.IsMatch(vRef3tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef3tel2, "[a-zA-Z]+") = True Then
            lblRef3Tel.Text = "Enter only digits "
            lblRef3Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If


        
        
        '********* Referal Name and Tel No4 **********
        
        Dim vRef4 As Object = ref4.Value
        Dim vRef4tel1 As Object = ref4tel1.Value
        Dim vRef4tel2 As Object = ref4tel2.Value
        chkServerVal = True
      
        If vRef4 <> "" And (vRef4tel1 = "" Or vRef4tel2 = "") Then
            lblRef4.Text = ""
            lblRef4Tel.Text = "Enter Referral TelNo4"
            lblRef4Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef4 <> "" And (vRef4tel1 <> "" And vRef4tel2 = "") Then
            lblRef4.Text = ""
            lblRef4Tel.Text = "Enter Referral TelNo4"
            lblRef4Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef4 <> "" And (vRef4tel1 = "" And vRef4tel2 <> "") Then
            lblRef4.Text = ""
            lblRef4Tel.Text = "Enter Referral TelNo4"
            lblRef4Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef4tel1 <> "" And vRef4tel2 <> "") And vRef4 = "" Then
            lblRef4.Text = "Enter Referral Name4"
            lblRef4Tel.Text = ""
            lblRef4.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef4 = "" And (vRef4tel1 <> "" And vRef4tel2 = "") Then
            lblRef4.Text = "Enter Referral Name4"
            lblRef4Tel.Text = "Enter Referral TelNo4"
            lblRef4.ForeColor = Drawing.Color.Red
            lblRef4Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef4 = "" And (vRef4tel1 = "" And vRef4tel2 <> "") Then
            lblRef4.Text = "Enter Referral Name4"
            lblRef4Tel.Text = "Enter Referral TelNo4"
            lblRef4.ForeColor = Drawing.Color.Red
            lblRef4Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vRef4 <> "" And vRef4tel1 <> "" And vRef4tel2 <> "" Then
            lblRef4.Text = ""
            lblRef4Tel.Text = ""
        End If
        
        If Regex.IsMatch(ref4.Value.Trim, "[0-9]+") = True Then
            lblRef4.Text = " Enter only alphabet"
            lblRef4.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If


        
        If Regex.IsMatch(vRef4tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef4tel2, "[a-zA-Z]+") = True Then
            lblRef4Tel.Text = "Enter only digits "
            lblRef4Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        '********* Referal Name and Tel No5 **********
        
        Dim vRef5 As Object = ref5.Value
        Dim vRef5tel1 As Object = ref5tel1.Value
        Dim vRef5tel2 As Object = ref5tel2.Value
        chkServerVal = True
      
        If vRef5 <> "" And (vRef5tel1 = "" Or vRef5tel2 = "") Then
            lblRef5.Text = ""
            lblRef5Tel.Text = "Enter Referral TelNo5"
            lblRef5Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef5 <> "" And (vRef5tel1 <> "" And vRef5tel2 = "") Then
            'lblRef5.Text = ""
            lblRef5Tel.Text = "Enter Referral TelNo5"
            lblRef5Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef5 <> "" And (vRef5tel1 = "" And vRef5tel2 <> "") Then
            lblRef5.Text = ""
            lblRef5Tel.Text = "Enter Referral TelNo5"
            lblRef5Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef5tel1 <> "" And vRef5tel2 <> "") And vRef5 = "" Then
            lblRef5.Text = "Enter Referral Name5"
            lblRef5Tel.Text = ""
            lblRef5.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef5 = "" And (vRef5tel1 <> "" And vRef5tel2 = "") Then
            lblRef5.Text = "Enter Referral Name5"
            lblRef5Tel.Text = "Enter Referral TelNo5"
            lblRef5.ForeColor = Drawing.Color.Red
            lblRef5Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef5 = "" And (vRef5tel1 = "" And vRef5tel2 <> "") Then
            lblRef5.Text = "Enter Referral Name5"
            lblRef5Tel.Text = "Enter Referral TelNo5"
            lblRef5.ForeColor = Drawing.Color.Red
            lblRef5Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vRef5 <> "" And vRef5tel1 <> "" And vRef5tel2 <> "" Then
            lblRef5.Text = ""
            lblRef5Tel.Text = ""
        End If
       
        
        If Regex.IsMatch(ref5.Value.Trim, "[0-9]+") = True Then
            lblRef5.Text = " Enter only alphabet"
            lblRef5.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
        If Regex.IsMatch(vRef5tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef5tel2, "[a-zA-Z]+") = True Then
            lblRef5Tel.Text = "Enter only digits "
            lblRef5Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
        '*********************
        
        '********* Referal Name and Tel No6 **********
        
        Dim vRef6 As Object = ref6.Value
        Dim vRef6tel1 As Object = ref6tel1.Value
        Dim vRef6tel2 As Object = ref6tel2.Value
        chkServerVal = True
      
        If vRef6 <> "" And (vRef6tel1 = "" Or vRef6tel2 = "") Then
            lblRef6.Text = ""
            lblRef6Tel.Text = "Enter Referral TelNo6"
            lblRef6Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef6 <> "" And (vRef6tel1 <> "" And vRef6tel2 = "") Then
            'lblRef5.Text = ""
            lblRef6Tel.Text = "Enter Referral TelNo6"
            lblRef6Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef6 <> "" And (vRef6tel1 = "" And vRef6tel2 <> "") Then
            lblRef6.Text = ""
            lblRef6Tel.Text = "Enter Referral TelNo6"
            lblRef6Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef6tel1 <> "" And vRef6tel2 <> "") And vRef6 = "" Then
            lblRef6.Text = "Enter Referral Name6"
            lblRef6Tel.Text = ""
            lblRef6.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef6 = "" And (vRef6tel1 <> "" And vRef6tel2 = "") Then
            lblRef6.Text = "Enter Referral Name6"
            lblRef6Tel.Text = "Enter Referral TelNo6"
            lblRef6.ForeColor = Drawing.Color.Red
            lblRef6Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef6 = "" And (vRef6tel1 = "" And vRef6tel2 <> "") Then
            lblRef6.Text = "Enter Referral Name6"
            lblRef6Tel.Text = "Enter Referral TelNo6"
            lblRef6.ForeColor = Drawing.Color.Red
            lblRef6Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vRef6 <> "" And vRef6tel1 <> "" And vRef6tel2 <> "" Then
            lblRef6.Text = ""
            lblRef6Tel.Text = ""
        End If
       
        
        If Regex.IsMatch(ref6.Value.Trim, "[0-9]+") = True Then
            lblRef6.Text = " Enter only alphabet"
            lblRef6.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
        If Regex.IsMatch(vRef6tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef6tel2, "[a-zA-Z]+") = True Then
            lblRef6Tel.Text = "Enter only digits "
            lblRef6Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
        '*********************
        
        '********* Referal Name and Tel No7 **********
        
        Dim vRef7 As Object = ref7.Value
        Dim vRef7tel1 As Object = ref7tel1.Value
        Dim vRef7tel2 As Object = ref7tel2.Value
        chkServerVal = True
      
        If vRef7 <> "" And (vRef7tel1 = "" Or vRef7tel2 = "") Then
            lblRef7.Text = ""
            lblRef7Tel.Text = "Enter Referral TelNo7"
            lblRef7Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
     
        If vRef7 <> "" And (vRef7tel1 <> "" And vRef7tel2 = "") Then
            'lblRef5.Text = ""
            lblRef7Tel.Text = "Enter Referral TelNo7"
            lblRef7Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                    
        If vRef7 <> "" And (vRef7tel1 = "" And vRef7tel2 <> "") Then
            lblRef7.Text = ""
            lblRef7Tel.Text = "Enter Referral TelNo7"
            lblRef7Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                       
        If (vRef7tel1 <> "" And vRef7tel2 <> "") And vRef7 = "" Then
            lblRef7.Text = "Enter Referral Name7"
            lblRef7Tel.Text = ""
            lblRef7.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
              
        If vRef7 = "" And (vRef7tel1 <> "" And vRef7tel2 = "") Then
            lblRef7.Text = "Enter Referral Name7"
            lblRef7Tel.Text = "Enter Referral TelNo7"
            lblRef7.ForeColor = Drawing.Color.Red
            lblRef7Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
                  
        If vRef7 = "" And (vRef7tel1 = "" And vRef7tel2 <> "") Then
            lblRef7.Text = "Enter Referral Name7"
            lblRef7Tel.Text = "Enter Referral TelNo7"
            lblRef7.ForeColor = Drawing.Color.Red
            lblRef7Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        If vRef7 <> "" And vRef7tel1 <> "" And vRef7tel2 <> "" Then
            lblRef7.Text = ""
            lblRef7Tel.Text = ""
        End If
       
        
        If Regex.IsMatch(ref7.Value.Trim, "[0-9]+") = True Then
            lblRef7.Text = " Enter only alphabet"
            lblRef7.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If

        
        If Regex.IsMatch(vRef7tel1, "[a-zA-Z]+") = True Or Regex.IsMatch(vRef7tel2, "[a-zA-Z]+") = True Then
            lblRef7Tel.Text = "Enter only digits "
            lblRef7Tel.ForeColor = Drawing.Color.Red
            chkServerVal = False
            GoTo chk
        End If
        
        '*********************
        
           
                
        Dim strhtmlbody As String
        strhtmlbody = " <table runat=" & "server" & " borderColor= #C2CDB6 cellSpacing=1 cellPadding=1 width= 600 align=center border= 3 >"
        strhtmlbody = strhtmlbody & "<tr> <td> Your Name </td> <td> " & StrConv(urname.Value, VbStrConv.ProperCase) & "</td> <td>" & " Your Tel Number" & "</td> <td>" & urtel1.Value & " - " & urtel2.Value & "</td> </tr>"
       
        If ref1.Value <> "" And ref1tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 1  </td> <td> " & StrConv(ref1.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref1tel1.Value & " - " & ref1tel2.Value & "</td> </tr>"
        End If
      
        If ref2.Value <> "" And ref2tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 2  </td> <td> " & StrConv(ref2.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref2tel1.Value & " - " & ref2tel2.Value & "</td> </tr>"
        End If
        
        If ref3.Value <> "" And ref3tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 3  </td> <td> " & StrConv(ref3.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref3tel1.Value & " - " & ref3tel2.Value & "</td> </tr>"
        End If
        
        If ref4.Value <> "" And ref4tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 4  </td> <td> " & StrConv(ref4.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref4tel1.Value & " - " & ref4tel2.Value & "</td> </tr>"
        End If
        
        If ref5.Value <> "" And ref5tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 5  </td> <td> " & StrConv(ref5.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref5tel1.Value & " - " & ref5tel2.Value & "</td> </tr>"
        End If
        If ref6.Value <> "" And ref6tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 6  </td> <td> " & StrConv(ref6.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref6tel1.Value & " - " & ref6tel2.Value & "</td> </tr>"
        End If
        If ref7.Value <> "" And ref7tel2.Value <> "" Then
            strhtmlbody = strhtmlbody & "<tr> <td> Referral's Name 7  </td> <td> " & StrConv(ref7.Value, VbStrConv.ProperCase) & "</td> <td>" & " Daytime Tel Number" & "</td> <td>" & ref7tel1.Value & " - " & ref7tel2.Value & "</td> </tr>"
        End If
        
        strhtmlbody = strhtmlbody & "</table>"
        
           
        Dim message As MailMessage = New MailMessage()
        message.From = New MailAddress("velvetclub@tlcgroup.com", "Velvet Club") ''velvetclub@tlcgroup.com
        message.To.Add(New MailAddress("velvetclub@tlcgroup.com", "Velvet Club"))
        ''message.To.Add(New MailAddress("vijay.bisht@tlcgroup.com", "vijay.bisht@tlcgroup.com"))         
        '' message.CC.Add(New Net.Mail.MailAddress("shailendra@tlcgroup.com", "shailendra@tlcgroup.com"))
        'message.CC.Add(New Net.Mail.MailAddress("kamini.sharma@tlcgroup.com", "kamini.sharma@tlcgroup.com"))
        'message.CC.Add(New Net.Mail.MailAddress("drops@tlcgroup.com", "drops@tlcgroup.com"))
        'message.CC.Add(New Net.Mail.MailAddress("digitaloffice@tlcgroup.com", "digitaloffice@tlcgroup.com"))

        'message.CC.Add(New Net.Mail.MailAddress("brijesh.gupta@tlcgroup.com", "brijesh.gupta@tlcgroup.com"))
        message.Subject = "Velvet Club - Refer A Friend"
        message.Body = strhtmlbody
        message.IsBodyHtml = True

           
        
        Dim Smtp As New SmtpClient()
        Dim SmtpUser As New System.Net.NetworkCredential("mail@tlc.in", "tlcgroup")
        ''setting smtpuser to smtpclient
        Smtp.Host = " smtpauth.tlc.in"
        Smtp.DeliveryMethod = SmtpDeliveryMethod.Network
        Smtp.UseDefaultCredentials = False
        Smtp.Credentials = SmtpUser
        Smtp.Port = 587
        Smtp.Send(message)
    
        'trhtmlbody = "~/tlc/contactus/Refthanks.aspx?Name=" & StrConv(urname.Value.Trim, VbStrConv.ProperCase) & "&Title= &Program=Preferred At The Park."
        'Response.Redirect(strhtmlbody)
  
  
chk:
        If chkServerVal = True Then
            '   Response.Write(strhtmlbody)
        Else
          
        End If
        
       
            
    End Sub

   
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Join / Refer a Friend</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/0dd1e4698e.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">
    <script  type="text/javascript">
    
    
    
    
function newImage(arg) {

	if (document.images) {

		rslt = new Image();

		rslt.src = arg;

		return rslt;
	}
}
function changeImages() {

	if (document.images && (preloadFlag == true)) {

		for (var i=0; i<changeImages.arguments.length; i+=2) {

			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];

		}

	}

}
var preloadFlag = false;

function preloadImages() {

	if (document.images) {

		side_banner_09_side_banner_15_over = newImage("participate2/side_banner_09-side_banner_.jpg");

		side_banner_09_side_banner_16_over = newImage("participate2/side_banner_09-side_bann-06.jpg");

		side_banner_09_side_banner_17_over = newImage("participate2/side_banner_09-side_bann-07.jpg");

		side_banner_09_side_banner_18_over = newImage("participate2/side_banner_09-side_bann-08.jpg");

		side_banner_09_side_banner_22_over = newImage("participate2/side_banner_09-side_bann-09.jpg");

		side_banner_09_side_banner_23_over = newImage("participate2/side_banner_09-side_bann-10.jpg");

		side_banner_09_side_banner_24_over = newImage("participate2/side_banner_09-side_bann-11.jpg");

		side_banner_09_side_banner_25_over = newImage("participate2/side_banner_09-side_bann-12.jpg");

		side_banner_15_over = newImage("participate2/side_banner_15-over.gif");

		side_banner_16_over = newImage("participate2/side_banner_16-over.gif");

		side_banner_17_over = newImage("participate2/side_banner_17-over.gif");

		side_banner_18_over = newImage("participate2/side_banner_18-over.gif");

		side_banner_22_over = newImage("participate2/side_banner_22-over.gif");

		side_banner_23_over = newImage("participate2/side_banner_23-over.gif");

		side_banner_24_over = newImage("participate2/side_banner_24-over.gif");

		side_banner_25_over = newImage("participate2/side_banner_25-over.gif");

		preloadFlag = true;

	}

}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}




function Validate()
{

//    return false;
}

function isnumeric(evt)    //numeric validations
{
var charCode = (evt.which) ? evt.which : event.keyCode         
if (charCode > 31 && (charCode < 48 || charCode > 57) )  // for numeric validations
    {                       
           return false;
    }   
return true;
}



function isAlphabet(evt) //alphabets
{

  UrName1 = document.getElementById('urname').value;
  
//  if(UrName1=="")
//  {
//  alert('Your name can not be blank');
//  
//  }
  
var charCode = (evt.which) ? evt.which : event.keyCode
if (charCode==32 || charCode==8)
    return true; 
if (charCode > 31 && (charCode < 91 && charCode > 64))       //for alphabets
    return true;
if (charCode > 31 && (charCode < 123 && charCode > 96) )      // for alphabets
{           
    return true;
}              
return false;
//return false;                      
}


    </script>
    <script  type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script  type="text/javascript" src="js/jquery-latest.js"></script>
    
    

<script type="text/javascript">
            $(document).ready(function () {
                $("#Submit1").click(function () {
                    UrName1 = document.getElementById('urname').value;
                    UrTel12 = document.getElementById('urtel1').value;
                    UrTel22 = document.getElementById('urtel2').value;
                    // alert(UrName1);
                    if (UrName1 == "") {
                        alert("Your Name can not be Blank!");
                        document.getElementById('urname').focus();
                        return false;
                    }
                    if (UrTel12 == "") {
                        alert("Area Code can not be Blank!");
                        document.getElementById('urtel1').focus();
                        return false;
                    }
                    if (UrTel22 == "") {
                        alert("Telephone No. can not be Blank!");
                        document.getElementById('urtel2').focus();
                        return false;
                    }


                    //********* Referal Name and Tel No1**********

                    ref1 = document.getElementById('ref1').value;
                    ref1tel1 = document.getElementById('ref1tel1').value;
                    ref1tel2 = document.getElementById('ref1tel2').value;


                    if (ref1 == "") {
                        alert("Your Referral Name can not be Blank!");
                        document.getElementById('ref1').focus();
                        return false;
                    }
                    if (ref1tel1 == "") {
                        alert("Referral Area Code can not be Blank!");
                        document.getElementById('ref1tel1').focus();
                        return false;
                    }
                    if (ref1tel2 == "") {
                        alert("Referral Telephone No. can not be Blank!");
                        document.getElementById('ref1tel2').focus();
                        return false;
                    }



                    if (ref1 != "" && (ref1tel1 == "" || ref1tel2 == "")) {
                        alert('Please enter DayTime Tel Number1')
                        document.getElementById('ref1tel1').focus();
                        return false;
                    }
                    if (ref1 != "" && (ref1tel1 != "" && ref1tel2 == "")) {
                        alert('Please enter DayTime Tel Number1')
                        document.getElementById('ref1tel1').focus();
                        return false;
                    }
                    if (ref1 != "" && (ref1tel1 == "" && ref1tel2 != "")) {
                        alert('Please enter DayTime Tel Number1')
                        document.getElementById('ref1tel1').focus();
                        return false;
                    }
                    if ((ref1tel1 != "" && ref1tel2 != "") && ref1 == "") {
                        alert('Please enter Referrals Name1')
                        document.getElementById('ref1').focus();
                        return false;
                    }

                    if (ref1 == "" && (ref1tel1 != "" && ref1tel2 == "")) {
                        alert('Please enter Referrals Name1 and  DayTime Tel Number1')
                        document.getElementById('ref1').focus();
                        return false;
                    }

                    if (ref1 == "" && (ref1tel1 == "" && ref1tel2 != "")) {
                        alert('Please enter Referrals Name1 and DayTime Tel Number1')
                        document.getElementById('ref1').focus();
                        return false;
                    }



                    //********* Referal Name and Tel No2**********

                    ref2 = document.getElementById('ref2').value;
                    ref2tel1 = document.getElementById('ref2tel1').value;
                    ref2tel2 = document.getElementById('ref2tel2').value;

                    if (ref2 != "" && (ref2tel1 == "" || ref2tel2 == "")) {
                        alert('Please enter DayTime Tel Number2')
                        document.getElementById('ref2tel1').focus();
                        return false;
                    }
                    if (ref2 != "" && (ref2tel1 != "" && ref2tel2 == "")) {
                        alert('Please enter DayTime Tel Number2')
                        document.getElementById('ref2tel1').focus();
                        return false;
                    }
                    if (ref2 != "" && (ref2tel1 == "" && ref2tel2 != "")) {
                        alert('Please enter DayTime Tel Number2')
                        document.getElementById('ref2tel1').focus();
                        return false;
                    }
                    if ((ref2tel1 != "" && ref2tel2 != "") && ref2 == "") {
                        alert('Please enter Referrals Name2')
                        document.getElementById('ref2').focus();
                        return false;
                    }

                    if (ref2 == "" && (ref2tel1 != "" && ref2tel2 == "")) {
                        alert('Please enter Referrals Name2 and  DayTime Tel Number2')
                        document.getElementById('ref2').focus();
                        return false;
                    }

                    if (ref2 == "" && (ref2tel1 == "" && ref2tel2 != "")) {
                        alert('Please enter Referrals Name2 and DayTime Tel Number2')
                        document.getElementById('ref2').focus();
                        return false;
                    }



                    //********* Referal Name and Tel No3**********  

                    ref3 = document.getElementById('ref3').value;
                    ref3tel1 = document.getElementById('ref3tel1').value;
                    ref3tel2 = document.getElementById('ref3tel2').value;


                    if (ref3 != "" && (ref3tel1 == "" || ref3tel2 == "")) {
                        alert('Please enter DayTime Tel Number3')
                        document.getElementById('ref3tel1').focus();
                        return false;
                    }
                    if (ref3 != "" && (ref3tel1 != "" && ref3tel2 == "")) {
                        alert('Please enter DayTime Tel Number3')
                        document.getElementById('ref3tel1').focus();
                        return false;
                    }
                    if (ref3 != "" && (ref3tel1 == "" && ref3tel2 != "")) {
                        alert('Please enter DayTime Tel Number3')
                        document.getElementById('ref3tel1').focus();
                        return false;
                    }
                    if ((ref3tel1 != "" && ref3tel2 != "") && ref3 == "") {
                        alert('Please enter Referrals Name3')
                        document.getElementById('ref3').focus();
                        return false;
                    }

                    if (ref3 == "" && (ref3tel1 != "" && ref3tel2 == "")) {
                        alert('Please enter Referrals Name3 and  DayTime Tel Number3')
                        document.getElementById('ref3').focus();
                        return false;
                    }

                    if (ref3 == "" && (ref3tel1 == "" && ref3tel2 != "")) {
                        alert('Please enter Referrals Name3 and DayTime Tel Number3')
                        document.getElementById('ref3').focus();
                        return false;
                    }



                    //********* Referal Name and Tel No4**********

                    ref4 = document.getElementById('ref4').value;
                    ref4tel1 = document.getElementById('ref4tel1').value;
                    ref4tel2 = document.getElementById('ref4tel2').value;


                    if (ref4 != "" && (ref4tel1 == "" || ref4tel2 == "")) {
                        alert('Please enter DayTime Tel Number4')
                        document.getElementById('ref4tel1').focus();
                        return false;
                    }
                    if (ref4 != "" && (ref4tel1 != "" && ref4tel2 == "")) {
                        alert('Please enter DayTime Tel Number4')
                        document.getElementById('ref4tel1').focus();
                        return false;
                    }
                    if (ref4 != "" && (ref4tel1 == "" && ref4tel2 != "")) {
                        alert('Please enter DayTime Tel Number4')
                        document.getElementById('ref4tel1').focus();
                        return false;
                    }
                    if ((ref4tel1 != "" && ref4tel2 != "") && ref4 == "") {
                        alert('Please enter Referrals Name4')
                        document.getElementById('ref4').focus();
                        return false;
                    }

                    if (ref4 == "" && (ref4tel1 != "" && ref4tel2 == "")) {
                        alert('Please enter Referrals Name4 and  DayTime Tel Number4')
                        document.getElementById('ref4').focus();
                        return false;
                    }

                    if (ref4 == "" && (ref4tel1 == "" && ref4tel2 != "")) {
                        alert('Please enter Referrals Name4 and DayTime Tel Number4')
                        document.getElementById('ref4').focus();
                        return false;
                    }
                    //********* Referal Name and Tel No5**********

                    ref5 = document.getElementById('ref5').value;
                    ref5tel1 = document.getElementById('ref5tel1').value;
                    ref5tel2 = document.getElementById('ref5tel2').value;

                    if (ref5 != "" && (ref5tel1 == "" || ref5tel2 == "")) {
                        alert('Please enter DayTime Tel Number5')
                        document.getElementById('ref5tel1').focus();
                        return false;
                    }
                    if (ref5 != "" && (ref5tel1 != "" && ref5tel2 == "")) {
                        alert('Please enter DayTime Tel Number5')
                        document.getElementById('ref5tel1').focus();
                        return false;
                    }
                    if (ref5 != "" && (ref5tel1 == "" && ref5tel2 != "")) {
                        alert('Please enter DayTime Tel Number5')
                        document.getElementById('ref5tel1').focus();
                        return false;
                    }
                    if ((ref5tel1 != "" && ref5tel2 != "") && ref5 == "") {
                        alert('Please enter Referrals Name5')
                        document.getElementById('ref5').focus();
                        return false;
                    }

                    if (ref5 == "" && (ref5tel1 != "" && ref5tel2 == "")) {
                        alert('Please enter Referrals Name5 and  DayTime Tel Number5')
                        document.getElementById('ref5').focus();
                        return false;
                    }

                    if (ref5 == "" && (ref5tel1 == "" && ref5tel2 != "")) {
                        alert('Please enter Referrals Name5 and DayTime Tel Number5')
                        document.getElementById('ref5').focus();
                        return false;
                    }

                    //********* Referal Name and Tel No6**********

                    ref6 = document.getElementById('ref6').value;
                    ref6tel1 = document.getElementById('ref6tel1').value;
                    ref6tel2 = document.getElementById('ref6tel2').value;

                    if (ref6 != "" && (ref6tel1 == "" || ref6tel2 == "")) {
                        alert('Please enter DayTime Tel Number6')
                        document.getElementById('ref6tel1').focus();
                        return false;
                    }
                    if (ref6 != "" && (ref6tel1 != "" && ref6tel2 == "")) {
                        alert('Please enter DayTime Tel Number6')
                        document.getElementById('ref6tel1').focus();
                        return false;
                    }
                    if (ref6 != "" && (ref6tel1 == "" && ref6tel2 != "")) {
                        alert('Please enter DayTime Tel Number6')
                        document.getElementById('ref6tel1').focus();
                        return false;
                    }
                    if ((ref6tel1 != "" && ref6tel2 != "") && ref6 == "") {
                        alert('Please enter Referrals Name6')
                        document.getElementById('ref6').focus();
                        return false;
                    }

                    if (ref6 == "" && (ref6tel1 != "" && ref6tel2 == "")) {
                        alert('Please enter Referrals Name6 and  DayTime Tel Number6')
                        document.getElementById('ref6').focus();
                        return false;
                    }

                    if (ref6 == "" && (ref6tel1 == "" && ref6tel2 != "")) {
                        alert('Please enter Referrals Name6 and DayTime Tel Number6')
                        document.getElementById('ref6').focus();
                        return false;
                    }

                    //********* Referal Name and Tel No7**********

                    ref7 = document.getElementById('ref7').value;
                    ref7tel1 = document.getElementById('ref7tel1').value;
                    ref7tel2 = document.getElementById('ref7tel2').value;

                    if (ref7 != "" && (ref7tel1 == "" || ref7tel2 == "")) {
                        alert('Please enter DayTime Tel Number7')
                        document.getElementById('ref7tel1').focus();
                        return false;
                    }
                    if (ref7 != "" && (ref7tel1 != "" && ref7tel2 == "")) {
                        alert('Please enter DayTime Tel Number7')
                        document.getElementById('ref7tel1').focus();
                        return false;
                    }
                    if (ref7 != "" && (ref7tel1 == "" && ref7tel2 != "")) {
                        alert('Please enter DayTime Tel Number7')
                        document.getElementById('ref7tel1').focus();
                        return false;
                    }
                    if ((ref7tel1 != "" && ref7tel2 != "") && ref7 == "") {
                        alert('Please enter Referrals Name7')
                        document.getElementById('ref7').focus();
                        return false;
                    }

                    if (ref7 == "" && (ref7tel1 != "" && ref7tel2 == "")) {
                        alert('Please enter Referrals Name7 and  DayTime Tel Number7')
                        document.getElementById('ref7').focus();
                        return false;
                    }

                    if (ref7 == "" && (ref7tel1 == "" && ref7tel2 != "")) {
                        alert('Please enter Referrals Name7 and DayTime Tel Number7')
                        document.getElementById('ref7').focus();
                        return false;
                    }

                    var value = $("#urname").val();
                    $("#lbl").html(value);
                    $("div.popup").show(1);
                });

                $("p.Right").click(function () {
                    $("div.popup").hide(1);
                    location.reload(true);
                });
            });
</script>
    <link href="css/linkstxt.css" rel="stylesheet" type="text/css" />
    <link href="css/links_nav.css" rel="stylesheet" type="text/css" />

    <script  type="text/javascript" src="~/lib.js"></script>
    

        <script>
            window.foo = function () {
                //  alert('page 1 is executing this code');
                $("#dialog").dialog('close');
            }
            //$(function () {
            //    $('body').append('<iframe src="iframeContent.html"></iframe>');
            //});
    </script>
<style type="text/css">
form {
    margin: auto;
    width: 800px;
}
body{margin:0;}
div.popup {
    background: none repeat scroll 0 0 #f8f8f8;
    border-radius: 8px;
    box-shadow: 0 0 5px #000;
    color: #cacaca !important;
    display: none;
    height:420px;
    left: 402px;
    position: absolute;
    top: 22%;
    width: 540px;
    z-index: 999999;
}
div.popup p{padding:10px; color:#000;}
.popup p {
    padding: 0 0 0 10px !important;
}


div.popup p.Right {
    bottom: 0;
    color: #000;
    cursor: pointer;
    margin-right: 10px;
    padding: 0 !important;
    position: absolute;
    right: 0;
}
.popup > img{padding:10px 10px 0 10px;}
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000" onload="preloadImages();" link="#CC9933" vlink="#996600"
    alink="#CC9933">
    <form id="form1" runat="server">
           <asp:ScriptManager id="sr1" runat ="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="up1" runat="server">
            <ContentTemplate>

  <div class="container">
      <div class="header-detail">    
      <div class="row">
          <div class="col-sm-12 col-sm-12 col-xs-12">
            <img src="images/Header.jpg" class="img-responsive">
          </div>
      </div>
      </div>

         <!-- logo -->
      <div class="logo-detail">
      <div class="row">
          <div class="col-sm-4 col-sm-4 col-xs-4 logo1">
            <img src="images/velvet_club.png" class="img-responsive">
          </div>
          <div class="col-sm-4 col-sm-4 col-xs-4">
          </div>
          <div class="col-sm-4 col-sm-4 col-xs-4">
            <img src="images/lusaka.png" class="img-responsive logo2">
          </div>
      </div>
    </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-sm-12"><p style="padding: 20px;">Thank you for participating in our Referral Program. This allows us to offer you benefits for recommending members. Please complete the table below with names and contact number of your friends and family who you believe dine out often enough and will benefit from the membership of Velvet Club.</p></div>
  </div>
  <div class="row">
    <div class="col-sm-12">
        <ul>
            <li>On four(4) successful referrals, we will send a Velvet Club membership package of Neelkanth Sarovar Premiere, Lusaka to any individual of your choice.</li>
            <li>One (1) certificate entitling the Member to a 5% reward on a successful banquet referral for a minimum of Zmw1200 or USD 1000/- in the form of F&B vouchers.</li>
        </ul>
    </div>        
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Your Name*</label>
                <div class="col-sm-8">
                     <input name="urname" class="form-control" type="text" placeholder="Your Name"
                            onkeypress="javascript:return isAlphabet(event);" id="urname" runat="server" />
                        <asp:Label ID="lblUrName" runat="server"></asp:Label>
                
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">  Your Tel Number*</label>
                <div class="col-sm-3">
                    <input name="urtel1"  type="text" class="form-control" placeholder="Number" id="urtel1" onkeypress="javascript:return isnumeric(event);"
                            maxlength="4" runat="server" />
                 
                
                </div>
                 <div class="col-sm-5">
                      <input name="urtel2" class="form-control" type="text" placeholder="Number" id="urtel2" onkeypress="javascript:return isnumeric(event);"
                            maxlength="10" runat="server" />
                    
                        <asp:Label ID="lblUrTelNo" runat="server"></asp:Label>
                 
                  
                </div>
              </div>

        </div>
    </div>
  </div>
   <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 1</label>
                <div class="col-sm-8">
                    <input name="ref1" type="text" class="form-control" id="ref1" placeholder="Your Name" maxlength="100" onkeypress="javascript:return isAlphabet(event);"
                            runat="server" />
                       
                        <asp:Label ID="lblRef1" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">
                     <input name="ref1tel1"  type="text" class="form-control"  id="ref1tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" placeholder="Number" runat="server" />
                        
                       
                  

                </div>
                 <div class="col-sm-5">
                      <input name="ref1tel2" class="form-control" type="text" placeholder="Number" id="ref1tel2" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
                       
                        <asp:Label ID="lblRef1Tel" runat="server"></asp:Label>
                  
                  
                </div>
              </div>

        </div>
    </div>
  </div>

   <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 2</label>
                <div class="col-sm-8">
                     <input name="ref2"  type="text" placeholder="Your Name" class="form-control" id="ref2"
                            maxlength="100" onkeypress="javascript:return isAlphabet(event);" runat="server" />
                        <asp:Label ID="lblRef2" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">

                    <input name="ref2tel1"  type="text" class="form-control" placeholder="Number" id="ref2tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
                        
                  

                </div>
                 <div class="col-sm-5">
                      <input name="ref2tel2" type="text" class="form-control" id="ref2tel2" placeholder="Number" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
                        <asp:Label ID="lblRef2Tel" runat="server"></asp:Label>
                  
                  
                </div>
              </div>

        </div>
    </div>
  </div>
   <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 3</label>
                <div class="col-sm-8">
                    <input name="ref3" type="text" class="form-control" id="ref3"
                            maxlength="100" onkeypress="javascript:return isAlphabet(event);" placeholder="Your Name" runat="server" />
                        <asp:Label ID="lblRef3" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">
                     <input name="ref3tel1" class="form-control" placeholder="Number" type="text" id="ref3tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
                       
                  
                </div>
                 <div class="col-sm-5">
                     <input name="ref3tel2" type="text" class="form-control"  id="ref3tel2" placeholder="Number" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
                        <asp:Label ID="lblRef3Tel" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
    </div>
  </div>
   <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 4</label>
                <div class="col-sm-8">
                     <input name="ref4" type="text" class="form-control" id="ref4"
                            maxlength="100" onkeypress="javascript:return isAlphabet(event);" placeholder="Your Name" runat="server" />
                        <asp:Label ID="lblRef4" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">
                     <input name="ref4tel1" class="form-control" type="text" placeholder="Number" id="ref4tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
                     
                </div>
                 <div class="col-sm-5">
                        <input name="ref4tel2" type="text" class="form-control" id="ref4tel2" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" placeholder="Number" runat="server" />
                        <asp:Label ID="lblRef4Tel" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
    </div>
  </div>
   <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 5</label>
                <div class="col-sm-8">
                    <input name="ref5" type="text" class="form-control" placeholder="Your Name" id="ref5"
                            maxlength="100" onkeypress="javascript:return isAlphabet(event);" runat="server" />
                        <asp:Label ID="lblRef5" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">

                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">
                     <input name="ref5tel1" class="form-control" type="text" placeholder="Number" id="ref5tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
             
                        
             

                </div>
                 <div class="col-sm-5">
                     <input name="ref5tel2" type="text" class="form-control" id="ref5tel2" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" placeholder="Number" runat="server" />
                        <asp:Label ID="lblRef5Tel" runat="server"></asp:Label>
                 
                </div>
              </div>

        </div>
    </div>
  </div>

    <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 6</label>
                <div class="col-sm-8">
                    <input name="ref6" type="text" class="form-control" placeholder="Your Name" id="ref6"
                            maxlength="100" onkeypress="javascript:return isAlphabet(event);" runat="server" />
                        <asp:Label ID="lblRef6" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">

                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">
                     <input name="ref6tel1" class="form-control" type="text" placeholder="Number" id="ref6tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
             
                        
             

                </div>
                 <div class="col-sm-5">
                     <input name="ref6tel2" type="text" class="form-control" id="ref6tel2" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" placeholder="Number" runat="server" />
                        <asp:Label ID="lblRef6Tel" runat="server"></asp:Label>
                 
                </div>
              </div>

        </div>
    </div>
  </div>

    <div class="row">
    <div class="col-sm-6">
      <div class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal">Referral's Name 7</label>
                <div class="col-sm-8">
                    <input name="ref7" type="text" class="form-control" placeholder="Your Name" id="ref7"
                            maxlength="100" onkeypress="javascript:return isAlphabet(event);" runat="server" />
                        <asp:Label ID="lblRef7" runat="server"></asp:Label>
                  
                </div>
              </div>

        </div>
     
    </div>
    <div class="col-sm-6">
    <div class="form-horizontal">
              <div class="form-group">

                <label for="inputEmail3" class="col-sm-4 control-label ui-refereal"> Daytime Tel Number</label>
                <div class="col-sm-3">
                     <input name="ref7tel1" class="form-control" type="text" placeholder="Number" id="ref7tel1" maxlength="4"
                            onkeypress="javascript:return isnumeric(event);" runat="server" />
             
                        
             

                </div>
                 <div class="col-sm-5">
                     <input name="ref7tel2" type="text" class="form-control" id="ref7tel2" maxlength="10"
                            onkeypress="javascript:return isnumeric(event);" placeholder="Number" runat="server" />
                        <asp:Label ID="lblRef7Tel" runat="server"></asp:Label>
                 
                </div>
              </div>

        </div>
    </div>
  </div>
          <div class="row">
            <div class="col-sm-12">
                <input name="Submit" type="submit" class="btn bnt-primary center-block"
                            value="Submit" id="Submit1" onserverclick="Submit1_ServerClick" runat="server" />
             
            </div>
          </div>
</div>

            </ContentTemplate>
        </asp:UpdatePanel>
        
            <div class="popup">
            <img src="images/Header.jpg" alt="" />
                <p class="font-verdana" style="text-align: justify">
                        <p style="font-weight:bold !important;" class="font">Dear <label><asp:label id="lbl" runat="server"></asp:label>,</label></p>
                        <p class="font">Thank you for your interest in <span>Velvet Club</span> !</p>
                        <p class="font">One of our Associates will call you within 24 hours on the given contact details.</p>
                        <p class="font">We look forward to welcoming you to our hotel.</p>
                        <p class="font">Thank you,</p>
                      <p class="font">Team <span >Velvet Club</span></p>
                    </p>
                    <p class="Right">X</p>
            <div style="clear:both;"></div>
            </div>
       
    </form>
</body>
</html>
