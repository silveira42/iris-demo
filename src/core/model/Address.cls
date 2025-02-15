Class core.model.Address Extends %Library.SerialObject
{

Property Street As %Library.String;

Property Number As %Library.Integer;

Property Complement As %Library.String;

Property City As %Library.String;

Property State As %Library.String;

Property Country As %Library.String;

Property PostalCode As %Library.String;

Property CreatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property UpdatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property DeletedAt As %Library.TimeStamp;

Storage Default
{
<Data name="AddressState">
<Value name="1">
<Value>Street</Value>
</Value>
<Value name="2">
<Value>Number</Value>
</Value>
<Value name="3">
<Value>Complement</Value>
</Value>
<Value name="4">
<Value>City</Value>
</Value>
<Value name="5">
<Value>State</Value>
</Value>
<Value name="6">
<Value>Country</Value>
</Value>
<Value name="7">
<Value>PostalCode</Value>
</Value>
<Value name="8">
<Value>CreatedAt</Value>
</Value>
<Value name="9">
<Value>UpdatedAt</Value>
</Value>
<Value name="10">
<Value>DeletedAt</Value>
</Value>
</Data>
<State>AddressState</State>
<StreamLocation>^core.model.AddressS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
