describe('user login', () => {
  it('Should login a created user with the correct credentials', () => {
    cy.visit('/login');

    cy.get('form').find('input#email').type('garrickhenne@outlook.com');
    cy.get('form').find('input#password_digest').type('password');
    cy.get('form').find('[type=submit]').click();

    cy.contains('Signed in as Garrick');
  });
});

describe('Registration view', () => {
  it('Should create a user with valid inputs', () => {
    cy.visit('/signup');

    cy.get('form').find('#user_first_name').type('test');
    cy.get('form').find('#user_last_name').type('test');
    cy.get('form').find('#user_email').type('test@tester.com');
    cy.get('form').find('#user_password').type('password');
    cy.get('form').find('[type=submit]').click();

    cy.contains('Signed in as test');
  });
});