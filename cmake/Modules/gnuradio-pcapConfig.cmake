find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_PCAP gnuradio-pcap)

FIND_PATH(
    GR_PCAP_INCLUDE_DIRS
    NAMES gnuradio/pcap/api.h
    HINTS $ENV{PCAP_DIR}/include
        ${PC_PCAP_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_PCAP_LIBRARIES
    NAMES gnuradio-pcap
    HINTS $ENV{PCAP_DIR}/lib
        ${PC_PCAP_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-pcapTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_PCAP DEFAULT_MSG GR_PCAP_LIBRARIES GR_PCAP_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_PCAP_LIBRARIES GR_PCAP_INCLUDE_DIRS)
