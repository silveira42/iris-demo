Class core.model.Customer Extends %Library.SerialObject
{

Property Name As %Library.String;

Property DeliveryCEP As %Library.String;

Property CreatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property UpdatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property DeletedAt As %Library.TimeStamp;

Storage Default
{
<Data name="CustomerState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>DeliveryCEP</Value>
</Value>
<Value name="3">
<Value>CreatedAt</Value>
</Value>
<Value name="4">
<Value>UpdatedAt</Value>
</Value>
<Value name="5">
<Value>DeletedAt</Value>
</Value>
</Data>
<State>CustomerState</State>
<StreamLocation>^core.model.CustomerS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
