// Necessary hotpatch
// Reference: https://github.com/acidanthera/VoodooPS2/tree/master/Docs/ACPI by VoodooPS2
// Custom PS2Map

DefinitionBlock ("", "SSDT", 2, "ACDT", "RMCF", 0x00000000)
{
    External(_SB_.PCI0.LPCB.PS2K, DeviceObj)
    
    Scope (\_SB.PCI0.LPCB.PS2K)
    {
        If (_OSI ("Darwin"))
        {
            Name (RMCF,Package(0x02) 
            {
                "Keyboard", 
                Package(0x06)
                {
                    "NumLockSupport", 
                    ">y",
                    //"RemapPrntScr", 
                    //">y",
                    "Swap command and option", 
                    ">y", 
                    "Custom PS2 Map", 
                    Package(0x03)
                    {
                        Package(Zero){},
                        "e037=0", // Disable PrtScn
                        "e045=0" // Disable Pause
                    }
                }
            })
        }
    }
}