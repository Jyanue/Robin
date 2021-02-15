## @file
#   Robin's Development Kit 
#
#   See the comments in the [LibraryClasses.IA32] and [BuildOptions] sections
#   for important information about configuring this package for your
#   environment.
#
#   Copyright (c) 2019 - 2039, Intel Corporation. All rights reserved.<BR>
#   This program and the accompanying materials
#   are licensed and made available under the terms and conditions of the BSD License
#   which accompanies this distribution. The full text of the license may be found at
#   http://opensource.org/licenses/bsd-license.
#
#   THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#   WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
##

[Defines]
  PLATFORM_NAME                  = RobinPkg
  PLATFORM_GUID                  = 0348cade-8a6e-4ee5-b773-1b2ccbda3e06
  PLATFORM_VERSION               = 0.01
  DSC_SPECIFICATION              = 0x00010006
  OUTPUT_DIRECTORY               = Build/RobinPkg
  SUPPORTED_ARCHITECTURES        = IA32|X64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT

#
#  Debug output control
#
  DEFINE DEBUG_ENABLE_OUTPUT      = FALSE       # Set to TRUE to enable debug output
  DEFINE DEBUG_PRINT_ERROR_LEVEL  = 0x80000040  # Flags to control amount of debug output
  DEFINE DEBUG_PROPERTY_MASK      = 0

[PcdsFeatureFlag]

[PcdsFixedAtBuild]
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|$(DEBUG_PROPERTY_MASK)
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|$(DEBUG_PRINT_ERROR_LEVEL)

[PcdsFixedAtBuild.IPF]

[LibraryClasses]
  #
  # Entry Point Libraries
  #
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  ShellCEntryLib|ShellPkg/Library/UefiShellCEntryLib/UefiShellCEntryLib.inf
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  #
  # Common Libraries
  #
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  !if $(DEBUG_ENABLE_OUTPUT)
    DebugLib|MdePkg/Library/UefiDebugLibConOut/UefiDebugLibConOut.inf
    DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
  !else   ## DEBUG_ENABLE_OUTPUT
    DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  !endif  ## DEBUG_ENABLE_OUTPUT

  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PciCf8Lib|MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  SynchronizationLib|MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  UefiRuntimeLib|MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  UefiHiiServicesLib|MdeModulePkg/Library/UefiHiiServicesLib/UefiHiiServicesLib.inf
  PerformanceLib|MdeModulePkg/Library/DxePerformanceLib/DxePerformanceLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  FileHandleLib|MdePkg/Library/UefiFileHandleLib/UefiFileHandleLib.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf

  ShellLib|ShellPkg/Library/UefiShellLib/UefiShellLib.inf

  CacheMaintenanceLib|MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf

  #lbdebug
	DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf

  # LibCpp|CppPkg/Library/CppLib.inf
  # CppLib|CppPkg/Library/CppLib.inf
###################################################################################################
#
# Components Section - list of the modules and components that will be processed by compilation
#                      tools and the EDK II tools to generate PE32/PE32+/Coff image files.
#
# Note: The EDK II DSC file is not used to specify how compiled binary images get placed
#       into firmware volume images. This section is just a list of modules to compile from
#       source into UEFI-compliant binaries.
#       It is the FDF file that contains information on combining binary files into firmware
#       volume images, whose concept is beyond UEFI and is described in PI specification.
#       Binary modules do not need to be listed in this section, as they should be
#       specified in the FDF file. For example: Shell binary (Shell_Full.efi), FAT binary (Fat.efi),
#       Logo (Logo.bmp), and etc.
#       There may also be modules listed in this section that are not required in the FDF file,
#       When a module listed here is excluded from FDF file, then UEFI-compliant binary will be
#       generated for it, but the binary will not be put into any firmware volume.
#
###################################################################################################

[Components]

#### Sample Applications.
  #luobing add 2013-1-26 22:39:25 
  RobinPkg/Applications/Luo3/Luo3.inf
  RobinPkg/Applications/ShellMain/ShellMain.inf
  RobinPkg/Applications/RngEvent/RngEvent.inf
  RobinPkg/Applications/RngEventX/RngEvent.inf
  RobinPkg/Applications/TryProtocol/TryProtocol.inf
  RobinPkg/Applications/TestServiceDrvSample/TestSDSample.inf
  RobinPkg/Applications/StdMain/StdMain.inf
  RobinPkg/Applications/CppMain/CppMain.inf
 # RobinPkg/Applications/GuiLite/GuiLite.inf
  RobinPkg/Applications/FrameMain/FrameMain.inf
  RobinPkg/Applications/EchoTcp4/EchoTcp4.inf
  RobinPkg/Applications/stdEchoTcp4/stdEchoTcp4.inf
  RobinPkg/Applications/stdEchoUdp4/stdEchoUdp4.inf
  RobinPkg/Applications/ListVariable/ListVariable.inf
  RobinPkg/Applications/TestServiceDrv/TestServiceDrv.inf
  RobinPkg/Applications/Snake/Snake.inf
  
  #luobing add 2019-10-13 20:59:30 
  RobinPkg/Drivers/HiiResourcesSampleDxe/HiiResourcesSampleDxe.inf
  RobinPkg/Drivers/ServiceDrvSample/ServiceDrvSample.inf
	RobinPkg/Drivers/MyWizardDrv01/MyWizardDriver.inf
	RobinPkg/Drivers/ServiceDrv/ServiceDrv.inf
	
  
	# _LuoApp/Luo2/Luo2.inf
	# _LuoApp/Luo3/Luo3.inf
	# _LuoApp/Luo4/Luo4.inf
	# _LuoApp/Luo5/Luo5.inf
	# _LuoApp/roMenu/Luo2.inf
  # _LuoApp/ShellMain/ShellMain.inf
#### A simple fuzzer for OrderedCollectionLib, in particular for
# #### BaseOrderedCollectionRedBlackTreeLib.
#   AppPkg/Applications/OrderedCollectionTest/OrderedCollectionTest.inf {
#     <LibraryClasses>
#       OrderedCollectionLib|MdePkg/Library/BaseOrderedCollectionRedBlackTreeLib/BaseOrderedCollectionRedBlackTreeLib.inf
#       DebugLib|MdePkg/Library/UefiDebugLibConOut/UefiDebugLibConOut.inf
#       DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
#     <PcdsFeatureFlag>
#       gEfiMdePkgTokenSpaceGuid.PcdValidateOrderedCollection|TRUE
#     <PcdsFixedAtBuild>
#       gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x2F
#       gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80400040
#   }

#### Un-comment the following line to build Python 2.7.2.
#  AppPkg/Applications/Python/PythonCore.inf

#### Un-comment the following line to build Python 2.7.10.
# AppPkg/Applications/Python/Python-2.7.10/Python2710.inf

#### Un-comment the following line to build Lua.
#  AppPkg/Applications/Lua/Lua.inf


##############################################################################
#
# Specify whether we are running in an emulation environment, or not.
# Define EMULATE if we are, else keep the DEFINE commented out.
#
# DEFINE  EMULATE = 1

##############################################################################
#
#  Include Boilerplate text required for building with the Standard Libraries.
#
##############################################################################
!include StdLib/StdLib.inc
#  CppPkg/test/testcpp.inf
# !include AppPkg/Applications/Sockets/Sockets.inc