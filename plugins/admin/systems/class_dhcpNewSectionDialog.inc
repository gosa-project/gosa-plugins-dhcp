<?php

class dhcpNewSectionDialog extends plugin
{
  /* attribute list for save action */
  var $ignore_account     = TRUE;
  var $attributes         = array();
  var $objectclasses      = array("whatever");

  /* Mapping array */
  var $types= array();
  var $classtype= "";
  static $sectionMap= array(  "dhcpService" => array("dhcpSharedNetwork", "dhcpSubnet", "dhcpGroup", "dhcpHost", "dhcpClass", "dhcpLeases"),
                              "dhcpClass" => array("dhcpSubClass"),
                              "dhcpSubClass" => array(),
                              "dhcpLeases" => array(),
                              "dhcpHost" => array(),
                              "dhcpGroup" => array("dhcpHost"),
                              "dhcpPool" => array("dhcpLeases"),
                              "dhcpSubnet" => array("dhcpPool", "dhcpGroup", "dhcpHost", "dhcpClass", "dhcpLeases"),
                              "dhcpSharedNetwork" => array("dhcpSubnet", "dhcpPool"));



  function dhcpNewSectionDialog($type)
  {
    $this->types= array(  "dhcpLog" => _("Logging"),
                          "dhcpService" => _("Global options"),
                          "dhcpClass" => _("Class"),
                          "dhcpSubClass" => _("Subclass"),
                          "dhcpLeases" => _("Lease"),
                          "dhcpHost" => _("Host"),
                          "dhcpGroup" => _("Group"),
                          "dhcpPool" => _("Pool"),
                          "dhcpSubnet" => _("Subnet"),
                          "dhcpFailOverPeer" => _("Failover peer"),
                          "dhcpSharedNetwork" => _("Shared network"));

    $this->classtype= $type;
  }

  function execute()
  {
    /* Fill templating stuff */
    $smarty = get_smarty();
    $display= "";

    $sections= dhcpNewSectionDialog::$sectionMap[$this->classtype];
    $t_sections= array();
    foreach ($sections as $section){
      $t_sections[$section]= $this->types[$section]; 
    }
    $smarty->assign("sections", $t_sections);
    $smarty->assign("dhcpSectionACL", chkacl($this->acl,"DHCP"));
    $display.= $smarty->fetch(get_template_path('dhcpNewSection.tpl', TRUE));
    return($display);
  }

  /* Get posts and set class name 
   */ 
  function save_object()
  {
  }

  /* Check given class name */
  function check()
  {
    /* Call common method to give check the hook */
    $message= "";
 
    return ($message);
  }


  /* Return the class name */
  function save()
  {
  }

}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>