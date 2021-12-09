// NOT Necessary hotpatch
// Reference: https://github.com/daliansky/XiaoMi-Pro-Hackintosh/tree/main/ACPI
// Maintained by: stevezhengshiqi
// Disable HPET device by giving value 0 to HPTE

DefinitionBlock ("", "SSDT", 2, "ACDT", "_HPET", 0x00000000)
{
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (HPTE, FieldUnitObj)

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                HPTE = Zero
            }
        }
    }
}