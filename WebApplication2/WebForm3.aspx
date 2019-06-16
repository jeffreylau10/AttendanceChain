<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm3.aspx.vb" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="result">
            <h2>Sending to IOST blockchain....</h2> 
            <img src="output.gif" /><br />

        </div>

        
    </form>
    <script>
        $(document).ready(function () {
            var tid = setTimeout(mycode, 5000);
        });
        function mycode() {
            $("#result").append("<p>Successful! Click <a href='https://explorer.iost.io/tx/E7r1VW5AaAFaHCPKGhxqE9pHCFxyZRj5C6L51sCZZRJB'>here</a> to view your confirmation on the IOST blockchain</p>");
        };

    </script>
</body>
</html>
