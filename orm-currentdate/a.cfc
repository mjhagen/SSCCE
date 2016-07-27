component persistent=true {
  property id;
  property name;
  property name="rightnow" sqltype="timestamp"
                              null=false
                         dbdefault="CURRENT_TIMESTAMP";
}