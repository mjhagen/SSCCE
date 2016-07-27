component persistent="true"
{
    property name="id" fieldtype="id" column="id" generator="identity" setter="false";
    property name="title" type="string" length="50";
    // many row entities can have one list entity
       property name="list" fieldtype="many-to-one" cfc="model.list" fkcolumn="fk_listID";
}