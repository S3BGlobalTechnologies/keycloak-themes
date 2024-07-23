<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body>
    <div class="page-wrapper bg-gra-01 p-t-100">
        <div class="wrapper wrapper--w780">

            <!-- Modal HTML -->
            <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="alertModalLabel">Alert</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="alert" id="alertMessage">
                                <span id="alertIcon"></span>
                                <span id="alertText"></span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FreeMarker template logic to show alert -->
            <#if displayMessage && message?has_content>
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        var alertMessageElement = document.getElementById("alertMessage");
                        var alertIconElement = document.getElementById("alertIcon");
                        var alertTextElement = document.getElementById("alertText");

                        // Set the alert class based on message type
                        alertMessageElement.className = "alert alert-${message.type}";

                        // Set the icon based on message type
                        <#if message.type == 'success'>
                            alertIconElement.className = "${properties.kcFeedbackSuccessIcon!}";
                        </#if>
                        <#if message.type == 'warning'>
                            alertIconElement.className = "${properties.kcFeedbackWarningIcon!}";
                        </#if>
                        <#if message.type == 'error'>
                            alertIconElement.className = "${properties.kcFeedbackErrorIcon!}";
                        </#if>
                        <#if message.type == 'info'>
                            alertIconElement.className = "${properties.kcFeedbackInfoIcon!}";
                        </#if>

                        // Set the alert text
                        alertTextElement.innerHTML = "${message.summary?no_esc}";

                        // Show the modal
                        $('#alertModal').modal('show');
                    });
                </script>
            </#if>

            <#nested "form">
        </div> 
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
</#macro>
