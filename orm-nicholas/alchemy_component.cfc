component persistent="true" {
  property string id;
  property
            name =          'effects'
            fieldtype =     'one-to-many'
            cfc =           'alchemy_connector'
            fkcolumn =      'fk_component'
            inverse =       'true';
}