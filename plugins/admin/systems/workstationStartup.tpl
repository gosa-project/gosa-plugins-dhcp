<table summary="" style="width:100%;">
 <tr>
  <td style="width:50%; vertical-align:top;">
<h2><img class="center" alt="" align="middle" src="images/penguin.png"> {t}Boot parameters{/t}</h2>

   <table summary="" style="width:100%">
    <tr>
     <td><LABEL for="gotoBootKernel">{t}Boot kernel{/t}</LABEL></td>
     <td style="width:70%">
{render acl=$gotoBootKernelACL}
        <select id="gotoBootKernel" name="gotoBootKernel">
         {html_options options=$gotoBootKernels selected=$gotoBootKernel}
         <option disabled>&nbsp;</option>
	</select>
{/render}
      </td>
    </tr>
    <tr>
     <td><LABEL for="customParameters">{t}Custom options{/t}</LABEL></td>
     <td>
{render acl=$gotoKernelParametersACL}
	<input name="customParameters" id="customParameters" size=25 maxlength=500
                value="{$customParameters}" title="{t}Enter any parameters that should be passed to the kernel as append line during bootup{/t}">
{/render}
     </td>
    </tr>
    <tr>
     <td colspan="2" style='vertical-align:top;padding-top:3px;'><LABEL for="gotoLdapServer">{t}LDAP server{/t}</LABEL><br>
{render acl=$gotoLdapServerACL}
	  {$SelectBoxLdapServer}	
{/render}
     </td>
    </tr>
   </table>

  </td>

  <td style="border-left:1px solid #A0A0A0">
     &nbsp;
  </td>
  
  <td style="vertical-align:top;">

	{if $fai_activated}

		{if $FAIdebianMirror == "inherited"}

			<table>
				<tr>
					<td>
						<h2><img class="center" alt="" align="middle" src="images/fai_profile.png">&nbsp;{t}FAI server{/t}
						</h2>
					</td>
					<td>
						<h2><img class="center" alt="" align="middle" src="images/fai_profile.png">&nbsp;{t}Release{/t}
						</h2>
					</td>
				</tr>
				<tr>
					<td>
	{render acl=$FAIdebianMirrorACL}
						<select name="FAIdebianMirror"   onchange='document.mainform.submit()'>
							{html_options options=$FAIdebianMirrors output=$FAIdebianMirrors selected=$FAIdebianMirror}
						</select>
	{/render}
					</td>
					<td>
						<select name="FAIrelease"  disabled>
						{html_options options=$InheritedFAIrelease output=$InheritedFAIrelease selected=$InheritedFAIrelease}
						</select>
					</td>
				</tr>
			</table>
			<h2>
				<img class="center" alt="" align="middle" src="images/fai_profile.png">&nbsp;{t}Assigned FAI classes{/t}
			</h2>
	{render acl=$FAIclassACL}
			{$FAIScriptlist}	
	{/render}
		{else}

			<table>
				<tr>
					<td>
						<h2><img class="center" alt="" align="middle" src="images/fai_profile.png">&nbsp;{t}FAI server{/t}
						</h2>
					</td>
					<td>
						<h2><img class="center" alt="" align="middle" src="images/fai_profile.png">&nbsp;{t}Release{/t}
						</h2>
					</td>
				</tr>
				<tr>
					<td>
	{render acl=$FAIdebianMirrorACL}
						<select name="FAIdebianMirror" onchange='document.mainform.submit()'>
							{html_options options=$FAIdebianMirrors output=$FAIdebianMirrors selected=$FAIdebianMirror}
						</select>
	{/render}
	{if $javascript eq 'false'}
	{render acl=$FAIdebianMirrorACL}
		<input type="submit" value="{t}set{/t}" name="refresh">
	{/render}
	{/if}
					</td>
					<td>
	{render acl=$FAIreleaseACL}
						<select name="FAIrelease"  onchange='document.mainform.submit()'>
						{html_options options=$FAIreleases output=$FAIreleases selected=$FAIrelease}
						</select>
	{/render}
					</td>
				</tr>
			</table>
			<h2>
				<img class="center" alt="" align="middle" src="images/fai_profile.png">&nbsp;{t}Assigned FAI classes{/t}
			</h2>
	{render acl=$FAIclassACL}
			{$FAIScriptlist}	
	{/render}

	{render acl=$FAIclassACL}
			<select name="FAIclassesSel">
				{html_options values=$FAIclassesKeys output=$FAIclasses}
				<option disabled>&nbsp;</option>
			</select>	
	{/render}
	{render acl=$FAIclassACL}
			<input name="AddClass" value="{t}Add{/t}" type="submit"> 
	{/render}
	<!--		<input name="DelClass" value="{t}Delete{/t}" type="submit"> -->
		{/if}

		{else}

			<h2>{t}FAI Object assignment disabled. You can't use this feature until FAI is activated.{/t}</h2>			

		{/if}
  		</td>
	</tr>
</table>

<table summary="" style="width:100%;">
 <tr><td colspan=2><p class="plugbottom" style="margin-top:0px;"></p></td></tr>

 <tr>
  <td style="width:50%; vertical-align:top; border-right:1px solid #B0B0B0">
   <h2>
    <img class="center" alt="" align="middle" src="images/hardware.png"> {t}Kernel modules (format: name parameters){/t}
   </h2>
{render acl=$gotoModulesACL}
    <select style="width:100%; height:150px;" name="modules_list[]" size=15 multiple title="{t}Add additional modules to load on startup{/t}">
     {html_options values=$gotoModules output=$gotoModules}
	 <option disabled>&nbsp;</option>
    </select>
{/render}
    <br>
{render acl=$gotoModulesACL}
    <input name="module" size=30 align=middle maxlength=30>
{/render}
{render acl=$gotoModulesACL}
    <input type=submit value="{t}Add{/t}" name="add_module">&nbsp;
{/render}
{render acl=$gotoModulesACL}
    <input type=submit value="{t}Delete{/t}" name="delete_module">
{/render}
  </td>

  <td style="vertical-align:top;">
        <h2><img class="center" alt="" src="images/fai_partitionTable.png" align="middle">&nbsp;<LABEL for="gotoShare">{t}Shares{/t}</LABEL></h2>
        <table summary="" style="width:100%">
                <tr>
                        <td>
{render acl=$gotoShareACL}
                        <select style="width:100%;height:150px;" name="gotoShare" multiple size=4 id="gotoShare">
   					     {html_options values=$gotoShareKeys output=$gotoShares}
								<option disabled>&nbsp;</option>
                                </select>
{/render}
                                <br>
{render acl=$gotoShareACL}
                        <select name="gotoShareSelection">
    						    {html_options values=$gotoShareSelectionKeys output=$gotoShareSelections}
						        <option disabled>&nbsp;</option>
                                </select>
{/render}
{render acl=$gotoShareACL}
                                <input type="text" size=15 name="gotoShareMountPoint" value="{t}Mountpoint{/t}">
{/render}
{render acl=$gotoShareACL}
                                <input type="submit" name="gotoShareAdd" value="{t}Add{/t}">
{/render}
{render acl=$gotoShareACL}
                                <input type="submit" name="gotoShareDel" value="{t}Remove{/t}" {if $gotoSharesCount == 0} disabled {/if}>
{/render}
                        </td>
                </tr>
        </table>
  </td>
 </tr>
</table>
<input name="WorkstationStarttabPosted" type="hidden" value="1">
<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  document.mainform.gotoLdapServer.focus();
  -->
</script>
