# Drivers
  - [Check Arch Wiki For Compatibility](https://wiki.archlinux.org/title/DaVinci_Resolve)
  - Everything is an easy install with AUR Helper (paru or yay)

# Install
  - [Download Davinci Resolve Installer](https://www.blackmagicdesign.com/products/davinciresolve)
  - You might need the installer

## Davinci Resolve

```
paru -S davinci-resolve
```

## Davinci Resolve Studio

```
paru -S davinci-resolve-studio
```

# Fix Compatibility Issues
- Install the following packages

```
libxcrypt-compat libcurl libcurl-devel mesa-libGLU --allowerasing
```

# Optimize
- You might notice some performance improvements

```
cd /opt/resolve/libs && sudo mkdir disabled-libraries && sudo mv libglib* libgio* libgmodule* disabled-libraries
```
