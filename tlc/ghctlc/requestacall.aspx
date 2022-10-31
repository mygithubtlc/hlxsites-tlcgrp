﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="requestacall.aspx.vb" Inherits="requestacall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="bootstrap.min.css" rel="stylesheet">
    <link href="ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-1.10.2.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries ->-
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        function validateNumber(strNum)		// w3school.com
        {
            var pattern = /^([0-9])+/;
            if (pattern.test(strNum)) {
                return true;
            } else {
                return false;
            }
        }
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

        //author: brijesh
        //date: 15/10/2016
        function isNumberKeyAndAllowHypenAndSpace(evt) {
            ////debugger;
            var charCode = (evt.which) ? evt.which : event.keyCode
            //alert(charCode);//&& charCode==45) || !(charcode>=48 && charCode <= 57 && charCode==32  //|| (charCode > 32 && charCode < 45 && charCode > 45 && (charCode < 48 || charCode > 57))
            if ((charCode > 32 && (charCode < 45 || charCode >= 46) && (charCode < 48 || charCode > 57))) {
                alert("Please Enter Only Numeric Value with(eg:1988-99)");
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
            ////debugger;

            //validtion for first name
            name = document.getElementById('txtFName');
            if (name.value == "") {
                alert('Please enter Name.');
                name.focus();
                return false;
            }

            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtFName').value;
            if (namelength.length == 0) {
                alert('Please enter Name.');
                document.getElementById('txtFName').focus();
                return false;
            }
            if (!validatecharacter(namelength)) {
                alert('Please enter a vaild Name.');
                document.getElementById('txtFName').focus();
                return false;
            }

            //validation for lastname
            name = document.getElementById('txtLName');
            if (name.value == "") {
                alert('Please enter Name.');
                name.focus();
                return false;
            }

            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtLName').value;
            if (namelength.length == 0) {
                alert('Please enter Name.');
                document.getElementById('txtLName').focus();
                return false;
            }
            if (!validatecharacter(namelength)) {
                alert('Please enter a vaild Name.');
                document.getElementById('txtLName').focus();
                return false;
            }

            //function toTitleCase(str) {
            //    return str.replace(/\w\S*/g, function (txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(); });
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



            //When  Std code have value but telephone number is blank
            //if (stdcode.value != "" && dayTimePhone.value != "") {
            //    alert(stdcode.value);
            //    if (!validateNumber(document.getElementById('txtDayTimePhone1std').value)) {
            //        alert('Please enter a vaild std code.');
            //        document.getElementById('txtDayTimePhone1std').focus();
            //        return false;
            //    }
            //    if (!validateNumber(document.getElementById('txtDayTimePhone1').value)) {
            //        alert('Please enter a vaild phone number.');
            //        document.getElementById('txtDayTimePhone1').focus();
            //        return false;
            //    }


            //    if ((stdcode.value.length) + (dayTimePhone.value.length) <= 9) {
            //        alert('Please enter a valid dayTime telephone.');
            //        document.getElementById('txtDayTimePhone1').focus();
            //        return false;
            //    }
            //}
            //dayTimePhone = document.getElementById('txtDayTimeTelePhone');
            //stdcode = document.getElementById('txtStdCode');


            //if (dayTimePhone.value == "") {
            //    alert('Please enter your Telephone Number.');
            //    dayTimePhone.focus();
            //    return false;
            //}
            //When telephone have value but Std code is blank
            //if (dayTimePhone.value != "") {

            //    if (dayTimePhone.value.length < 6) {
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


            //Mobile And Telephone Number

            Mobile = document.getElementById('txtMobile');
            if (Mobile.value == "") {
                alert('Please enter Mobile Number.');
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
                if (Mobile.value.length <= 13 && Mobile.value.length >= 10) {

                }
                else {
                    alert('Please enter valid Mobile Number.');
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

            //Primary Email & Retype Email

            email = document.getElementById('txtEmailID1');
            if (email.value == "") {
                alert('Please enter Email.');
                email.focus();
                return false;
            }
            //check for Valid Primary Email ID
            if (email.value != "") {
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if (reg.test(email.value) == false) {
                    alert('Please enter a valid Email.');
                    email.focus();
                    return false;
                }
            }
            email1 = document.getElementById('txtEmailID2');
            if (email1.value == "") {
                alert('Please Re-type Email.');
                email1.focus();
                return false;
            }
            //check for Valid Retype  Email ID
            if (email1.value != "") {
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if (reg.test(email1.value) == false) {
                    alert('Please Re-type Email.');
                    email1.focus();
                    return false;
                }
            }
            //check for  Email ID is mismatch

            if (trimStr(email1.value.toLowerCase()) != trimStr(email.value.toLowerCase())) {
                alert("Email Mismatch, Please Re-type Email.");
                email1.focus();
                return false;
            }


            // Check for at least one checbox
            ////debugger;
            var retValue = $.fn.checkInputProgramme();

            if (retValue == false) {
                return false;
            }
            else {
                if (retValue.indexOf("chkLeadership") != -1) {
                    Batch = document.getElementById('txtBatch');
                    //if (Batch.value == "") {
                    //    alert('Please enter Batch Year.');
                    //    Batch.focus();
                    //    return false;
                    //}
                    ////debugger;
                    if (Batch.value != "") {

                        var reg = /^[1-9]\d*$/;
                        var batchVal = parseInt(Batch.value);
                        if (reg.test(batchVal) != true) {
                            alert('Please enter valid batch year.');
                            Batch.focus();
                            return false;
                        }
                    }
                }
                else {
                    Batch = document.getElementById('txtBatch');
                    if (Batch.value == "") {
                        alert('Please enter Batch/Year.');
                        Batch.focus();
                        return false;
                    }
                    ////debugger;
                    if (Batch.value != "") {

                        var reg = /^[1-9]\d*$/;
                        var batchVal = parseInt(Batch.value);
                        if (reg.test(batchVal) != true) {
                            alert('Please enter valid batch year.');
                            Batch.focus();
                            return false;
                        }
                    }
                }


            }


            //if Evening events is checked

            var chkEveningEvents = document.getElementById("chkEveningEvent")
            if (chkEveningEvents.checked == true) {
                // alert('chkEveningEvent checked');
                //validtion for first name
                EventName = document.getElementById('txtEventName');
                if (EventName.value == "") {
                    alert('Please enter Name.');
                    EventName.focus();
                    return false;
                }

                //vaildation for Name(For Issue on IE 8 & Chorme  )
                EventNamelength = document.getElementById('txtEventName').value;
                if (EventNamelength.length == 0) {
                    alert('Please enter Name.');
                    document.getElementById('txtEventName').focus();
                    return false;
                }
                if (!validatecharacter(EventNamelength)) {
                    alert('Please enter a vaild Name.');
                    document.getElementById('txtEventName').focus();
                    return false;
                }

                //Mobile And Telephone Number
                EventMobile = document.getElementById('txtEventMobile');
                if (EventMobile.value == "") {
                    alert('Please enter Mobile Number.');
                    EventMobile.focus();
                    return false;
                }

                if (EventMobile.value != "") {
                    //var reg = /^\d{12}$/;
                    //var reg =^[1-9][0-9]{9}$;

                    //if (reg.test(Mobile.value) == false) {
                    //    alert('Please enter your valid Mobile Number.');
                    //    Mobile.focus();
                    //    return false;
                    //}
                    if (EventMobile.value.length <= 13 && EventMobile.value.length >= 10) {

                    }
                    else {
                        alert('Please enter valid Mobile Number.');
                        EventMobile.focus();
                        return false;
                    }

                }

                //Primary Email & Retype Email

                EventEmail = document.getElementById('txtEventEmail');
                if (EventEmail.value == "") {
                    alert('Please enter Email.');
                    EventEmail.focus();
                    return false;
                }
                //check for Valid Primary Email ID
                if (EventEmail.value != "") {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (reg.test(EventEmail.value) == false) {
                        alert('Please enter a valid Email.');
                        EventEmail.focus();
                        return false;
                    }
                }
                EventReEmail = document.getElementById('txtEventReEmail');
                if (EventReEmail.value == "") {
                    alert('Please Re-type Email.');
                    EventReEmail.focus();
                    return false;
                }
                //check for Valid Retype  Email ID
                if (EventReEmail.value != "") {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (reg.test(EventReEmail.value) == false) {
                        alert('Please Re-type Email.');
                        EventReEmail.focus();
                        return false;
                    }
                }
                //check for  Email ID is mismatch

                if (trimStr(EventReEmail.value.toLowerCase()) != trimStr(EventEmail.value.toLowerCase())) {
                    alert("Email Mismatch, Please Re-type Email.");
                    EventReEmail.focus();
                    return false;
                }
            }


            //changes by brijesh 07102017
            var chkEveningEvents2 = document.getElementById("chkEveningEvent2")
            if (chkEveningEvents2.checked == true) {
                //alert('chkEveningEvent checked');
                //validtion for first name
                EventName2 = document.getElementById('txtEventName2');
                if (EventName2.value == "") {
                    alert('Please enter Name.');
                    EventName2.focus();
                    return false;
                }

                //vaildation for Name(For Issue on IE 8 & Chorme  )
                //EventNamelength2 = document.getElementById('txtEventName2').value;
                //if (EventNamelength2.length == 0) {
                //    alert('Please enter Name.');
                //    document.getElementById('txtEventName2').focus();
                //    return false;
                //}
                //if (!validatecharacter(EventNamelengt2h)) {
                //    alert('Please enter a vaild Name.');
                //    document.getElementById('txtEventName2').focus();
                //    return false;
                //}

                //Mobile And Telephone Number
                EventMobile2 = document.getElementById('txtEventMobile2');
                if (EventMobile2.value == "") {
                    alert('Please enter Mobile Number.');
                    EventMobile2.focus();
                    return false;
                }

                if (EventMobile2.value != "") {
                    //var reg = /^\d{12}$/;
                    //var reg =^[1-9][0-9]{9}$;

                    //if (reg.test(Mobile.value) == false) {
                    //    alert('Please enter your valid Mobile Number.');
                    //    Mobile.focus();
                    //    return false;
                    //}
                    if (EventMobile2.value.length <= 13 && EventMobile2.value.length >= 10) {

                    }
                    else {
                        alert('Please enter valid Mobile Number.');
                        EventMobile2.focus();
                        return false;
                    }

                }

                //Primary Email & Retype Email

                EventEmail2 = document.getElementById('txtEventEmail2');
                if (EventEmail2.value == "") {
                    alert('Please enter Email.');
                    EventEmail2.focus();
                    return false;
                }
                //check for Valid Primary Email ID
                if (EventEmail2.value != "") {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (reg.test(EventEmail2.value) == false) {
                        alert('Please enter a valid Email.');
                        EventEmail2.focus();
                        return false;
                    }
                }
                EventReEmail2 = document.getElementById('txtEventReEmail2');
                if (EventReEmail2.value == "") {
                    alert('Please Re-type Email.');
                    EventReEmail2.focus();
                    return false;
                }
                //check for Valid Retype  Email ID
                if (EventReEmail2.value != "") {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (reg.test(EventReEmail2.value) == false) {
                        alert('Please Re-type Email.');
                        EventReEmail2.focus();
                        return false;
                    }
                }

                //check for  Email ID is mismatch

                if (trimStr(EventReEmail2.value.toLowerCase()) != trimStr(EventEmail2.value.toLowerCase())) {
                    alert("Email Mismatch, Please Re-type Email.");
                    EventReEmail2.focus();
                    return false;
                }
            }

            //end
            // else {

            //document.getElementById('txtEventName').value="";
            //document.getElementById('txtEventMobile').value="";
            //document.getElementById('txtEventEmail').value="";
            //document.getElementById('txtEventReEmail').value = "";

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

    <script type="text/javascript">
        function DisableButton() {
            document.getElementById("<%=btnSubmit.ClientID%>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            //set initial state.


            $('#chkEveningEvent').change(function () {
                if ($(this).is(":checked")) {
                    $('#divchkEveningEvent2').css('display','block');
                }
            //    else {
                    //document.getElementById('txtEventName').value = "";
                    //document.getElementById('txtEventMobile').value = "";
                    //document.getElementById('txtEventEmail').value = "";
                    //document.getElementById('txtEventReEmail').value = "";
                //}

            });

            $('#chkEveningEvent2').change(function () {
                if ($(this).is(":checked")) {

                }
                else {
                    document.getElementById('txtEventName2').value = "";
                    document.getElementById('txtEventMobile2').value = "";
                    document.getElementById('txtEventEmail2').value = "";
                    document.getElementById('txtEventReEmail2').value = "";
                }

            });
        });
    </script>

    <script type="text/javascript">

        $.fn.checkInputProgramme = function () {
            //debugger;
            var resultText = "";
            var strCheckResult = $('#divAllProgrammeCheckbox input[type="radio"]:checked');

            if (strCheckResult.length == 1) {

                strCheckResult.each(function () {

                    //alert("You have selected checkbox successfully.");
                    resultText += $(this).attr('name') + "-";
                    //if (resultText == "") {

                    //    alert("Please select at least one checkbox item");
                    //}
                    //else {
                    //    alert(resultText);
                    //}



                });
                return resultText;
            }
            else if (strCheckResult.length == 0) {
                alert("Please select at least one option.");
                return false;
            }
            else if (strCheckResult.length > 1) {
                alert("You can not select more than one option.");
                return false;
            }
        };


        function checkLength(el) {

            if (el.value.length >= 1)
                {
                if (el.value.length < 4) {
                    alert("Please enter correct Batch/Year");
                    return true;
                }
            }

            //else (el.value.length >= 8)
            //{
            //    alert("length Max 8 characters");
            //    return true
            //}
        
        }

       

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <img src="images/banner.jpg" class="img-responsive">
                </div>
                <div class="col-md-12">
                    <div class="save-date">
                        <h2>REGISTRATION REQUEST</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="reg-form">

                <div class="">
                    <div class="col-sm-6 form-group">
                        <%--<input type="text" runat="server" onkeypress="return isNameAlphabet(event);" class="form-control" id="txtFName" placeholder="First Name"/>--%>
                        <asp:TextBox ID="txtFName" runat="server" style="text-transform: capitalize;" onkeypress="return isNameAlphabet(event);" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                    </div>
                    <div class="col-sm-6 form-group">
                        <%--<input type="text" id="txtLName" runat="server" onkeypress="return isNameAlphabet(event);" class="form-control"  placeholder="Last Name"/>--%>
                        <asp:TextBox ID="txtLName" runat="server" style="text-transform: capitalize;" onkeypress="return isNameAlphabet(event);" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>
                <div class="">
                    <div class="col-sm-6 form-group">
                        <%--<input type="text" class="form-control" id="txtMobile" runat="server" onkeypress="return isNumberKey(event);" placeholder="Mobile"/>--%>
                        <asp:TextBox ID="txtMobile" MaxLength="13" runat="server" CssClass="form-control" onkeypress="return isNumberKey(event);" placeholder="Mobile"></asp:TextBox>
                    </div>
                    <div class="col-sm-6 form-group">
                        <%--<input type="text" class="form-control" id="txtBatch" runat="server" onkeypress="return isNumberKey(event);" placeholder="Batch (e.g.1988-90)"/>--%>
                        <asp:TextBox ID="txtBatch" runat="server" MaxLength="9"  CssClass="form-control" onblur="checkLength(this)"  onkeypress="return isNumberKeyAndAllowHypenAndSpace(event);" placeholder="Batch/Year (e.g.1988-90)"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6 form-group">
                        <%--<input type="text" class="form-control" id="txtEmailID1" runat="server" onkeypress="return isemailAlphanumeric(event);" placeholder="Email"/>--%>
                        <asp:TextBox ID="txtEmailID1" runat="server" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="col-sm-6 form-group">
                        <%--<input type="text" class="form-control" id="txtEmailID2" runat="server" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email"/>--%>
                        <asp:TextBox ID="txtEmailID2" runat="server" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email"></asp:TextBox>
                    </div>
                </div>

            </div>
        </div>


        <div class="container">
            <div class="check-detail">
                <div class="row">
                    <div id="divAllProgrammeCheckbox">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <%--<input type="checkbox" value="">--%>
                                    <asp:RadioButton GroupName="ChkTest" ID="chkMangTrainee" Text="Management Trainee" runat="server" />

                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <%--<input type="checkbox" value="">--%>
                                    <asp:RadioButton GroupName="ChkTest" ID="chkHouseKeep" Text="House Keeping Trainee" runat="server" />

                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <%--<input type="checkbox" value="">--%>
                                    <asp:RadioButton GroupName="ChkTest" ID="chkKitchen" Text="Kitchen" runat="server" />

                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <%--<input type="checkbox" value="">--%>
                                    <asp:RadioButton GroupName="ChkTest" ID="chkKitStewarding" Text="Kitchen Stewarding" runat="server" />


                                </label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="checkbox">
                                <label>
                                    <%--<input type="checkbox" value="">--%>
                                    <asp:RadioButton GroupName="ChkTest" ID="chkLeadership" Text="Leadership Role at The Oberoi Group for 5 years or more" runat="server" />

                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="reg-form">
                <div class="col-sm-12 form-group">
                    <asp:TextBox ID="txtRemarks" style="text-transform: capitalize;" runat="server" onkeypress="return this.value.length<=200" Rows="2" CssClass="form-control" placeholder="Remarks" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="check-detail-second">
                <div class="row">
                    <%--<div class="col-md-12">
                        <p><b>Please tick on events you will be attending</b></p>
                    </div>--%>
                    <div class="col-md-6" style="width: 100%">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkEveningEvent" runat="server" Text="Guest Registration for the evening events at an additional Registration Fee of Rs 3500." />
                            </label>
                        </div>
                    </div>

                    <div class="reg-form">
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventName" style="text-transform: capitalize;" CssClass="form-control" onkeypress="return isNameAlphabet(event);" runat="server" placeholder="Guest Name"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventMobile" CssClass="form-control" MaxLength="13" onkeypress="return isNumberKey(event);" runat="server" placeholder="Mobile"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventEmail" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" runat="server" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventReEmail" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" runat="server" placeholder="Re-type Email"></asp:TextBox>
                        </div>
                    </div>

                   

                </div>

            </div>



            <%--<div class="col-md-6">

                <div class="checkbox">
                  <label>
                  
                      <asp:CheckBox ID="chkCockTail" Text="Cocktails & Dinner on 6th January, 2017" runat="server" />
                    
                  </label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="checkbox">
                  <label>
                  
                      <asp:CheckBox ID="chkDaySession" Text="Day Session at The Leela Ambience Gurgaon on 7th January, 2017" runat="server" />
                    
                  </label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="checkbox">
                  <label>
            
                      <asp:CheckBox ID="chkCocktailLeela" Text="Cocktails & Dinner at The Leela Ambience Gurgaon on 7th January, 2017" runat="server" />
                    
                  </label>
                </div>
            </div>--%>
        </div>

        <div id="divchkEveningEvent2" class="container" style="display:none;">
            <div class="check-detail-second">
                <div class="row">
                 
                    <div class="col-md-6" style="width: 100%">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkEveningEvent2" runat="server" Text="Guest Registration for the evening events at an additional Registration Fee of Rs 3500." />
                            </label>
                        </div>
                    </div>

                    <div class="reg-form">
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventName2" style="text-transform: capitalize;" CssClass="form-control" onkeypress="return isNameAlphabet(event);" runat="server" placeholder="Guest Name"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventMobile2" CssClass="form-control" MaxLength="13" onkeypress="return isNumberKey(event);" runat="server" placeholder="Mobile"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventEmail2" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" runat="server" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 form-group">
                            <asp:TextBox ID="txtEventReEmail2" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" runat="server" placeholder="Re-type Email"></asp:TextBox>
                        </div>
                    </div>

                   

                </div>

            </div>

        </div>

        <div class="container">
            <div class="registraion-btn">
                <div class="row">
                    <div class="col-md-12">
            
                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClientClick="javascript:return Validate();" CssClass="btn btn-primary" />

                    </div>
                </div>
            </div>
        </div>


    </form>
</body>
</html>
