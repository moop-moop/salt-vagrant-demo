ms-vc10-redistributable-2010:
  10.0.30319:
    full_name: Microsoft Visual C++ 2010  x64 Redistributable - 10.0.30319
    installer: salt://win/repo-ng/ms-vc10-redistributable-2010/vcredist_x64.exe
    install_flags: '/norestart /q'
    uninstaller: salt://win/repo-ng/ms-vc10-redistributable-2010/vcredist_x64.exe
    uninstall_flags: '/uninstall /norestart /q'
    msiexec: False
    locale: en_US
    reboot: False    