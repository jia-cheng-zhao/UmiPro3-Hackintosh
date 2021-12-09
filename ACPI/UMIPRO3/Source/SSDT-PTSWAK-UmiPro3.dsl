// Necessary hotpatch
// Reference: https://github.com/daliansky/OC-little/ by daliansky
// Overriding _PTS and _WAK
// In config ACPI, _PTS to ZPTS(1,N)
// Find:     5F50545301
// Replace:  5A50545301
//
// In config ACPI, _WAK to ZWAK(1,N)
// Find:     5F57414B01
// Replace:  5A57414B01

DefinitionBlock("", "SSDT", 2, "OCLT", "PTSWAK", 0x00000000)
{
    External(ZPTS, MethodObj)
    External(ZWAK, MethodObj)
    External(EXT3, MethodObj)
    External(DGPU._ON_, MethodObj)
    External(DGPU._OFF, MethodObj)
    
    Method (_PTS, 1, NotSerialized) //Method (_PTS, 1, NoSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (\DGPU._ON))
            {
                \DGPU._ON ()
            }
        }
        \ZPTS(Arg0)
    }
    Method (_WAK, 1, NotSerialized) //Method (_WAK, 1, NoSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (\DGPU._OFF))
            {
                \DGPU._OFF ()
            }
            If (CondRefOf(EXT3))
            {
                EXT3(Arg0)
            }
        }
        Local0 = ZWAK(Arg0)
        Return (Local0)
    }
}