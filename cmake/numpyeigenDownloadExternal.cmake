################################################################################
include(DownloadProject)

# With CMake 3.8 and above, we can hide warnings about git being in a
# detached head by passing an extra GIT_CONFIG option
if(NOT (${CMAKE_VERSION} VERSION_LESS "3.8.0"))
    set(NUMPYEIGEN_EXTRA_OPTIONS "GIT_CONFIG advice.detachedHead=false")
else()
    set(NUMPYEIGEN_EXTRA_OPTIONS "")
endif()

# Shortcut function
function(numpyeigen_download_project name)
    download_project(
        PROJ         ${name}
        SOURCE_DIR   ${NUMPYEIGEN_EXTERNAL}/${name}
        DOWNLOAD_DIR ${NUMPYEIGEN_EXTERNAL}/.cache/${name}
        QUIET
        ${NUMPYEIGEN_EXTRA_OPTIONS}
        ${ARGN}
    )
endfunction()

################################################################################


## Eigen
function(numpyeigen_download_eigen)
    numpyeigen_download_project(eigen
        URL           http://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2
        URL_MD5       05b1f7511c93980c385ebe11bd3c93fa
    )
endfunction()


function(numpyeigen_download_pybind11)
    numpyeigen_download_project(pybind11
        GIT_REPOSITORY https://github.com/fwilliams/pybind11/
        GIT_TAG        numpy-hacks
    )
endfunction()