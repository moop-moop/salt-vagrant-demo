7zip:
  15.07:
    full_name: 7-Zip 15.07 beta (x64)
    installer: salt://win/repo-ng/7zip/7z1507-x64.exe
    install_flags: '/S /D=C:\\Programs\\7zip'
    uninstaller: 'C:\\Programs\\7zip\\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  9.20.00.0:
    full_name: 7-Zip 9.20 (x64 edition)
    installer: http://heanet.dl.sourceforge.net/project/sevenzip/7-Zip/9.20/7z920-x64.msi
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: http://heanet.dl.sourceforge.net/project/sevenzip/7-Zip/9.20/7z920-x64.msi
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False