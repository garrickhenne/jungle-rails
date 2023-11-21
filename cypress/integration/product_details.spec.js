describe('product page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('should navigate to product page from the home page', () => {
    cy.get('[alt="Scented Blade"]')
      .click();

    cy.get('article.product-detail')
      .find('h1')
      .should('have.text', 'Scented Blade');
  });
});