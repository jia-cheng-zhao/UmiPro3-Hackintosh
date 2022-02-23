// NOT Necessary hotpatch
// Reference: https://github.com/daliansky/OC-little/ by daliansky
// Disable RP21.PXSX (the Second NVME slot)

DefinitionBlock ("", "SSDT", 2, "OCLT", "noRPxx", 0x00000000)
{
    External (_SB_.PCI0.RP21, DeviceObj)

    Scope (\_SB.PCI0.RP21)
    {
        OperationRegion (DE01, PCI_Config, 0x50, 1)
        Field (DE01, AnyAcc, NoLock, Preserve)
        {
                ,   4, 
            DDDD,   1
        }
        //possible start
        Method (_STA, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
        //possible end
    }
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI0.RP21.DDDD = One
        }
    }
}
//EOF