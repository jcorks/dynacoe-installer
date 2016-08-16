Dynacoe: Installers
===================

Johnathan Corkery, 2016

*** For errors with the installers, please post them as tickets here rather than on the Dynaoce 
project 
page. Thanks! ***

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

    

Supported platforms:
    - Windows
    - Debian
    
    
    
Windows
-------
For windows users an MSI is available for Vista and later. The installer, while tiny itself,
will install for you [MSYS2](https://msys2.github.io/) to then be able to use all the assets in a uniform 
way, as many of them were designed to be used in a unix-like envornment.

To build the installer, you'll need a version of the WiX Toolset, preferrably above 3.0.




Debian (and Debian-based distributions)
---------------------------------------

Still in the planning phases, but will be relatively simple. Aside from setting up the 
scripts and paths, it will install prereq packages to run the stable main build.

