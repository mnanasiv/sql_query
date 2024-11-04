
#SQL DB Query Tool
#Author: Murugs - TPAS

#Sql predefined query Setup

$ErrorActionPreference = 'SilentlyContinue'

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
[System.Windows.Forms.Application]::EnableVisualStyles()
([Environment]::currentDirectory='c:') | Out-Null
#Import-Module VMware.VimAutomation.Core

#Check for ReportHTML Module
$Mod = Get-Module -ListAvailable -Name "EnhancedHTML2"

If ($null -eq $Mod)
{

    #Write-Host "EnhancedHTML2 Module is not present, Please copy the Modules to respective location"
    #mkdir C:\Windows\System32\WindowsPowerShell\v1.0\Modules\EnhancedHTML2 -ErrorAction SilentlyContinue
    #copy \\s30t30v01lb\tpva-dva$\Client_Tool\EnhancedHTML2\*.* C:\Windows\System32\ ---->WindowsPowerShell\v1.0\Modules\EnhancedHTML2\. -ErrorAction SilentlyContinue
    Import-Module EnhancedHTML2 -ErrorAction SilentlyContinue
}

Function Test-Logfolder{

    $directory_name = get-date -Format dd_MM_yyyy
    $directory_name_testpath = Test-Path "C:\Users\murug\Downloads\$directory_name" -ErrorAction SilentlyContinue

    if($directory_name_testpath-ne $true){

        New-item-path "C:\Users\murug\Downloads\$directory_name"-Item Type Directory -ErrorAction SilentlyContinue | Out-Null

    }
   
    Return $directory_name

}

#For Log
$directory_name = Test-Logfolder

#Generated Form Objects

$Form_MainForm = New-Object System.Windows.Forms.Form
#$Servername_label = New-Object System.Windows.Forms.label
$RichTextBox_Computername = New-Object System.Windows.Forms.RichTextBox
$Tab_General = New-Object 'System.Windows.Forms.TabPage'
$TabMenu_Control = New-Object 'System.Windows.Forms.TabControl'
$button_Credential = New-Object System.Windows.Forms.Button
$button_Clear = New-Object System.Windows.Forms.Button
$button_Copy = New-Object System.Windows.Forms.Button
$Region = New-Object 'System.windows.forms.Lable1'
$BNYMLogo = New-Object 'System.Windows.Forms.Label'
$UserName_TextBox1 = New-Object System.Windows.Forms.TextBox
$Password_TextBox2 = New-Object System.Windows.Forms. Masked TextBox
$Usernameicon = New-Object System.Windows.Forms.Label
$UserName_Label = New-Object System.Windows.Forms.Label
$Password_Label = New-Object System.Windows.Forms.Label
$button_Login = New-Object System.Windows.Forms.Button
$Web_Browser_output = New-Object System.Windows.Forms.WebBrowser
$LinkLabel1 = New-Object System.Windows.Forms.LinkLabel
$LinkLabel2 = New-Object System.Windows.Forms.LinkLabel
$LinkLabel3 = New-Object System.Windows.Forms.LinkLabel
$button_RecentLogon = New-Object System.Windows.Forms.Button
$button_Nexen = New-Object System.Windows.Forms.Button
$RichTextBox_Servername = New-Object System.Windows.Forms.RichTextBox
$button_submit = New-Object System.Windows.Forms.Button
$button_download_xl = New-Object System.Windows.Forms.Button
$button_download_txt = New-Object System.Windows.Forms.Button

# Current Operating System Information
    $current_OS= Get-WmiObject Win32_OperatingSystem -ErrorAction Stop
    $current_OS_caption = $current_OS.caption




                #Display UI

                $ServicesMgmt_Form.Add_Shown({$ServicesMgmt_Form.Activate()})
                $ServicesMgmt_Form.Showdialog()


# Service Management Scritps End

#Get-Uptime


#region begin to draw forms

$Form_MainForm.Text = "SQL Query report Tool - $env:userdomain\$env:username"
$Form_MainForm.StartPosition = "CenterScreen"
#$Form_MainForm.BackColor = 'White'
#$Form_MainForm.KeyPreview = $True
#$Form_MainForm.AutoSize = $True
$Form_MainForm.AutoSizeMode = "GrowAndShrink"
#$Form_MainForm.WindowState = 'Maximized'
#$Form_MainForm.MaximizeBox=$true
$Form_MainForm.AutoScale = $True
#$Form_MainForm.BackColor = 'Control'
$Form_MainForm.ClientSize = '1200,800'
$Form_MainForm.AutoScaleMode = 'Inherit'
$Form_MainForm.FormBorderStyle = 'Fixed3D'
#$Form_MainForm.Font = "Microsoft Sans Serif, 8.25pt"
$Form_MainForm.Name = "MainForm"



#Label Userlcon

$Usernameicon.Location ='10,0'
$Usernameicon.Size = '50,50'
#777---->$Usernameicon.Image = [System.Convert]::FromBase64String('iVBORWO---->')
$Form_MainForm.Controls.Add($Usernameicon)

#Button Login
$button_Login.Location = '220,15'
$button_Login.Size = '50,25'
$button_Login.Text = "Login"
$button_Login.UseVisualStyleBackColor = $True
$button_Login.TabIndex = 53
$tooltipinfo.SetToolTip($button_Login, "Click Login button to authentication for domain")
$Form_MainForm.Controls.Add($button_Login)
#$button_Login. Use VisualStyleBackColor = $True
$button_Login.TextAlign = ' Middle Right'
$button_Login. Font = "Sitka Heading, 8, style=Bold"
$button_Login.ImageAlign = 'MiddleLeft'
#$button_Login.Enabled = $false
$button_Login.Add_Click({Login})

#Get-Credential input

$UserName_TextBox1.Text =
$UserName_TextBox1.Location = '125,5'
$UserName_TextBox1.Size = '80,30'
$Form_MainForm.Controls.Add($UserName_TextBox1)

<#
$UserName_TextBox1_add_TextChanged={

            if($UserName_TextBox1.text.Length -gt 10){

                #$TabMenu_Control.Enabled = $True
                #$button_Check.Enabled = $True
                 $button_Login.Enabled = $True

                 
                 }else{
                    $button_Login.Enabled = $false
                    #$TabMenu_Control.Enabled = $false
                    #$button_Check.Enabled = $false
                  }


    } 
$UserName_TextBox1.add_TextChanged($UserName_TextBox1_add_TextChanged)
#>

<#
        if ($RichTextBox_Computername.Text -eq "") {
            $RichTextBox_Computername.BackColor = [System.Drawing.Color]::FromArgb(255, 128, 128);
        
        }

        if ($RichTextBox_Computername.Text -ne """) {
            $RichTextBox_Computername.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 192)

        }
        $TabMenu_Control.Enabled = $RichTextBox_Computername.Text -ne ""
        $button_Check.Enabled = $RichTextBox_Computername.Text -ne ""
    }


#>

$Password_TextBox2.Text =
$Password_TextBox2.PasswordChar = "*"
$Password_TextBox2.Location = '125,30'
$Password_TextBox2.Size = '80,30'
$Form_MainForm.Controls.Add($Password_TextBox2)


$UserName_Label.Text = "UserName"
$UserName_Label.Font = "Microsoft Sans Serif, 8.25pt, style=Bold"
$UserName_Label.Size = '70,15'
$UserName_Label.Location = '60,5'
$Form_MainForm.Controls.Add($UserName_Label)

$Password_Label.Text = "Password"
$Password_Label. Font = "Microsoft Sans Serif, 8.25pt, style=Bold"
$Password_Label.Location = '60,32'
$Password_Label.Size = '70,15'
$Form_MainForm.Controls.Add($Password_Label)

#Login

Function Login {

        $Logon_username_raw = $UserName_TextBox1.Text
        $Login_password = $Password_TextBox2.Text
        $Logon_SECpassword = ConvertTo-SecureString $Login_password -AsPlainText -Force -erroraction SilentlyContinue
        
        if ($Logon_username_raw-match '\\'){
        
        $Logon_domain_name = $Logon_username_raw.split('\')[0]
        $Logon_username = $Logon_username_raw.split('\')[1]
        $Global:Cred = New-Object System.Management.Automation.PSCredential ("$Logon_domain_name\$Logon_username", $Logon_SECpassword)
        #$Logon_CurrentDomain = "LDAP://DC=$Logon_domain_name,DC=bnymellon, DC=net"
        $Logon_Cred_verify = New-Object System.DirectoryServices.DirectoryEntry("","$Logon_domain_name\$Logon_username", $Login_password)
        }

        if ($Logon_Cred_verify.name -eq $null){

        $richtextbox_Logs.Selectioncolor = [Drawing.Color]::Red
        $richtextbox_Logs.AppendText("`n[$(Get-Date -UFormat %r)] Authentication failed - Please verify your username and password")
        }

        Else{
        $TabMenu_Control.Enabled = $True
        $button_Check.Enabled = $True
        $richtextbox_Logs.Selectioncolor = [Drawing.Color]::Green
        $richtextbox_Logs.appendtext("'n[$(Get-Date -UFormat %r)] Successfully authenticated with $Logon_domain_name")
        }
        }



#TabMenuControl

$TabMenu_Control.Controls.Add($Tab_General)
$TabMenu_Control.BackColor = 'LightGray'
$TabMenu_Control.Location = '7,55'
$TabMenu_Control.Multiline = $True
$TabMenu_Control.Size = '1160,130'
#$TabMenu_Control.SelectedIndex = 0
$TabMenu_Control. Font="Sitka Heading, 12, style=Bold"
$TabMenu_Control.TabIndex = 3
#$TabMenu_Control.Enabled = $false
$Form_MainForm.Controls.Add($TabMenu_Control)


#Tab_General

$Tab_General. Location = '10, 100'
$Tab_General.Name = "Tab_General"
$Tab_General.BackColor= 'Control'
$Tab_General.Size = '700, 111'
$Tab_General.TabIndex = 4
#$Tab_General.BackColor = 'White'
$Tab_General.UseVisualStyleBackColor = $True
$Tab_General.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
$Tab_General.Text = "General"

# Nexen PROD ERR

#$Tab_General.Controls.Add($button_9SY_services)
#$button_9SY_services.Add_Click({

#$button_Nexen.Location = '1060,3'
#$button_Nexen.Size = '80,80'
#$button_Nexen.TabIndex = 17

#$button_Nexen.Text = "ERR PROD"
#$button_Nexen.add_Click({[system.Diagnostics.Process]::start("https://nexen.bnymellon.com/app/nxn/login")})
#$tooltipinfo.SetToolTip($button_Nexen, "To Listing All Automatic Serives from Remote Server")
#$button_Nexen.UseVisualStyleBackColor = $True
#$Tab_General.Controls.Add($button_Nexen)
#$button_Nexen.TextAlign = 'Bottom'
#$button_Nexen.Font = "Sitka Heading, 8, style=Bold, color=white"
#$button_Nexen.ImageAlign = 'TopCenter'
#$button_Nexen.Image = [System.Convert] :: From Base64String('iVBORwO---->')








$mLabel1 = New-Object System.Windows.Forms.Label
$mLabel1.Text="Mnmonics :"
$mLabel1.Top="300"
$mLabel1.Left="50"
$mLabel1. Anchor="Left, Top"
$mLabel1.Size = New-Object System.Drawing. Size(100,50)
$Form_MainForm.Controls.Add($mLabel1)


$mCheckBox1 = New-Object System.Windows.Forms.CheckBox
$mCheckBox1.Text="RFX"
$mCheckBox1. Top="300"
$mCheckBox1.Left="152"
$mCheckBox1.Anchor="Left, Top"
$mCheckBox1.Size = New-Object System.Drawing.Size(100,20)

$Form_MainForm.Controls.Add($mCheckBox1)

$mCheckBox2 = New-Object System.Windows.Forms.CheckBox
$mCheckBox2.Text="ERR"
$mCheckBox2. Top="300"
$mCheckBox2.Left="252"
$mCheckBox2.Anchor="Left, Top"
$mCheckBox2.Size = New-object system.Drawing.Size(100,20)
$Form_MainForm.Controls.Add($mCheckBox2)


$mCheckBox3 = New-Object System.Windows.Forms.CheckBox
$mCheckBox3.Text="CDE"
$mCheckBox3. Top="300"
$mCheckBox3.Left="352"
$mCheckBox3.Anchor="Left,Top"
$mCheckBox3.Size = New-Object System.Drawing.Size(100,20)
$Form_MainForm.Controls.Add($mCheckBox3)


#Region wise 
$mLabel1 = New-Object System.Windows.Forms.Label
$mLabel1.Text="Region:"
$mLabel1.Top="350"
$mLabel1.Left="50"
$mLabel1. Anchor="Left,Top"
$mLabel1.Size = New-Object System.Drawing.Size(100,50)
$Form_MainForm.Controls.Add($mLabel1)


$mCheckBox1 = New-Object System.Windows.Forms.CheckBox
$mCheckBox1.Text="PROD"
$mCheckBox1. Top="350"
$mCheckBox1.Left="152"
$mCheckBox1.Anchor="Left,Top"
$mCheckBox1.Size = New-Object System.Drawing.Size(100,20)

$Form_MainForm.Controls.Add($mCheckBox1)

$mCheckBox2 = New-Object System.Windows.Forms.CheckBox
$mCheckBox2.Text="QA"
$mCheckBox2. Top="350"
$mCheckBox2.Left="252"
$mCheckBox2.Anchor="Left,Top"
$mCheckBox2.Size = New-object system.Drawing.Size(100,20)
$Form_MainForm.Controls.Add($mCheckBox2)

$mCheckBox3 = New-Object System.Windows.Forms.CheckBox
$mCheckBox3.Text="TEST"
$mCheckBox3. Top="350"
$mCheckBox3.Left="352"
$mCheckBox3.Anchor="Left,Top"
$mCheckBox3.Size = New-Object System.Drawing.Size(100,20)
$Form_MainForm.Controls.Add($mCheckBox3)

#Get the server name
$mLabel1 = New-Object System.Windows.Forms.Label
$mLabel1.Text="Server :"
$mLabel1.Top="400"
$mLabel1.Left="50"
$mLabel1.Anchor="Left,Top"
$mLabel1.Size = New-Object System.Drawing.Size(100,50)
$Form_MainForm.Controls.Add($mLabel1)


$mRichTextBox1 = New-Object System.Windows.Forms.RichTextBox
$mRichTextBox1.Text="Enter Server name"
$mRichTextBox1. Top="400"
$mRichTextBox1.Left="152"
$mRichTextBox1.Anchor="Left,Top"
$mRichTextBox1.Size = New-Object System.Drawing.Size(200,30)
$Form_MainForm.Controls.Add($mRichTextBox1)


#List of Pre-defined Query
$mLabel1 = New-Object System.Windows.Forms.Label
$mLabel1.Text="Pre-Defind Query :"
$mLabel1.Top="460"
$mLabel1.Left="50"
$mLabel1.Anchor="Left,Top"
$mLabel1.Size = New-Object System.Drawing.Size(100,50)
$Form_MainForm.Controls.Add($mLabel1)

$mRichTextBox1 = New-Object System.Windows.Forms.RichTextBox
$mRichTextBox1.Text="Select Query"
$mRichTextBox1. Top="460"
$mRichTextBox1.Left="152"
$mRichTextBox1.Anchor="Left,Top"
$mRichTextBox1.Size = New-Object System.Drawing.Size(900,30)
$Form_MainForm.Controls.Add($mRichTextBox1)


#Get Pre-defind query list
$mLabel1 = New-Object System.Windows.Forms.Label
$mLabel1.Text="New Query :"
$mLabel1.Top="560"
$mLabel1.Left="50"
$mLabel1.Anchor="Left,Top"
$mLabel1.Size = New-Object System.Drawing.Size(100,50)
$Form_MainForm.Controls.Add($mLabel1)

$mRichTextBox1 = New-Object System.Windows.Forms.RichTextBox
$mRichTextBox1.Text="Enter New Query"
$mRichTextBox1. Top="560"
$mRichTextBox1.Left="152"
$mRichTextBox1.Anchor="Left,Top"
$mRichTextBox1.Size = New-Object System.Drawing.Size(900,30)
$Form_MainForm.Controls.Add($mRichTextBox1)


#Copy - Richtextbox text

$button_Copy.Location = '320,653'
$button_Copy.Size = '60,25'
$button_Copy.Text = "Copy"
$button_Copy.UseVisualStyleBackColor = $True
$tooltipinfo.SetToolTip($button_Copy, "Copy Richtextbox text to ClipBoard")
$Form_MainForm.Controls.Add($button_Copy)
$button_Copy.TextAlign = ' Middle Right'
$button_Copy.Font = "Sitka Heading, 8, style=Bold"
$button_Copy.ImageAlign = 'Middle Left'
#---->$button_Copy.Image = [System.Convert] :: FromBase64String('iVBORw0---->')
$button_Copy.Add_Click({
        $Web_Browser_output.Document.ExecCommand("SelectAll", $True, $null);
        $Web_Browser_output.Document.ExecCommand("Copy", $True, $null);
        })


#Button Login
$button_Login.Location = '220,15'
$button_Login.Size = '50,25'
$button_Login.Text = "Login"
$button_Login.UseVisualStyleBackColor = $True
$button_Login.TabIndex = 53
$tooltipinfo.SetToolTip($button_Login, "Click Login button to authentication for domain")
$Form_MainForm.Controls.Add($button_Login)
#$button_Login. Use VisualStyle BackColor = $True
$button_Login.TextAlign = ' Middle Right'
$button_Login.Font = "Sitka Heading, 10, style=Bold"
$button_Login.ImageAlign = 'MiddleLeft'
$button_Login.Enabled = $false
$button_Login.Add_Click({Login})






#Clear- Richtextbox

$button_Clear.Location = '390,653'
$button_Clear.Size = '60,25'
$button_Clear.Text = "Clear"
$button_Clear.UseVisualStyleBackColor = $True
$tooltipinfo.SetToolTip($button_Clear, "Clear Richtextbox and Richtextbox_logs")
$Form_MainForm.Controls.Add($button_Clear)
$button_Clear.TextAlign = ' Middle Right'
$button_Clear.Font = "Sitka Heading, 8, style=Bold"
$button_Clear.ImageAlign = 'Middle Left'
#777---->$button_Clear.Image = [System.Convert] :: From Base64String('IVBORw0---->')
$button_Clear.Add_Click({
        $Web_Browser_output.DocumentText = $null
        Remove-Variable ResultHTML
        $RichTextBox_Computername.Clear()
        $richtextbox_Logs.Clear()
        })


#Submit- Richtextbox text

$button_Submit.Location = '460,653'
$button_Submit.Size = '70,25'
$button_Submit.Text = "Submit"
$button_Submit.UseVisualStyleBackColor = $True
$tooltipinfo.SetToolTip($button_Clear, "All selected rules need to submit and generate report")
$Form_MainForm.Controls.Add($button_Submit)
$button_Submit.TextAlign = ' Middle Right'
$button_Submit.Font = "Sitka Heading, 8, style=Bold"
$button_Submit.ImageAlign = 'Middle Left'
#777---->$button_Clear.Image = [System.Convert] :: From Base64String('IVBORw0---->')
$button_Submit.Add_Click({
        $Web_Browser_output.ExecCommand("SelectAll",$True, $null);
        $Web_Browser_output.ExecCommand("Copy", $True, $null);
        })

#Download Excel format output

$button_download_xl.Location = '550,653'
$button_download_xl.Size = '130,25'
$button_download_xl.Text = "Download Excel"
$button_download_xl.UseVisualStyleBackColor = $True
$tooltipinfo.SetToolTip($button_Clear, "All selected rules need to submit and generate report")
$Form_MainForm.Controls.Add($button_download_xl)
$button_download_xl.TextAlign = ' Middle Right'
$button_download_xl.Font = "Sitka Heading, 8, style=Bold"
$button_download_xl.ImageAlign = 'Middle Left'
#777---->$button_Clear.Image = [System.Convert] :: From Base64String('IVBORw0---->')
$button_download_xl.Add_Click({
        $Web_Browser_output.ExecCommand("SelectAll",$True, $null);
        $Web_Browser_output.ExecCommand("Copy", $True, $null);
        })

#Download Text format output

$button_download_txt.Location = '700,653'
$button_download_txt.Size = '130,25'
$button_download_txt.Text = "Download Text"
$button_download_txt.UseVisualStyleBackColor = $True
$tooltipinfo.SetToolTip($button_Clear, "All selected rules need to submit and generate report")
$Form_MainForm.Controls.Add($button_download_txt)
$button_download_txt.TextAlign = ' Middle Right'
$button_download_txt.Font = "Sitka Heading, 8, style=Bold"
$button_download_txt.ImageAlign = 'Middle Left'
#777---->$button_txtear.Image = [System.Convert] :: From Base64String('IVBORw0---->')
$button_download_txt.Add_Click({
        $Web_Browser_output.ExecCommand("SelectAll",$True, $null);
        $Web_Browser_output.ExecCommand("Copy", $True, $null);
        })

#Link Label 1

$LinkLabel1.Location = '790,10'
$LinkLabel1.Size = '400,20'
$LinkLabel1.LinkColor = "BLUE"
$LinkLabel1.ActiveLinkColor = "RED"
$LinkLabel1.Font = "Sitka Heading, 8, style=Bold"
#$LinkLabel1.Text = "ERR QA Stop/Start by Ansible"
$LinkLabel1.add_Click({[system.Diagnostics.Process]::start("https://ansibletower-nonprod.bnymellon.net/#/home")})
$Form_MainForm.Controls.Add($LinkLabel1)

#Link Label 2

$LinkLabel2.Location = '790,40'
$LinkLabel2.Size = '400,20'
$LinkLabel2.LinkColor = "GREEN"
$LinkLabel2.ActiveLinkColor = "BLUE"
$LinkLabel2.Font = "Sitka Heading, 8, style=Bold"
#$LinkLabel2.Text = "ERR PROD Stop/Start by Ansible"
$LinkLabel2.add_Click({[system.Diagnostics.Process]::start("https://ansibletower.bnymellon.net/#/home")})
$Form_MainForm.Controls.Add($LinkLabel2)


<# Credential Button

$button_Credential.Location = '270,20'
$button_Credential.Size = '75,30'
$button_Credential.Text = "Credential"
$button_Credential.TabIndex = 3
$Form_MainForm.Controls.Add($button_Credential)
$button_Credential.TextAlign = 'MiddleCent'
$button_Credential. Font = "Franklin Gothic Heavy, 9"
$button_Credential.Add_Click({
$richtextbox_Logs.Selectioncolor = [Drawing.Color]::DarkMagenta
$richtextbox_Logs.appendtext("'n[$(Get-Date -UFormat %r)]Please Enter Your Credential")
$global:Cred = (Get-Credential)
})
#>


#Get-Credential input
#
$UserName_TextBox1.Text = "LDAP"
$UserName_TextBox1.Enabled = $false
$UserName_TextBox1.Location = '125,5'
$UserName_TextBox1.Size = '80,30'
$Form_MainForm.Controls.Add($UserName_TextBox1)
<#
$UserName_TextBox1_add_TextChanged={

            if($UserName_TextBox1.text.Length -gt 10){

                #$TabMenu_Control.Enabled = $True
                #$button_Check.Enabled = $True
                $button_Login.Enabled = $True

            }else{
                $button_Login.Enabled = $false
                #$TabMenu_Control.Enabled = $false
                #$button_Check.Enabled = $false

    
            }

    }
$UserName_TextBox1.add_TextChanged($UserName_TextBox1_add_TextChanged)

<#
        if ($RichTextBox_Computername.Text -eq "") {
            $RichTextBox_Computername.BackColor = [System.Drawing.Color]::FromArgb(255, 128, 128);

       }
       
       if ($RichTextBox_Computername.Text -ne "") {
           $RichTextBox_Computername.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 192)

        }
        $TabMenu_Control.Enabled = $RichTextBox_Computername.Text -ne ""
        $button_Check.Enabled = $RichTextBox_Computername.Text -ne ""

    }

#>

$Password_TextBox2.Text = "*******"
$Password_TextBox2.Enabled = $false
$Password_TextBox2.PasswordChar = "*"
$Password_TextBox2.Location = '125,30'
$Password_TextBox2.Size = '80,30'
$Form_MainForm.Controls.Add($Password_TextBox2)


$UserName_Label.Text = "UserName"
$UserName_Label.Font = "Microsoft Sans Serif, 8.25pt, style=Bold"
$UserName_Label.Size = '70,15'
$UserName_Label.Location = '60,5'
$Form_MainForm.Controls.Add($UserName_Label)

$Password_Label.Text = "Password"
$Password_Label. Font = "Microsoft Sans Serif, 8.25pt, style=Bold"
$Password_Label. Location = '60,32'
$Password_Label.Size = '70,15'
$Form_MainForm.Controls.Add($Password_Label)


<#Login


Function Login {

        $Logon_username_raw = $UserName_TextBox1.Text
        $Login_password = $Password_TextBox2.Text
        $Logon_SECpassword = ConvertTo-SecureString $Login_password -AsPlainText -Force -erroraction SilentlyContinue
        
        if ($Logon_username_raw-match '\\'){
	
        $Logon_domain_name = $Logon_username_raw.split('\')[0]
        $Logon_username = $Logon_username_raw.split('\')[1]
        $Global:Cred = New-Object System.Management.Automation.PSCredential ("$Logon_domain_name\$Logon_username", $Logon_SECpassword)
        #$Logon_CurrentDomain = "LDAP://DC=$Logon_domain_name,DC=bnymellon, DC=net"
        $Logon_Cred_verify = New-Object System.Directory Services. DirectoryEntry("","$Logon_domain_name\$Logon_username", $Login_password)
        }

        if ($Logon_Cred_verify.name -eq $null){

        $richtextbox_Logs.Selectioncolor = [Drawing.Color]::Red
        $richtextbox_Logs.AppendText("`n[$(Get-Date -UFormat %r)] Authentication failed - Please verify your username and password")
        }


        Else{
        $TabMenu_Control.Enabled = $True
        $button_Check.Enabled = $True
        $richtextbox_Logs.Selectioncolor = [Drawing.Color]::Green
        $richtextbox_Logs.appendtext("`n[$(Get-Date -UFormat %r)]Successfully authenticated with $Logon_domain_name")
        }
        }

$Form_MainForm. KeyPreview = $true
$Form_MainForm.add_keydown({if($_.keycode -eq "Enter"){Login}})
$Form_MainForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") ($Form_MainForm.Close()}})

#>
#Show form
#Form.Topmost = $True
$Form_MainForm.Add_Shown({$Form_MainForm.Activate()})
$Form_MainForm.ShowDialog() | Out-Null
