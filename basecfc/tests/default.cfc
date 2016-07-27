component extends="testbox.system.BaseSpec" {
  function beforeAll() {
    addMatchers({
               toBeJSON = function( expectation, args={}) { return isJSON( expectation.actual ); },
            notToBeJSON = function( expectation, args={}) { return !isJSON( expectation.actual ); },
         toHaveFunction = function( expectation, args={}) { return structKeyExists( expectation.actual, args[1] ); },
      notToHaveFunction = function( expectation, args={}) { return !structKeyExists( expectation.actual, args[1] ); },
         toBeInstanceOf = function( expectation, args={}) { return isInstanceOf( expectation.actual, args[1] ); },
      notToBeInstanceOf = function( expectation, args={}) { return !isInstanceOf( expectation.actual, args[1] ); }
    });
  }

  function run() {
    describe( "Test helper methods.", function() {
      beforeEach( function( currentSpec ) {
        obj = entityNew( "test" );
        obj.save({ name="helperMethods" });
        entitySave( obj );
      });

      afterEach( function( currentSpec ) {
        structDelete( variables, "obj" );
      });

      it( "Expects toString() to return a json representation of the entity.", function() {
        expect( obj.toString())
          .toBeString()
          .notToBeNULL()
          .toBeJSON();
      });

      it( "Expects toString() to contain all properties of the entity.", function() {
        expect( obj.toString())
          .toInclude( '"sortorder"' )
          .toInclude( '"id"' )
          .toInclude( '"deleted"' )
          .toInclude( '"name"' );
      });

      it( "Expects propertyExists() to return true when the entity has the provided property and false when it doesn't.", function() {
        expect( obj.propertyExists( "name" ))
          .toBeBoolean()
          .toBeTrue();
        expect( obj.propertyExists( "droids" ))
          .toBeBoolean()
          .toBeFalse();
      });

      it( "Expects getInheritedProperties() to return a struct containing all inherited properties of the entity.", function() {
        expect( obj.getInheritedProperties())
          .toBeStruct()
          .toHaveKey( 'entitiesInSubfolder' )
          .toHaveKey( 'id' )
          .toHaveKey( 'name' )
          .toHaveKey( 'deleted' )
          .toHaveKey( 'sortorder' )
          .notToHaveKey( 'droid' );
      });

      it( "Expects getEntityName() to return the name of the entity.", function() {
        expect( obj.getEntityName())
          .toBeString()
          .toBe( "test" )
          .notToMatch( "^.+\.test" )
          .notToBe( "droid" );
      });

      it( "Expects getClassName() to return the full CFC name/path of the entity.", function() {
        expect( obj.getClassName())
          .toBeString()
          .toBe( "root.model.test" )
          .notToBe( "droid" );

        var other = entityNew( "other" );

        expect( other.getClassName())
          .toBeString()
          .toBe( "root.model.sub.other" )
          .notToBe( "droid" );
      });

      it( "Expects getReverseField() to return the field linking two entities together.", function() {
        // test one-to-many
        expect( obj.getReverseField( "root.model.multiple", "testid" ))
          .toBeString()
          .toBe( "multiple" );

        // test many-to-one
        expect( obj.getReverseField( "root.model.more", "moreid" ))
          .toBeString()
          .toBe( "more" );

        expect( function() {
          obj.getReverseField( "root.model.more", "moreid" );
        }).notToThrow();

        expect( function() {
          obj.getReverseField( "root.model.more", "notAnExistingFK" );
        }).toThrow( type="basecfc.getReverseField", regex="no reverse field found" );
      });

      it( "Expects getReverseField() to work on sub folders.", function() {
        // root to sub folder (one-to-many)
        expect( obj.getReverseField( "root.model.sub.other", "testid" ))
          .toBeString()
          .toBe( "entityInSubfolder" );

        // from sub folder to root (many-to-one)
        var other = entityNew( "other" );

        expect( other.getReverseField( "root.model.test", "testid" ))
          .toBeString()
          .toBe( "test" );
      });

      it( "Expects getReverseField() to work with multiple FKs of the same name.", function() {
        // test another link to same entity, different fk
        expect( obj.getReverseField( "root.model.more", "duplicateid" ))
          .toBeString()
          .toBe( "duplicate" )
          .notToBe( "more" );

        // test many-to-one
        expect( obj.getReverseField( "root.model.more", "moreid" ))
          .toBeString()
          .toBe( "more" )
          .notToBe( "duplicate" );
      });
    });


    describe( "Test basic save function.", function() {
      beforeEach( function( currentSpec ) {
        obj = entityNew( "test" );
        obj.save({ name="InvalidNameBasicSave" });
        entitySave( obj );
      });

      afterEach( function( currentSpec ) {
        structDelete( variables, "obj" );
      });

      it( "Expects save() to return the entity", function() {
        expect( obj.save())
          .toBeTypeOf( 'component' )
          .toBeInstanceOf( 'root.model.test' );
      });

      it( "Expects save({name='test'}) to change name (a string) to 'test'", function() {
        expect( obj.getName())
          .toBe( 'InvalidNameBasicSave' );

        var saveData = {
          name="test"
        };

        var alteredObj = obj.save( saveData );

        expect( alteredObj.getName())
          .toBe( 'test' )
          .notToBe( 'InvalidNameBasicSave' );
      });

      it( "Expects save() to prioritize first level values", function() {
        var more = entityNew( "more" ).save({
          name  = "more",
          tests = [
            {
              testid = obj.getID(),
              name = "renamed"
            }
          ]
        });

        entitySave( more );

        obj.save({
          "name" = "prio name",
          "more" = more
        });

        expect( obj.getName())
          .toBe( "prio name" )
          .notToBe( "renamed" );
      });
    });

/*
    describe( "Test save function with one-to-many relations.", function() {
      beforeEach( function( currentSpec ) {
        transaction {
          obj = entityNew( "test" );
          obj.save({ name="InvalidName" });
          entitySave( obj );
        }
      });

      afterEach( function( currentSpec ) {
        structDelete( variables, "obj" );
      });

      it( "Expects save({add_data=obj}) to be able to add a one-to-many object using object", function() {
        var other = entityNew( "other" );
        entitySave( other );

        var saveData = {
          add_entityInSubfolder = other
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        expect( savedEntitiesInSubfolder )
          .toBeArray()
          .toHaveLength( 1 );

        expect( savedEntitiesInSubfolder[1] )
          .toBe( other );
      });

      it( "Expects save({add_data=123}) to be able to add a one-to-many object using pk", function() {
        var other = entityNew( "other" );
        entitySave( other );

        var saveData = {
          add_entityInSubfolder = other.getID()
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        expect( savedEntitiesInSubfolder)
          .toBeArray()
          .toHaveLength( 1 );

        expect( savedEntitiesInSubfolder[1] )
          .toBe( other );
      });

      it( "Expects save({add_data={id:123}}) to be able to add a one-to-many object using pk in struct", function() {
        var other = entityNew( "other" );
        entitySave( other );

        var saveData = {
          add_entityInSubfolder = { id = other.getID()}
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        expect( savedEntitiesInSubfolder)
          .toBeArray()
          .toHaveLength( 1 );

        expect( savedEntitiesInSubfolder[1] )
          .toBe( other );
      });

      it( "Expects save({add_data='{id:123}'}) to be able to add a one-to-many object using pk in json", function() {
        var other = entityNew( "other" );
        entitySave( other );

        var saveData = {
          add_entityInSubfolder = serializeJSON({ id = other.getID()})
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        expect( savedEntitiesInSubfolder)
          .toBeArray()
          .toHaveLength( 1 );

        expect( savedEntitiesInSubfolder[1] )
          .toBe( other );
      });

      it( "Expects save({add_data={name='test'}}) to be able to add a NEW one-to-many object", function() {
        var saveData = {
          add_entityInSubfolder = {
            name = "MyNewObject",
            moreother = {
              name = "testMore"
            }
          }
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        expect( savedEntitiesInSubfolder )
          .toBeArray()
          .toHaveLength( 1 );

        expect( savedEntitiesInSubfolder[1].getName())
          .toBe( "MyNewObject" );
      });

      it( "Expects save({add_data=[data]}) to be able to add multiple one-to-many objects", function() {
        var first = entityNew( "other" ).save({name="first"}); entitySave( first );
        var second = entityNew( "other" ).save({name="second"}); entitySave( second );

        var saveData = {
          add_entityInSubfolder = [
            { id = first.getID()},
            second.getID()
          ]
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        expect( savedEntitiesInSubfolder )
          .toBeArray()
          .toHaveLength( 2 );

        expect( savedEntitiesInSubfolder[1] )
          .toBe( first );

        expect( savedEntitiesInSubfolder[2] )
          .toBe( second );
      });

      it( "Expects save({set_data=[data]}) to replace all items in a one-to-many relation", function() {
        var first = entityNew( "other" ).save({ name = "first" });
        entitySave( first );

        var second = entityNew( "other" ).save({ name = "second" });
        entitySave( second );

        var third = entityNew( "other" ).save({ name = "third" });
        entitySave( third );

        var saveData = {
          "entitiesInSubFolder" = [ first, second ]
        };

        var saved = obj.save( saveData );
        var savedEntitiesInSubfolder = saved.getEntitiesInSubfolder();

        ormFlush(); // write to database, so added items can be found in next test

        expect( savedEntitiesInSubfolder )
          .toBeArray()
          .toHaveLength( 2 );
        expect( savedEntitiesInSubfolder[1] )
          .toBe( first );
        expect( savedEntitiesInSubfolder[2] )
          .toBe( second );

        var overwriteData = {
          "entitiesInSubFolder" = [ third ]
        };

        var newSave = obj.save( overwriteData );
        var savedEntitiesInSubfolder = newSave.getEntitiesInSubfolder();

        ormFlush(); // write to database, so added items can be found in next test

        expect( savedEntitiesInSubfolder )
          .toBeArray()
          .toHaveLength( 1 );
        expect( savedEntitiesInSubfolder[1] )
          .toBe( third );
      });

      it( "Expects set_ to overwrite add_ in save()", function() {
        var testObjects = [
          entityNew( "multiple" ).save({name="a"}),
          entityNew( "multiple" ).save({name="b"}),
          entityNew( "multiple" ).save({name="c"})
        ];

        for( testObject in testObjects ) {
          entitySave( testObject );
        }

        obj.save({
          set_multiples = [ testObjects[1], testObjects[2] ],
          add_multiple = testObjects[3]
        });

        var result = obj.getMultiples();

        expect( result )
          .toBeTypeOf( "array" )
          .toHaveLength( 2 );

        expect( result[1].getName())
          .toBe( "a" );

        expect( result[2].getName())
          .toBe( "b" );
      });
    });

    describe( "Test save function with many-to-one relations.", function() {
      beforeEach( function( currentSpec ) {
        obj = entityNew( "test" );
        obj.save({ name="InvalidName" });
        entitySave( obj );
      });

      afterEach(function( currentSpec ) {
        structDelete( variables, "obj" );
      });

      it( "Expects save({data=obj}) to be able to add a many-to-one object using object", function() {
        var more = entityNew( "more" );
        entitySave( more );

        var savedMore = entityLoadByPK( "more", more.getID());
        var saveData = {
          more = savedMore
        };
        var saved = obj.save( saveData );

        expect( saved ).notToBeNull();

        expect( saved.getMore())
          .notToBeNull();

        expect( saved.getMore().getID())
          .toBe( savedMore.getID());
      });

      it( "Expects save({data=123}) to be able to add a many-to-one object using pk", function() {
        var more = entityNew( "more" );
        entitySave( more );

        var saveData = {
          more = more.getID()
        };

        var saved = obj.save( saveData );

        expect( saved.getMore())
          .toBe( more );
      });

      it( "Expects save({data={id=123}}) to be able to add a many-to-one object using pk in struct", function() {
        var more = entityNew( "more" );
        entitySave( more );

        var saveData = {
          more = { id = more.getID()}
        };

        var saved = obj.save( saveData );

        expect( saved.getMore().getID())
          .toBe( more.getID());
      });

      it( "Expects save({data='{id:123}'}) to be able to add a many-to-one object using pk in json", function() {
        var more = entityNew( "more" );
        entitySave( more );

        var saveData = {
          more = serializeJSON({ id = more.getID()})
        };

        var saved = obj.save( saveData );

        expect( saved.getMore())
          .toBe( more );
      });

      it( "Expects save({data={name='test'}}) to be able to add a NEW many-to-one object", function() {
        var saveData = {
          more = {
            name = "newMore",
            deeper = {
              name = "deeper"
            }
          }
        };

        var saved = obj.save( saveData );
        var more = saved.getMore();

        expect( more )
          .notToBeNULL()
          .toBeInstanceOf( "root.model.more" )
          .toHaveFunction( "getName" );

        expect( more.getName())
          .toBe( "newMore" );

        // test the reverse link:
        var linkBack = more.getTests();
        expect( linkBack )
          .toBeArray()
          .toHaveLength( 1 );
        expect( linkBack[1] )
          .toBe( saved );

        // also check one level deeper:
        var deeper = more.getDeeper();
        expect( deeper.getName())
          .toBe( "deeper" );

        // test the reverse link:
        var deeperLinkBack = deeper.getMores();
        expect( deeperLinkBack )
          .toBeArray()
          .toHaveLength( 1 );
        expect( deeperLinkBack[1] )
          .toBe( more );
      });
    });

    describe( "Test save function with many-to-many relations.", function() {
      it( "Expects save() to work with many-to-many relations", function(){
        transaction {
          var sideA = entityNew( "multiple" ).save({name="sideA"}); entitySave( sideA );
          var sideB = entityNew( "multiple" ).save({name="sideB"}); entitySave( sideB );

          sideA.save({
            multiplesB = [ sideB ]
          });
        }

        entityReload( sideA );
        entityReload( sideB );

        expect( sideA.getMultiplesB())
          .toBeTypeOf( "array" )
          .toHaveLength( 1 );

        expect( sideA.getMultiplesB()[1] )
          .toBeTypeOf( "component" );

        expect( sideB.getMultiplesA())
          .toBeTypeOf( "array" )
          .toHaveLength( 1 );

        expect( sideB.getMultiplesA()[1] )
          .toBeTypeOf( "component" );
      });
    });
 */

  }
}