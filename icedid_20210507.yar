rule fake_gzip_bokbot_202104
{
meta:
        author = "Thomas Barabosch, Telekom Security"
        date = "2021-04-20"
        description = "fake gzip provided by CC"
strings:
        $gzip = {1f 8b 08 08 00 00 00 00 00 00 75 70 64 61 74 65}
condition:
        $gzip at 0
}

rule win_iceid_gzip_ldr_202104
{
meta:
        author = "Thomas Barabosch, Telekom Security"
        date = "2021-04-12"
        description = "2021 initial Bokbot / Icedid loader for fake GZIP payloads"
strings:
        $internal_name = "loader_dll_64.dll"
        $string0 = "_gat=" wide
        $string1 = "_ga=" wide
        $string2 = "_gid=" wide
        $string3 = "_u=" wide
        $string4 = "_io=" wide
        $string5 = "GetAdaptersInfo"
        $string6 = "WINHTTP.dll"
        $string7 = "DllRegisterServer"
        $string8 = "PluginInit"
        $string9 = "POST" wide
        $string10 = "aws.amazon.com" wide
condition:
        8 of them and $internal_name
}

rule win_iceid_core_ldr_202104
{
meta:
        author = "Thomas Barabosch, Telekom Security"
        date = "2021-04-13"
        description = "2021 loader for Bokbot / Icedid core (license.dat)"
strings:
        $internal_name = "sadl_64.dll"
        $string0 = "GetCommandLineA"
        $string1 = "LoadLibraryA"
        $string2 = "ProgramData"
        $string3 = "SHLWAPI.dll"
        $string4 = "SHGetFolderPathA"
        $string5 = "DllRegisterServer"
        $string6 = "update"
        $string7 = "SHELL32.dll"
        $string8 = "CreateThread"
condition:
        6 of them and $internal_name
}

rule win_iceid_core_202104
{
meta:
        author = "Thomas Barabosch, Telekom Security"
        date = "2021-04-12"
        description = "2021 Bokbot / Icedid core"
strings:
        $internal_name = "fixed_loader64.dll"
        $string0 = "mail_vault" wide
        $string1 = "ie_reg" wide
        $string2 = "outlook" wide
        $string3 = "user_num" wide
        $string4 = "cred" wide
        $string5 = "Authorization: Basic"
        $string6 = "VaultOpenVault"
        $string7 = "sqlite3_free"
        $string8 = "cookie.tar"
        $string9 = "DllRegisterServer"
        $string10 = "PT0S" wide
condition:
        8 of them and $internal_name
}
