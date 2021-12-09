//
DefinitionBlock("", "SSDT", 2, "OCLT", "EXT3", 0x00000000)
{
    External(_SB_.LID1, DeviceObj)
    
    Method (EXT3, 1, NotSerialized)
    {   
        If (3 == Arg0)
        {
            If (CondRefOf (\_SB.LID1))
            {
                Notify (\_SB.LID1, 0x80)
            }
        }
    }
}
//EOF
