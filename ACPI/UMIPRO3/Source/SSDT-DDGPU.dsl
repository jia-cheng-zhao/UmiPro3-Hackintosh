// Necessary hotpatch
// Reference: https://github.com/daliansky/OC-little/ by daliansky
// For disabling the discrete GPU on UmiPro3 CometLake

DefinitionBlock ("", "SSDT", 2, "OCLT", "DDGPU", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)
    External (_SB_.PCI0.PEG0.PEGP._ON_, MethodObj)

    Scope (\)
    {
        Device (DGPU)
        {
            Name (_HID, "DGPU1000")  // _HID: Hardware ID
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (_OSI ("Darwin"))
                {
                    _OFF ()
                }
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
                {
                    \_SB.PCI0.PEG0.PEGP._OFF ()
                }
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                If (CondRefOf (\_SB.PCI0.PEG0.PEGP._ON))
                {
                    \_SB.PCI0.PEG0.PEGP._ON ()
                }
            }
            
            Method (_STA, 0, NotSerialized)  // _STA: Status
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