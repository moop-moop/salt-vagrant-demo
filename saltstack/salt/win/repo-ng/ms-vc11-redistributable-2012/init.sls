ms-vc11-redistributable-2012:
  11.0.61030.0:
      full_name: Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030
      installer: salt://win/repo-ng/ms-vc11-redistributable-2012/vcredist_x64.exe
      install_flags: '/quiet /norestart'
      uninstaller: salt://win/repo-ng/ms-vc11-redistributable-2012/vcredist_x64.exe
      uninstall_flags: '/uninstall /quiet /norestart'
      msiexec: False
      locale: en_US
      reboot: False