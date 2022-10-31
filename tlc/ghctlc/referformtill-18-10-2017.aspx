<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReferForm.aspx.vb" Inherits="ReferForm" %>

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
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <script src="js/jquery-1.10.2.js"></script>
    <%-- <script src="js/jquery-1.10.2.min.js"></script>--%>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script><a href="index.html">index.html</a>
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

        //autthor: brijesh
        //date: 15/10/2016
        function isNumberKeyAndAllowHypenAndSpace(evt) {
            //debugger;
            var charCode = (evt.which) ? evt.which : event.keyCode
            //alert(charCode);//&& charCode==45) || !(charcode>=48 && charCode <= 57 && charCode==32  //|| (charCode > 32 && charCode < 45 && charCode > 45 && (charCode < 48 || charCode > 57))
            if ((charCode > 32 && (charCode < 45 || charCode >= 46) && (charCode < 48 || charCode > 57))) {
                alert("Please Enter Only Numeric Value with(eg:1988-90)");
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

            //validtion for first name
            name = document.getElementById('txtFName1');
            if (name.value == "") {
                alert('Please enter Name.');
                name.focus();
                return false;
            }

            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtFName1').value;
            if (namelength.length == 0) {
                alert('Please enter Name.');
                document.getElementById('txtFName1').focus();
                return false;
            }
            if (!validatecharacter(namelength)) {
                alert('Please enter a vaild Name.');
                document.getElementById('txtFName1').focus();
                return false;
            }



            //validation for lastname
            //name = document.getElementById('txtLName');
            //if (name.value == "") {
            //    alert('Please enter your Name.');
            //    name.focus();
            //    return false;
            //}

            ////vaildation for Name(For Issue on IE 8 & Chorme  )
            //namelength = document.getElementById('txtLName').value;
            //if (namelength.length == 0) {
            //    alert('Please enter your Name.');
            //    document.getElementById('txtLName').focus();
            //    return false;
            //}
            //if (!validatecharacter(namelength)) {
            //    alert('Please enter a vaild Name.');
            //    document.getElementById('txtLName').focus();
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
            //        alert('Please enter correct Std Code.');
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
            ////When telephone have value but Std code is blank
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

            //When  Std code have value but telephone number is blank
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
            //    if (dayTimePhone.value.length < 6) {
            //        alert('Please enter a valid Telephone Number.');
            //        document.getElementById('txtDayTimeTelePhone').focus();
            //        return false;
            //    }

            //}

            //Mobile And Telephone Number
            Mobile = document.getElementById('txtMobile1');
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
                if (Mobile.value.length <= 13 && Mobile.value.length >=10 ) {

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
            email = document.getElementById('txtEmail1');
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
            email1 = document.getElementById('txtReEmail1');
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

            // batch year validation check on select of Leadership Role
            var selectedText1 = $("#ddlSelect1").find("option:selected").text();
            debugger;
            if (selectedText1 == "" || selectedText1 == "Select") {
                alert("Please select At least one value.");
                return false;
            }
            else{
                if (selectedText1 != "Leadership Role at The Oberoi Group for 10 years or more") {

                    Batch = document.getElementById('txtBatch1');
                    if (Batch.value == "") {
                        alert('Please enter Batch Year.');
                        Batch.focus();
                        return false;
                    }
                    //debugger;
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
                    Batch = document.getElementById('txtBatch1');
                    //debugger;
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

           

            //vaildation for Name(For Issue on IE 8 & Chorme  )
            namelength = document.getElementById('txtFName2').value;
            if (namelength != "") {
                //debugger;
                //if (namelength.length == 0) {
                //    alert('Please enter your Name.');
                //    document.getElementById('txtFName2').focus();
                //    return false;
                //}
                if (!validatecharacter(namelength)) {
                    alert('Please enter a vaild Name.');
                    document.getElementById('txtFName2').focus();
                    return false;
                }

                ////Mobile And Telephone Number referal
                Mobile2 = document.getElementById('txtMobile2');
                if (Mobile2.value == "") {
                    alert('Please enter Mobile Number.');
                    Mobile2.focus();
                    return false;
                }

                if (Mobile2.value != "") {
                    //    //var reg = /^\d{12}$/;
                    //    //var reg =^[1-9][0-9]{9}$;

                    //    //if (reg.test(Mobile.value) == false) {
                    //    //    alert('Please enter your valid Mobile Number.');
                    //    //    Mobile.focus();
                    //    //    return false;
                    //    //}
                    if (Mobile2.value.length <= 13 && Mobile2.value.length >= 10) {

                    }
                    else {
                        alert('Please enter valid Mobile Number.');
                        Mobile2.focus();
                        return false;
                    }

                }

                //Primary Email & Retype Email and referal
                email2 = document.getElementById('txtEmail2');
                if (email2.value == "") {
                    alert('Please enter Email.');
                    email2.focus();
                    return false;
                }
                ////check for Valid Primary Email ID
                if (email2.value != "") {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (reg.test(email2.value) == false) {
                        alert('Please enter a valid Email.');
                        email2.focus();
                        return false;
                    }
                }
                Reemail2 = document.getElementById('txtReEmail2');
                if (Reemail2.value == "") {
                    alert('Please Retype Email.');
                    Reemail2.focus();
                    return false;
                }
                //check for Valid Retype  Email ID
                if (Reemail2.value != "") {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    if (reg.test(Reemail2.value) == false) {
                        alert('Please Retype Email.');
                        Reemail2.focus();
                        return false;
                    }
                }
                //check for  Email ID is mismatch
                if (trimStr(Reemail2.value.toLowerCase()) != trimStr(email2.value.toLowerCase())) {
                    alert("Email Mismatch, Please Re-type Email.");
                    Reemail2.focus();
                    return false;
                }



                // batch year validation check on select of Leadership Role
                var selectedText2 = $("#ddlSelect2").find("option:selected").text();
                debugger;
                if (selectedText2 == "" || selectedText2 == "Select") {
                    alert("Please select At least one value.");
                    return false;
                }
                else
                {
                    if(selectedText2 != "Leadership Role at The Oberoi Group for 10 years or more"){
                    
                        Batch2 = document.getElementById('txtBatch2');
                        if (Batch2.value == "") {
                            alert('Please enter Batch Year.');
                            Batch2.focus();
                            return false;
                        }

                        if (Batch2.value != "") {

                            var reg = /^[1-9]\d*$/;
                            var batchVal = parseInt(Batch2.value);
                            if (reg.test(batchVal) != true) {
                                alert('Please enter valid batch year.');
                                Batch2.focus();
                                return false;
                            }
                        }
                    }
                    else{
                        Batch2 = document.getElementById('txtBatch2');

                        if (Batch2.value != "") {

                            var reg = /^[1-9]\d*$/;
                            var batchVal = parseInt(Batch2.value);
                            if (reg.test(batchVal) != true) {
                                alert('Please enter valid batch year.');
                                Batch2.focus();
                                return false;
                            }
                        }
                    }
                }

                 
            }


            // Check  for checbox
            //var c = document.getElementsByTagName('input');
            //for (var i = 0; i < c.length; i++) {
            //    if (c[i].type == 'checkbox' && c[i].checked == true) {
            //        // At least one checkbox IS checked       
            //        return true;
            //    }
            //}
            // Nothing has been checked   
            //alert("Please accept Terms & Conditions.");
            //return false;


        }

    </script>

    <script type="text/javascript">
        //$.fn.selectInputProgramme = $(function () {
        //    $("#ddlselect1").change(function () {
        //        debugger;
        //        var selectedText = $(this).find("option:selected").text();
        //        if (selectedText == "" || selectedText == "Select") {
        //            alert("Please select At least one value.");
        //            return false;
        //        }
        //        if (selectedText != "") {
        //            return selectedText;

        //        }
        //        else {
        //            return selectedText;
        //        }

        //        //var selectedValue = $(this).val();
        //        //alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        //    });
        //});

        //$(function () {
        //    $("#ddlselect2").change(function () {
        //        debugger;
        //        var selectedText = $(this).find("option:selected").text();
        //        if (selectedText == "" || selectedText == "Select") {
        //            alert("Please select At least on value.");
        //            return false;
        //        }
        //        else if (selectedText != "" && selectedText == "Leadership Role at The Oberoi Group for 10 years or more") {
        //            alert("Batch year cannot be mandatory");

        //        }
        //        else if (selectedText != "") {
        //            alert("Batch year cannot be mandatory.");
        //        }

        //        //var selectedValue = $(this).val();
        //        alert("Selected Text: " + selectedText + " Value: " + selectedValue);
        //    });
        //});

    </script>

    <script type="text/javascript">
        //author name: brijesh Gupta
        //date: 01/10/2016
        //copy to: TLC Group 
        $(document).ready(function () {
            $('#btnSubmit').click(function () {
                
                //debugger;
                var returnValue = Validate();
                // alert(returnValue);
                if (returnValue == false) {
                    return false;

                }
                else {
                    //code for check dynamic validation and ajax post request

                    var count = $('.container .reg-form-frnd').length;
                    //for (var i = count; i > 2; i--) {


                    //    name = document.getElementById('txtFName' + i);
                    //    if (name.value == "") {
                    //        alert('Please enter your Name.');
                    //        name.focus();
                    //        return false;
                    //    }

                    //    //vaildation for Name(For Issue on IE 8 & Chorme  )
                    //    namelength = document.getElementById('txtFName' + i).value;
                    //    if (namelength.length == 0) {
                    //        alert('Please enter your Name.');
                    //        document.getElementById('txtFName' + i).focus();
                    //        return false;
                    //    }
                    //    if (!validatecharacter(namelength)) {
                    //        alert('Please enter a vaild Name.');
                    //        document.getElementById('txtFName' + i).focus();
                    //        return false;
                    //    }



                    //    //Mobile And Telephone Number referal
                    //    Mobile = document.getElementById('txtMobile' + i);
                    //    if (Mobile.value == "") {
                    //        alert('Please enter your Mobile Number.');
                    //        Mobile.focus();
                    //        return false;
                    //    }

                    //    if (Mobile.value != "") {
                    //        //var reg = /^\d{12}$/;
                    //        //var reg =^[1-9][0-9]{9}$;

                    //        //if (reg.test(Mobile.value) == false) {
                    //        //    alert('Please enter your valid Mobile Number.');
                    //        //    Mobile.focus();
                    //        //    return false;
                    //        //}
                    //        if (Mobile.value.length >= 10) {

                    //        }
                    //        else {
                    //            alert('Please enter your valid Mobile Number.');
                    //            Mobile.focus();
                    //            return false;
                    //        }

                    //    }

                    //    //Primary Email & Retype Email and referal
                    //    email = document.getElementById('txtEmail' + i);
                    //    if (email.value == "") {
                    //        alert('Please enter your Email Id.');
                    //        email.focus();
                    //        return false;
                    //    }
                    //    //check for Valid Primary Email ID
                    //    if (email.value != "") {
                    //        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    //        if (reg.test(email.value) == false) {
                    //            alert('Please enter a valid Email Id.');
                    //            email.focus();
                    //            return false;
                    //        }
                    //    }
                    //    email1 = document.getElementById('txtReEmail' + i);
                    //    if (email1.value == "") {
                    //        alert('Please Retype your Email Id.');
                    //        email1.focus();
                    //        return false;
                    //    }
                    //    //check for Valid Retype  Email ID
                    //    if (email1.value != "") {
                    //        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    //        if (reg.test(email1.value) == false) {
                    //            alert('Please Retype your Email Id.');
                    //            email1.focus();
                    //            return false;
                    //        }
                    //    }
                    //    //check for  Email ID is mismatch
                    //    if (trimStr(email1.value.toLowerCase()) != trimStr(email.value.toLowerCase())) {
                    //        alert("Email Id Mismatch, Please Retype your Email Id.");
                    //        email1.focus();
                    //        return false;
                    //    }
                    //}


                    //var jsonObj = [];

                    var strJsonObj1 = "";

                    for (var i = count; i > 2; i--) {
                        //debugger;
                        // i = i + 2;

                        var strFName = $('#txtFName' + i).val() + "&";

                        var strMobile = $('#txtMobile' + i).val() + "&";
                        var strEmail = $('#txtEmail' + i).val() + "&";
                        var strReEmail = $('#txtReEmail' + i).val() + "&";
                        var strBatch = $('#txtBatch' + i).val() + "&";

                        var idselect = $('#ddlselect' + i);
                        var strSelectedtext = $(idselect).find('option:selected').text() + "&";
                        //var strSelectedVal = $(idselect).$('idselect  option:selected').val();

                        strJsonObj1 += $.trim(strFName) + $.trim(strMobile) + $.trim(strEmail) + $.trim(strReEmail) + $.trim(strBatch) + $.trim(strSelectedtext);
                        //alert(strJsonObj1);
                        //alert(strJsonObj1);
                        //    //item = {};
                        //    //item["strFName" + i] = strFName;
                        //    //item["strMobile" + i] = strMobile;  
                        //    //item["strEmail" + i] = strEmail;
                        //    //item["strReEmail" + i] = strReEmail;
                        //    //item["strBatch" + i] = strBatch;
                        //    //item["strSelectedtext" + i] = strSelectedtext;
                        //    //jsonObj.push(item);



                    }

                    //var strJsonObj = "brijesh success";

                    //////// Begin Get static field value using jquery ///////
                    var strJsonObj2 = "";

                    var strFName1 = $('#txtFName1').val() + "&";

                    var strMobile1 = $('#txtMobile1').val() + "&";
                    var strEmail1 = $('#txtEmail1').val() + "&";
                    var strReEmail1 = $('#txtReEmail1').val() + "&";
                    var strBatch1 = $('#txtBatch1').val() + "&";

                    var idselect1 = $('#ddlSelect1');
                    var strSelectedtext1 = $(idselect1).find('option:selected').text() + "&";

                    var strFName2 = $('#txtFName2').val() + "&";

                    var strMobile2 = $('#txtMobile2').val() + "&";
                    var strEmail2 = $('#txtEmail2').val() + "&";
                    var strReEmail2 = $('#txtReEmail2').val() + "&";
                    var strBatch2 = $('#txtBatch2').val() + "&";

                    var idselect2 = $('#ddlSelect2');
                    var strSelectedtext2 = $(idselect2).find('option:selected').text();

                    strJsonObj2 = strFName1 + strMobile1 + strEmail1 + strReEmail1 + strBatch1 + strSelectedtext1 + strFName2 + strMobile2 + strEmail2 + strReEmail2 + strBatch2 + strSelectedtext2;

                    //alert(strJsonObj2);
                    ///////end////////////////////////////////////////////////



                    $.ajax({
                        type: 'POST',
                        url: 'ReferForm.aspx/DynamicallySendMailToBoth',
                        data: "{strJsonObj1:'" + strJsonObj1 + "',count:'" + count + "',strJsonObj2:'" + strJsonObj2 + "'}",
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            //debugger;
                            
                            
                            window.location.href = "Thanku_Frnd.aspx";


                        }

                    });
                    document.getElementById('btnSubmit').disabled = true;
                }



            });

        });
    </script>

    <script type="text/javascript">
        //author name: brijesh Gupta
        //date: 01/10/2016
        //copy to: TLC Group 

        //$(document).ready(function () {

        //    $("#spanAddMore").click(function () {
        //        debugger;
        //        if (($('.container .reg-form-frnd').length + 1) > 4) {

        //            alert("Sorry!You can not refer friends more than 4 times.");
        //            return false;

        //        }

        //        var id = $('.container .reg-form-frnd .row .col-md-12 .frnd-invite .form .form-group').length;
        //        //alert($('.container .reg-form-frnd .row .col-md-12 .frnd-invite .form .form-group').length);
        //        // alert($('#txtFName1').attr('id'));
        //        //alert(document.getElementById('txtFName1'));
        //        var idField = $('input[name="FName"]').attr('id');//txtfname3
        //        var strIDField = "";
        //        if (idField != undefined) {
        //            strIDField = parseInt(idField.substring(8, 9));
        //        }
        //        if (id == 18) {
        //            id = $('#txtFName1').attr('id').substring(8, 9).length + 2;

        //        }
        //        else {

        //            id = strIDField + 1;
        //        }
        //        var res = $('#result').append('<div class="reg-form-frnd"><div class="row"><div class="col-md-12"><div class="frnd-invite"><div class="form"><div class="form-group"><div class="col-sm-6 form-group"><input type="text" name="FName" class="form-control" id="txtFName' + id + '" onkeypress="return isNameAlphabet(event);" placeholder="Name"/></div><div class="col-sm-6 form-group"><input type="text" class="form-control" id="txtMobile' + id + '" onkeypress="return isNumberKey(event);" placeholder="Mobile Number"></div></div><div class="form-group"><div class="col-sm-6 form-group"><input type="email" class="form-control" id="txtEmail' + id + '" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email"/></div><div class="col-sm-6 form-group"><input type="email" class="form-control" id="txtReEmail' + id + '" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email"></div></div><div class="form-group"><div class="col-sm-6 form-group"><input type="text" class="form-control" onkeypress="return isNumberKey(event);" id="txtBatch' + id + '" placeholder="Batch (e.g.1988-90)"/></div><div class="col-sm-6 form-group"><select id="ddlselect' + id + '" class="abc form-control"><option>Select</option><option>Management Trainee</option><option>House Keeping Trainee</option><option>Kitchen and Kitchen Stewarding</option><option>Leadership Role at The Oberoi Group for 10 years or more</option></select></div></div></div></div></div></div></div></div>');

        //        // alert(id);
        //    });

        //    $("#removeButton").click(function () {
        //        debugger;
        //        //alert($('.container .reg-form-frnd').length);
        //        if ($('.container .reg-form-frnd').length == 2) {
        //            alert("No more refer friends field to remove");
        //            return false;
        //        }

        //        $(".container .reg-form-frnd:last").remove();
        //    });

        //});

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
                        <h2>REFER FRIENDS AND COLLEAGUES</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="reg-form-frnd">
                <div class="row">
                    <div class="col-md-12">
                        <div class="frnd-invite">
                            <div class="form">
                                <div class="form-group">
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="text" class="form-control" id="txtFName" onkeypress="return isNameAlphabet(event);" placeholder="Name"/>--%>
                                        <asp:TextBox ID="txtFName1" runat="server" onkeypress="return isNameAlphabet(event);" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="text" class="form-control" id="txtMobile" onkeypress="return isNumberKey(event);" placeholder="Mobile Number">--%>
                                        <asp:TextBox ID="txtMobile1" runat="server" MaxLength="13" CssClass="form-control" onkeypress="return isNumberKey(event);" placeholder="Mobile"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="email" class="form-control" id="txtEmail" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email">--%>
                                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" placeholder="Email"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="email" class="form-control" id="txtReEmail" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email">--%>
                                        <asp:TextBox ID="txtReEmail1" runat="server" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="text" class="form-control" onkeypress="return isNumberKey(event);" id="txtBatch" placeholder="Batch (e.g.1988-90)"/>--%>
                                        <asp:TextBox ID="txtBatch1" runat="server" MaxLength="9" CssClass="form-control" onkeypress="return isNumberKeyAndAllowHypenAndSpace(event);" placeholder="Batch (e.g.1988-90)"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6 form-group">

                                        <%--<select id="ddlselect" class="abc form-control">
                                        <option>Management Trainee</option>
                                        <option>House Keeping Trainee</option>
                                        <option>Kitchen and Kitchen Stewarding</option>
                                        <option>Leadership Role at The Oberoi Group for 10 years or more</option>
                                    </select>--%>
                                        <asp:DropDownList class="abc form-control" ID="ddlSelect1" runat="server">
                                            <asp:ListItem Value="0" Text="Select">Select</asp:ListItem>
                                            <asp:ListItem Value="1" Text="Management Trainee">Management Trainee</asp:ListItem>
                                            <asp:ListItem Value="2" Text="House Keeping Trainee">House Keeping Trainee</asp:ListItem>
                                            <asp:ListItem Value="3" Text="Kitchen">Kitchen</asp:ListItem>
                                            <asp:ListItem Value="4" Text="Kitchen Stewarding">Kitchen Stewarding</asp:ListItem>
                                            <asp:ListItem Value="5" Text="Leadership Role at The Oberoi Group for 10 years or more">Leadership Role at The Oberoi Group for 10 years or more</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="reg-form-frnd">
                <div class="row">
                    <div class="col-md-12">
                        <div class="frnd-invite">
                            <div class="form">
                                <div class="form-group">
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="text" class="form-control" id="inputEmail3" placeholder="Name">--%>
                                        <asp:TextBox ID="txtFName2" runat="server" onkeypress="return isNameAlphabet(event);" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="text" class="form-control" id="inputEmail3" placeholder="Mobile Number">--%>
                                        <asp:TextBox ID="txtMobile2" runat="server" MaxLength="13" CssClass="form-control" onkeypress="return isNumberKey(event);" placeholder="Mobile"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" placeholder="Email"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="email" class="form-control" id="inputEmail3" placeholder="Re-type Email">--%>
                                        <asp:TextBox ID="txtReEmail2" runat="server" CssClass="form-control" onkeypress="return isemailAlphanumeric(event);" placeholder="Re-type Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-6 form-group">
                                        <%--<input type="text" class="form-control" id="inputEmail3" placeholder="Batch (e.g.1988-90)">--%>
                                        <asp:TextBox ID="txtBatch2" runat="server" MaxLength="9" CssClass="form-control" onkeypress="return isNumberKeyAndAllowHypenAndSpace(event);" placeholder="Batch (e.g.1988-90)"></asp:TextBox>
                                    </div>

                                    <div class="col-sm-6 form-group">

                                        <%--<select class="abc form-control">
                                        <option>Management Trainee</option>
                                        <option>House Keeping Trainee</option>
                                        <option>Kitchen and Kitchen Stewarding</option>
                                        <option>Leadership Role at The Oberoi Group for 10 years or more</option>
                                    </select>--%>

                                        <asp:DropDownList class="abc form-control" ID="ddlSelect2" runat="server">
                                            <asp:ListItem Value="0" Text="Select">Select</asp:ListItem>
                                            <asp:ListItem Value="1" Text="Management Trainee">Management Trainee</asp:ListItem>
                                            <asp:ListItem Value="2" Text="House Keeping Trainee">House Keeping Trainee</asp:ListItem>
                                            <asp:ListItem Value="3" Text="Kitchen">Kitchen</asp:ListItem>
                                            <asp:ListItem Value="4" Text="Kitchen Stewarding">Kitchen Stewarding</asp:ListItem>
                                            <asp:ListItem Value="5" Text="Leadership Role at The Oberoi Group for 10 years or more">Leadership Role at The Oberoi Group for 10 years or more</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <%--<div class="icon-frnd">
                        <i class="fa fa-times fa-1x" aria-hidden="true"></i>
                        
                    </div>--%>
                    </div>
                </div>
            </div>
        </div>

        <%-- <div id="result" class="container">
        </div>
        <a href="#" id="removeButton">
            <div class="icon-frnd"><i class="fa fa-times fa-1x" aria-hidden="true"></i></div>
        </a>--%>


        <div class="container">
            <div class="row">
                <%--<a href="#" id="spanAddMore" >
                    <div class="col-md-12">
                        <div class="icon-frnd">
                            <i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i>
                            <span>Add Friends</span>
                        </div>

                    </div>
                </a>--%>
            </div>
        </div>

        <div class="container">
            <div class="registraion-btn">
                <div class="row">
                    <div class="col-md-12">

                        <button type="button" id="btnSubmit" class="btn btn-primary " value="SUBMIT">SUBMIT</button>
                        <%--<asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary" />--%>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
