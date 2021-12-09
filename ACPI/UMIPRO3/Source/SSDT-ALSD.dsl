// Necessary hotpatch
// Reference: https://github.com/daliansky/OC-little/ by daliansky
// Force open ALSP

DefinitionBlock ("", "SSDT", 2, "OCLT", "ALSD", 0x00000000)
{
    External (ALSE, IntObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            ALSE = 2
        }
    }
}