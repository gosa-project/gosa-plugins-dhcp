<!-- Headline -->
<body>
{$php_errors}
<form action='main.php{$plug}' name='mainform' method='post' enctype='multipart/form-data'>
<table summary="" width="100%" border="0" cellspacing="0" cellpadding="0" cellpadding="3" bgcolor="#5353ad" height="100%">
  <tr>
    <td style="height:36px; width:140px; vertical-align:bottom; text-align:center">
     <a href="main.php?version=1" style="vertical-align:bottom;"><img src='{$go_logo}' border="0" alt="GOSA2" align="bottom"></a>
    </td>
    <td>
      <table summary="" style="margin-left:20px;" border=0>
       <tr>
        <td valign="middle">
	 <a class=maintitlebar href='main.php?reset=1' onClick='return question("{t}You are currently editing a database entry. Do you want to dismiss the changes?{/t}", "main.php?reset=1");' style="vertical-align:middle;">
	  <img src='{$go_home}' align="middle" border="0" alt="GOSA2">&nbsp;{t}Main{/t}
	 </a>
	</td>
        <td>
	 <a class=maintitlebar style="margin-left:35px; vertical-align:middle;" {$help_method}>
          <img src='{$go_help}' align="middle" border="0" alt="GOSA2">&nbsp;{t}Help{/t}
         </a>
	</td>
	<td>
	 <a class=maintitlebar href='logout.php' onClick='return question("{t}You are currently editing a database entry. Do you want to dismiss the changes?{/t}", "logout.php");' style="margin-left:35px; vertical-align:middle;">
          <img src='{$go_out}' align="middle" border="0" alt="GOSA2">&nbsp;{t}Sign out{/t}
         </a>
	</td>
       </tr>
      </table>
    </td>
    <td align=right>
      <div class=maintitlebar>
        <a>{t}Signed in:{/t} <b>{$username}</b></a>
      </div>
    </td>
  </tr>
  <tr style="vertical-align:top;">
    <!-- Menu -->
    <td style="background-color:#5353ad; vertical-align:top;" id="menucell">
      <div style="background-color:#5353ad; height:12px; width:100%;">&nbsp;</div>
      {$menu}
	  <br>
	  <div style="height:100px; width:140px;"></div>
    </td>

    <!-- Plugin window -->
    <td style="background-color:white; width:100%; vertical-align:top; height:15px; border-left:1px solid #778F6E; border-top:1px solid #778F6E" colspan=2>
      <table summary="" style="vertical-align:top; text-align:justify; background-color: #F8F8F8; margin-top:7px; margin-left:7px; margin-right:7px; width:99%">
       <tr>
        <td>
	 {$errors}
	 {$contents}
       </td>
      </tr>
     </table>
    </td>
  </tr>
</table></form></body></html>