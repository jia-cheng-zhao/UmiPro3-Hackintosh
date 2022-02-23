// NOT Necessary hotpatch
// Reference: https://github.com/daliansky/OC-little/ by daliansky
// Add PPMC

DefinitionBlock ("", "SSDT", 2, "OCLT", "PPMC", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    
    Scope (\_SB.PCI0)
    {
        Device (PPMC)
        {
            Name (_ADR, 0x001F0002)
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}

