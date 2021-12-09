// Necessary hotpatch
// Reference: https://github.com/kirainmoe/hasee-tongfang-macos/tree/oc-general/Docs/ by kirainmoe
// Custom USTP

DefinitionBlock ("", "SSDT", 2, "hack", "USTP", 0x00000000)
{
    External(USTP, FieldUnitObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            USTP = One
        }
    }
}

