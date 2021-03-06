<%-- 
    Document   : fundtransfer
    Created on : Jun 17, 2020, 2:33:46 PM
    Author     : Habeeb O. Lawal
--%>
<%-- 
    Document   : airtimeanddata
    Created on : Jun 16, 2020, 9:50:42 AM
    Author     : Habeeb O. Lawal
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/*    .effect{
        margin-left : -600px;
        background-color: #808080;
    }*/
</style>
<div>
        
    
    <div class="mt-3 row">
        <div class="col-6">
        <form id="fundTransferForm" style="color:" action="#!">
            <div class="row">
            <div class="card effect" style="width: 35rem;">
                <div class="card-header">Transfer Form</div>
                <div class="card-body">         
                    <div class="md-form">
<!--                        <i class="fas fa-user prefix" style="color:orange"></i>-->
                        <input type="hidden" id="username" name="username" value="${username}" class="form-control" disabled>
                        <label for="username"></label>
                        <div class="text-danger" id="username_error"></div>
                    </div>
                        
                    <div class="md-form">
<!--                        <i class="fas fa-user prefix" style="color:orange"></i>-->
                        <input type="hidden" id="companycode" name="companycode" value="${companycode}" class="form-control" disabled>
                        <label for="companycode"></label>
                        <div class="text-danger" id="companycode_error"></div>
                    </div>
                        
                                <div class="md-form col-12">
                                      <input type="hidden" id="src_accountnumber" value="${walletNumber}" class="form-control">
                                      <!--<label for="src_accountnumber" id="src_accountnumber_L"><i class="far fa-address-card mx-1"></i>Src Account Number</label>-->
                                      <div class="text-white" id="src_accountnumber_error"></div>
                                </div>
                                <div class="md-form col-12">
                                    <input type="hidden" id="src_accountname" value="${firstname} ${lastname}" class="form-control">
                                    <!--<label for="src_accountname" id="src_accountname_L"><i class="far fa-user mx-1"></i>Src Account Name</label>-->
                                    <div class="text-white" id="src_accountname_error"></div>
                                </div>
                            
                  
                            
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="text" id="beneficiary_accountnumber" class="form-control">
                                      <label for="beneficiary_accountnumber" id="beneficiary_accountnumber_L"><i class="fas fa-money-check mx-1"></i>Beneficiary Account Number</label>
                                      <div class="text-white" id="beneficiary_accountnumber_error"></div>
                                </div>
                                
                            
                            
                            
                            
                                
                                <div class="md-form col-12 my-1 py-1">
                                    <select class="browser-default custom-select usertypes mb-2" id="bank">
                                        <option value="" disabled selected>SELECT BANK</option>
                                        <c:forEach begin="0" end="${getFinancialInstitutionLength -1}" var="i">
                                            <option value="${getFinancialInstitution.getJSONObject(i).get("bankcode")}" id="bankbankcode">${getFinancialInstitution.getJSONObject(i).getString("bankname")}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            
                            
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="amount" class="form-control">
                                    <label for="amount" id="amount_L"><i class="fas fa-money-check mx-1"></i>Amount</label>
                                    <div class="text-white" id="amount_error"></div>
                                </div>
                            
                            
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="narration" class="form-control">
                                    <label for="narration" id="narration_L"><i class="far fa-envelope mx-1"></i>Narration</label>
                                    <div class="text-white" id="narration_error"></div>
                                </div>
                                <input type="checkbox" id="" class="" value="">Save beneficiary
                </div>
                <div class="card-footer">
                    <div class="row">
                        <button type="button" class="btn btn-success fund_transfer" style="margin-left: 200px" id="">Transfer</button><div id="spinner"></div>
<!--                      <button type="button" class="btn btn-primary" id="editUser">Save</button><div id="spinner"></div>-->
                      <div class="transfer_success_message"></div>
                    </div>
                </div>
            </div>
            </div>
        </form>                           
        </div>
                <div class="col-6">
                    <div class="card">
                    <div class="card-header">Last 5 Transaction</div>
                    <div class="card-body my-1 py-1 mx-0 px-0">
                    <table class="table table-striped table-hover table-sm">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>Account No.</th>
                                <th>Account Name</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th class="d-none">Narration</th>
                                <th class="d-none">icode</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${Last5TransactionLength > 0}">
                                     <c:forEach var="i" begin="0" end="${Last5TransactionLength -1}">
                                    
                                        <tr class="" id="">
                                            <td class="text-center">${i + 1}</td>
                                            <td class="">${Last5Transaction.getJSONObject(i).getString("beneficiaryaccountnumber")}</td>
                                            <td>${Last5Transaction.getJSONObject(i).getString("beneficiaryname")}</td>
                                            <td>${Last5Transaction.getJSONObject(i).getString("amount")}</td>
                                            <td>${fn:substring(Last5Transaction.getJSONObject(i).getString("transactiondate"), 0, 10)}</td>
                                            <td class="d-none">${Last5Transaction.getJSONObject(i).getString("narration")}</td>
                                            <td class="d-none">${Last5Transaction.getJSONObject(i).getString("destinationInstitutionCode")}</td>
                                            <td><button class="btn btn-amber btn-sm btn_repay_transaction">RePay</button></td>
                                        </tr>
                                        </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <h3 class="mx-2">No Previous Transaction</h3>
                                </c:otherwise>
                            </c:choose>         
                        </tbody>
                    </table>
                    </div>
                    </div>
                </div>
<!--        <form id="buyTransferForm" style="color:" action="#!">
            <div class="card effect" style="width: 35rem;">
                <div class="card-body"> 
                    <div class="border">
                        <div class="mx-3">
                        <p><label for="image">Choose File</label></p> 
                        <input type="hidden" name="uploader" id="uploader" value="${username}" />
                        <input type="hidden" name="uploader" id="companycode" value="${companycode}" />
                        <p><input name="file" accept=".csv" id="fileToUpload" type="file" /></p>  
                        <p><input type="button" id="upload_btn" value="Upload"></p>
                        </div>
                    </div>
                    <span class="responseStatus"></span>    
            </div>
            </div>
        </form>-->
    </div>
</div>
                        
                        
<script>
//    $(document).ready(function(){
//        $('.effect').animate({'margin-left' : '250px'}, 1000, 'linear');
//    });
    $("#buyTransferForm").hide();
    $(".singleFundTransfer").click(function () {
        $(".singleFundTransfer").removeClass("bg-white").addClass("bg-light");
        $(".bulkFundTransfer").removeClass("bg-light").addClass("bg-white");
        $("#buyTransferForm").hide();
        $("#fundTransferForm").show();
    });
    $(".bulkFundTransfer").click(function () {
        $(".singleFundTransfer").removeClass("bg-light").addClass("bg-white");
        $(".bulkFundTransfer").removeClass("bg-white").addClass("bg-light");
        $("#buyTransferForm").show();
       $("#fundTransferForm").hide();
    });
    
    
    $('.fund_transfer').click(function(e) {
        let url = "${pageContext.request.contextPath}/sendfundtransfer";
        e.preventDefault();
        //let errorcheck = validatePaymentForm();
        //if(!(errorcheck.includes("error"))) {
            $(".fund_transfer").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $(".fund_transfer").html(spinner);
            let srcAccountNumber = $("#src_accountnumber").val();
            let srcAccountName = $("#src_accountname").val();
            let beneficiaryAccountNumber = $("#beneficiary_accountnumber").val();
            let username = $("#username").val();
            let amount = $("#amount").val();
            let narration = $("#narration").val();
            let companyCode = $("#companycode").val();
            let beneficiaryFinancialInstitutionCode = $("#bank").val();
            //let companycode = "${companycode}";
            let credentials = {
                "username" : username,
                "sourceAccountNumber" : srcAccountNumber,
                "sourceAccountName" : srcAccountName,
                "beneficiaryAccountNumber" : beneficiaryAccountNumber,
                "beneficiaryDestinationInstitutionCode" : beneficiaryFinancialInstitutionCode,
                "amount" : amount,
                "narration" : narration,
                "walletBalance":"${walletBalance}",
                "companycode" : companyCode
            };

            $.ajax({
                method: "POST",
                url: url,
                data: credentials,
                beforeSend: function (xhr) {
                        console.log(credentials);
                },
                success: function(response){
                    if(response === "00"){
                        $(".fund_transfer").html("Transfer");
                        $(".fund_transfer").attr("disabled", false);
                        $(".transfer_success_message").html("Transfer successfull").addClass("alert alert-succes");
                        document.getElementById("fundTransferForm").reset();
                        setTimeout(function() {
                           $(".transfer_success_message").html(""); 
                        }, 3000);
                           
                    }
                    else if(response === "51"){
                        $(".fund_transfer").html("Transfer");
                        $(".fund_transfer").attr("disabled", false);
                        $(".transfer_success_message").html("Insufficient Balance").addClass("text-danger");
                        document.getElementById("fundTransferForm").reset();
                        setTimeout(function() {
                           $(".transfer_success_message").html(""); 
                        }, 8000);
                           
                    }
                    else{
                       $(".fund_transfer").html("Transfer");
                       $(".fund_transfer").attr("disabled", false);
                       $(".transfer_success_message").html("Error: Transfer Failed! Try Again").addClass("alert alert-danger"); 
                    }
                }
            });	
        //}
    });
    
    $(".btn_repay_transaction").click(function() {
        let url = "${pageContext.request.contextPath}/sendfundtransfer";
            values = [];
            let username = $("#username").val();
            let beneficiaryAccountNumber;
            let beneficiaryDestinationInstitutionCode;
            let amount;
            let narration;
            let parent1 = $(this).parent();
            let parent2 = parent1.parent();
            parent2.children().each(function() {
               let cellText = $(this).html();
               values.push(cellText);
               beneficiaryAccountNumber = values[1];
               amount = values[3];
               narration = values[5];
               beneficiaryDestinationInstitutionCode = values[6];
            });
            //amount = amount.slice(0, -3);
            let spinner = `<i class="fa fa-spinner fa-spin" aria-hidden="true" style="color:white; font-size:20px;"></i>`;
            $(this).html(spinner);
            console.log("username " + username +"beneficiaryAccountNumber " + beneficiaryAccountNumber + "amount "+ amount);
            let credentials = {
                "username" : username,
                "sourceAccountNumber" : ${walletNumber},
                "sourceAccountName" : "${firstname} ${lastname}",
                "beneficiaryAccountNumber" : beneficiaryAccountNumber,
                "beneficiaryDestinationInstitutionCode" : beneficiaryDestinationInstitutionCode,
                "amount" : amount,
                "narration" : narration,
                "walletBalance":"${walletBalance}",
                "companycode" : "${companycode}"
            };

            $.ajax({
                method: "POST",
                url: url,
                data: credentials,
                beforeSend: function (xhr) {
                        console.log(credentials);
                    },
                success: function(response){
                    console.log(response);
                    if(response === "00") {
                        alert("Transaction successfull");
                        $(".btn_repay_transaction").html("RePay");
                    }
                    else if (response === "51") {
                        $(".btn_repay_transaction").html("RePay");
                        alert("Insuficient Balance");
                    }
                    else{
                        $(".btn_repay_transaction").html("RePay");
                        alert("Transaction Failed");
                    }
                }
            });
    });

    
    function validateTransferForm(){
    let error = [];
    let srcAccountNumber = $("#src_accountnumber").val();
    let srcAccountName = $("#src_accountname").val();
    let beneficiaryAccountNumber = $("#beneficiary_accountnumber").val();
    let username = $("#username").val();
    let amount = $("#amount").val();
    let narration = $("#narration").val();
    let companyCode = $("#companycode").val();
    let beneficiaryFinancialInstitutionCode = $("#bank").val();
   
    if((srcAccountNumber === "" || srcAccountNumber === undefined) && (srcAccountName === "" || srcAccountName === undefined)&& (beneficiaryAccountNumber === "" || beneficiaryAccountNumber === undefined) && (beneficiaryAccountName === "" || beneficiaryAccountName === undefined) && (amount === "" || amount === undefined)&& (narration === "" || narration === undefined)&& (beneficiaryPhoneNumber === "" || beneficiaryPhoneNumber === undefined)&& (beneficiaryFinancialInstitutionCode === "" || beneficiaryFinancialInstitutionCode === undefined)) {
        error.push("error");
        $("#src_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#amount_error").html("Field cannot be empty").addClass("bg-danger");
        $("#narration_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_phonenumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_institution_error").html("Field cannot be empty").addClass("bg-danger");
        //return error;
    }
    else if(srcAccountNumber === "" || srcAccountNumber === undefined) {
        error.push("error");
        $("#src_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountname_error").html(" ");
        $("#vendor_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
        //return error;
    }
    else if(srcAccountName === "" || srcAccountName === undefined) {
        error.push("error");
        $("#src_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountnumber_error").html("");
        $("#vendor_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
        //return error;
    }
    else if(beneficiaryAccountNumber === "" || beneficiaryAccountNumber === undefined) {
        error.push("error");
        $("#vendor_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountname_error").html("");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
        //return error;
    }
    else if(amount === "" || amount === "undefined") {
        error.push("error");
        $("#amount_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("");
        $("#src_accountname_error").html("");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
    }
    else if(narration === "" || narration === undefined) {
        error.push("error");
        $("#narration_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");   
    }
    else if(beneficiaryPhoneNumber === "" || beneficiaryPhoneNumber === undefined || beneficiaryPhoneNumber.length < 10) {
        error.push("error");
        $("#vendor_phonenumber_error").html("Phonenumber not valid").addClass("bg-danger");
        $("#narration_error").html("");
        $("#vendor_accountnumber_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#narration_error").html(" ");
        $("#src_accountnumber_error").html(" ");
        $("#amount_error").html(" ");
        $("#vendor_institution_error").html(" ");
    }
    else if(beneficiaryFinancialInstitutionCode === "" || beneficiaryFinancialInstitutionCode === undefined) {
        error.push("error");
        $("#vendor_institution_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("");
        $("#vendor_phonenumber_error").html(" ");
        $("#narration_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#src_accountnumber_error").html(" ");
        $("#amount_error").html(" ");
    }
    else if(beneficiaryAccountName === "" || beneficiaryAccountName === undefined) {
        error.push("error");
        $("#vendor_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_institution_error").html("");
        $("#vendor_accountnumber_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#src_accountnumber_error").html(" ");
        $("#narration_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#amount_error").html(" ");
    }
    return error;
}

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }
</script>


