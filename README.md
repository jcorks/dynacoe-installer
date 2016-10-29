Dynacoe: Installers
===================

Johnathan Corkery, 2016

*** For errors with the installers, please post them as tickets here rather than on the Dynaoce 
project 
page. Thanks! ***

If you're looking for the actual installers, go here http://coebeef.net/dynacoe


The source here is for various installation suites that 
will equip your system with simple tools designed to 
simplify building Dynacoe applications. [The Dynacoe project can be found here.](http://github.com/jcorks/Dynacoe/)




The tools will:
- Provide consistent management and build assets across multiple platorms
- Ensure that your environment contains all prereqs for building 
- Let you easily keep, maintain, and update any number of pre-build or custom-built versions of 
the Dynacoe library
- Prepare your environment with no additional configuration needed
- Organize your Dynacoe assets in a project-oriented way.

    

Tested platforms:
- Windows
- Debian
    
    
    
Windows
-------
For windows users, an MSI installer is available for Vista and later. The installer, while tiny itself,
will pull and install for you [MSYS2](https://msys2.github.io/) to then be able to use all the assets in a uniform 
way, as many of them were designed to be used in a unix-like envornment.

To build the installer, you'll need a version of the WiX Toolset, preferrably above 3.0.


Debian (Debian-based distributions), other Linux
-----------------------

For all *nix systems, there is a minimal installation script that will install dynacoe in a
specified directory. You may encounter errors for missing libraries, but on most systems 
it will be pretty clear whats missing. In such a case, you can use your package manager to resolve 
the missing library.



Still in the planning phases, but there will be a relatively simple deb option. Aside from setting up the 
scripts and paths, it will install prereq packages to run the stable main build.


