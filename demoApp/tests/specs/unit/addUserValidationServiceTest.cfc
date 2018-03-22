/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.addUserValidationService"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		
		// setup the model
		super.setup();
		
		// init the model object
		model.init();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "addUserValidationService Suite", function(){
			
			it( "should validateinsertController", function(){
				expect( false ).toBeTrue();
			});

			it( "should validateAllFields", function(){
				expect( false ).toBeTrue();
			});

			it( "should validateFirstName", function(){
				expect( false ).toBeTrue();
			});

			it( "should validateEmail", function(){
				expect( false ).toBeTrue();
			});

			it( "should validatePhoneNumber", function(){
				expect( false ).toBeTrue();
			});

			it( "should validateSubject", function(){
				expect( false ).toBeTrue();
			});


		});

	}

}
