<?php
$server_name='Evil-Corp-portal';
$message = "";
$run="";
if(isset($_POST['SubmitButton'])){ 

  $input = $_POST['inputText']; 
  $message = "IP:".$input;
  $run = shell_exec('ping -c 4 '. $input);

} 
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $server_name; ?></title>
<style type="text/css">
body {
        height: 100vh;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background: #222;
        overflow: hidden;
}

.logo {

    font-weight: 1000;
    text-align:center;
    -webkit-transform: rotate(-40deg);
    -moz-transform: rotate(-40deg);
    -o-transform: rotate(-40deg);
    writing-mode: lr-tb;
    padding-top: 50px;
    color:white;

}
.logo-base {
    font-weight:bold;
    text-align:center;
    margin-top: -34px;
    margin-left: 38px;
    color:white;
}

.output{
    font-weight:bold;
    color:yellow;
    text-align:center;
}

</style>
</head>
<body>
<h1 class="logo">E</h1>
<p class="logo-base">EVIL CORP</p>

<h2  style="color:white; text-align:center;">Development Portal</h2>
<p style="color:white; text-align:center;">Check website is Status using IP </p>

<form class=output action="" method="post">
  <input type="text" name="inputText"/>
  <input type="submit" name="SubmitButton"/>
</form>    
<h3 class="output">
<?php echo $message; ?>
<?php echo '<pre>'.$run.'</pre>'; ?>
</h3>
</body>
</html>

