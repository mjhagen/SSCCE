component persistent="true"
{
    property name="id" fieldtype="id" column="id" generator="identity" setter="false";
    property name="title" type="string" length="50";
    // one list can have many rows
       property name="rows" fieldtype="one-to-many" cfc="model.row" fkcolumn="fk_listID" type="array" singularname="row" orderby="id asc" inverse="true";
}