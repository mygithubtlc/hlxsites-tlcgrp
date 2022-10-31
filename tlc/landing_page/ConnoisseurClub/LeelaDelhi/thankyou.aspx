<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
       
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            If Request.QueryString("name") = Nothing Then
                lbl.Value = "Guest,"
            Else
                lbl.Value = StrConv(Request.QueryString("name") & ",", VbStrConv.ProperCase)
            End If
            'If Request.QueryString("Hotel") = Nothing Then
            '    shotel = ""
           
            'End If
        End If
    End Sub
</script>


<html lang="en">

<head>

    <script src="jquery-1.12.4.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function getParameterByName(name, url) {
            if (!url) {
                url = window.location.href;
            }
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        var strHotel = getParameterByName('htl');
        
        $(document).ready(function () { 
            //$('#hideA').click(function () {
            //    hidebox();
            //    //alert("hide Test");
            //});
            // txtgiftmembername
            // alert( $('#txtGuest', window.parent.document).val());
            //"$("#dvMemmbername").append($('#txtcallbackname', window.parent.document).val());
            // $("#dvMemmbername").append($('#ddlHotel', window.parent.document).val());
            //hoteldetails = $('#Select2', window.parent.document).val();
            //  alert($('#txtgiftmembername', window.parent.document).val());
            // alert($('#Select1', window.parent.document).val());
            debugger;
                if (strHotel == "VelvetClub") {
                var TableReqhelpdeskNo = "+91 11 4908 8662 / 63";
                var TableReqEmail = "cclub.delhi@theleela.com";
                $('#imgProgram').attr('src', '');
                $("#dvHelpdeskNo").html(TableReqhelpdeskNo);
                //$("#dvEmail").html(TableReqEmail);
                $('#hdnBenefitUrl').val("https://www.velvetclubmembership.com/");
                $("#aEmail").html(TableReqEmail);
                $('#aEmail').attr('href', 'mailto:' + TableReqEmail);
                // alert(TableReqEmail);
            }

        });

        //window.setTimeout(function () {
        //    debugger;
        //    var url = $('#hdnBenefitUrl').val();
           
        //    window.location.href = url;
        //}, 5000);

    </script>

    <title>Thank You</title>
    <meta charset="utf-8">
    <link href="bootstrap.min.css" rel="stylesheet">
    <link href="ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <!--[if IE 8 ]> <html class="ie8"> <![endif]-->
    <style>
        input {
            border: 0px;
            border-color: none !important;
            background: none !important;
        }

        .demm {
            width: 724px;
            margin: 0 auto;
        }

        @font-face {
            font-family: myFirstFont;
            src: url(Optima_Normal);
        }

        body {
            font-family: myFirstFont;
            margin: 0px;
            padding: 0px;
        }

        .container {
            max-width: 620px !important;
        }
    </style>

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
    <input  type="hidden" id="hdnBenefitUrl" value="" />
    <div class="container" style="margin-top:25px; border: 1px solid black; padding: 0px 0px 20px 0px;">
        <div class="row">
            <div class="col-md-12">
                <img src="images/Header.jpg" width="650" class="img-responsive"><%--images/header-img-3-724x240.jpg--%>
            </div>
        </div>
        <div class="row pad">
        <table max-width="650" align="center" cellpadding="5" cellspacing="0" style="margin:0 auto;">
                <tr style="text-align: left;">
                     <td  style="text-align: left; width:325px;">
                     <a href="https://www.theleela.com/the-leela/Loyalty/connoisseur-club/Connoisseur%20Club%20The%20Leela%20Ambience%20Convention%20Delhi%20Membership%20Benefits.pdf" target="_blank">
                      <img src="images/conn-logo.png" width="200" style="max-width:100%; display: inline-block; min-width: 73px;">
                      </a> 
                    </td>
                    <td style=" text-align: right; width:325px;">
                    <a href="https://www.theleela.com/en_us/hotels-in-delhi/the-leela-ambience-convention-hotel-delhi/" target="_blank">
                      <img src="images/leeladelhi.jpg" width="105" style="max-width:100%; display: inline-block;">
                    </a>
                    </td>
                </tr>
</table>
        </div>
        <div class="">
            <div class="row" style="padding:15px; font-family:Arial;">
                <div class="col-md-12">
                    <p><b>Dear</b>
                        <input type="text" id="lbl" runat="server" style="width: 350px; font-family: 'Arial' !important; font-weight: bold !important;" readonly /></p>
                    <p>Thank you for your interest in Connoisseur Club.</p>
                    <p>One of our Associates will call you within 24 working hours on the given contact details.</p>
                    <p>We look forward to welcoming you to our hotels.</p>
                    <p>Thank you,</p>
                     
                       <p> <b>Team Connoisseur Club</b><br>
                    </p>
                   
                    <span style="color:#000 !important;">Phone: +91 11 4908 8662 / 63</span>
                    <br />
                    <span style="color:#000 !important; text-decoration:none;">E-mail: <a style="color:#000 !important; text-decoration:none;" href="mailto:cclub.delhi@theleela.com">cclub.delhi@theleela.com</a></span>
                
                   <%--<span style="color:#000 !important;">
                       Phone: <span style="color:#000 !important;" id="dvHelpdeskNo"></span></span>
                  <br/>
                   <span style="color:#000 !important; text-decoration:none;">
                       E-mail: <span style="color:#000 !important; text-decoration:none;">
                           <a style="color:#000 !important; text-decoration:none;" id="aEmail"></a>
                               </span>

                   </span>--%>

                </div>
            </div>
        </div>
    </div>
    <img src='http://a.tribalfusion.com/ti.ad?client=521983&ev=1' width='1' height='1' border='0'>
</body>
</html>
