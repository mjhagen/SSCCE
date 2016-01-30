component persistent="true" {
  property string id;
  property
            name =          'component'
            fieldtype =     'many-to-one'
            cfc =           'alchemy_component'
            fkcolumn =      'fk_component';
}